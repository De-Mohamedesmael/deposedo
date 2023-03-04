<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Student\StudentRequest;
use App\Mail\AcceptStudentMail;
use App\Models\PackageStudent;
use App\Models\Product;
use App\Models\ProductOrder;
use App\Models\Role;
use App\Models\Student;
use App\Models\User;
use App\MyDataTable\MDT_Method_Action;
use App\MyDataTable\MDT_Query;

class StudentController extends Controller
{

    use MDT_Query , MDT_Method_Action;

    public function __construct()
    {

        $this->middleware('haveRole:student.index')->only('index');
        $this->middleware('haveRole:student.create')->only(['create' , 'store']);
        $this->middleware('haveRole:student.update')->only('update');
        $this->middleware('haveRole:student.destroy')->only('destroy');
        $this->middleware('haveRole:student.restore')->only('restore');
        $this->middleware('haveRole:student.finalDelete')->only('finalDelete');

    }

    public function index()
    {
        $is_trash  = \request()->segment(2) === 'trash';

        return  $this->MDT_Query_method(// Start Query
            Student::class ,
            'admin/pages/students/index',
            $is_trash, // Soft Delete
            [ // Other Options
                'condition' => ['where' , 'is_active' , '=' , 1],
                'with'      => ['is_trash' => $is_trash ],
            ]

        ); // end query

    }


    public function create()
    {

        return view('admin.pages.students.create');

    }


    public function store(StudentRequest $request)
    {

        $student = Student::create($this->columnsDB($request));

        $student->is_active = 1;

        $student->save();
        return back()->with('success' , __('form.response.create student'));

    }

    public function update(StudentRequest  $request, $id)
    {


        $student = Student::withTrashed()
            ->where('id' , $id)
            ->firstOrFail();

        $student->update($this->columnsDB($request ,$student->img));

        return response([
            'status' => 'success',
            'message' =>  __('form.response.update student'),
            'url' => [
                'img' => asset("assets/images/student/$student->img"),
            ]
        ]);
    }

    public function show()
    {

        return  $this->MDT_Query_method(// Start Query
            Student::class ,
            'admin/pages/students/pending',
            false, // Soft Delete
            [ // Other Options
                'condition' => ['where' , 'is_active' , '=' , 0],
                'with'      => ['is_trash' => false ],

            ]

        ); // end query

    }


    public function orders($id){

        $products = ProductOrder::latest()
            ->where('student_id' ,$id)
            ->paginate(24);

        return view('admin.pages.students.orders' , compact('products'));

    }

    public function destroy($id)
    {
        return $this->MDT_delete(Student::class , $id);
    }

    public function restore($id)
    {

        return $this->MDT_restore(Student::class , $id);
    }

    public function finalDelete($id)
    {
        return $this->MDT_finalDelete(Student::class , $id);
    }



    public function reject($id){

        Student::where('id' , $id)->forceDelete();

        return 'Delete Success';
    }

    public function accept($id){

        $student = Student::findOrFail($id);
        $pa=PackageStudent::Active()->where('student_id',$id)->first();
        if($pa){
            $student->is_active = 1;
        }else{
            $student->is_active = 2;
        }

        $student->save();

        \Mail::to($student->email)->send(new AcceptStudentMail($student));

        return 'accept Success';
    }

    public function updatePoints($id){

        $student = Student::findOrFail($id);

        $student->points = (integer) request('points' , 0);

        $student->save();
    }


    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ..........  Methods Clean Code .............. ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    public function columnsDB($request, $oldImage = 'default.svg'){

        $imgName = null;

        $img = $request->file('img');
        if ($img) {
            $imgName = time().$img->getClientOriginalExtension();
            $img->move(public_path('assets/images/student') , $imgName);
        }
        $password = $request->password ? 'password' : '';

        return [
            'name'            => $request->name,
            'email'           => $request->email,
            'phone'           => $request->phone,
            'date'            => $request->date,
            'university'      => $request->university,
            'university_id'   => $request->university_id,
            'major'           => $request->major,
            'is_active'           => 2,
            'img'       => $imgName ?? $oldImage,

            'limit_products'  => $request->limit_products ?? 0,
            $password    => bcrypt($request->password),
        ];
    }
}
