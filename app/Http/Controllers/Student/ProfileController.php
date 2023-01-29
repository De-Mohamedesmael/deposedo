<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Http\Requests\Student\StudentRequest;
use App\MyDataTable\MDT_UploadImag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    use MDT_UploadImag;

    public function show(){

        $auth = auth('student')->user();

        return view('student.pages.profile.show' , compact('auth'));

    }

    public function updateInfo(StudentRequest $request)
    {

        auth('student')->user()->update([

            'name'       => $request->name,
            'email'      => $request->email,
            'phone'      => $request->phone,
            'date'       => $request->date,
            'university' => $request->university,
            'university_id' => $request->university_id,
            'major'      => $request->major,
            'instagram'  => $request->instagram,
            'linkedin'   => $request->linkedin,
            'facebook'   => $request->facebook,
            'twitter'    => $request->twitter,

        ]);

        return back()->with('success', 'تم تحيث البيانات بنجاح');

    }


    public function updatePassword(Request $request){

        $user = auth('student')->user();

        if (Hash::check($request->oldPassword , $user->getAuthPassword())) {


            $user->password       = bcrypt($request->newPassword);
            $user->remember_token = '';
            $user->save();


            auth('student')->login($user);

            return back()->with('success', 'تم تغير كلمة المرور بنجاح');

        }


        return back()->withErrors('كلمة المرور القديمة غير صحيحة');

    }


    public function updateImg(Request $request){

        $this->validate($request, [
            'img'   => ['nullable', 'image', 'mimes:jpeg,jpg,png,gif', 'max:20000'],
            'cover' => ['nullable', 'image', 'mimes:jpeg,jpg,png,gif', 'max:20000'],
        ]);

        $user = auth('student')->user();

        $img = $user->img;
        $cover = $user->cover;

        if ($request->img) {

            $img = $request->img;

            $img = $this->MDT_saveImage($img, time() . random_int(10000, 9000000), 'assets/images/student/');

            if ($user->img !== "img_default.jpg") {

                $this->MDT_deleteImage($user->img, 'assets/images/student');
            }

        }

        if ($request->cover) {


            $cover = $request->cover;

            $cover = $this->MDT_saveImage($cover, "cover_".time() . random_int(10000, 9000000), 'assets/images/student/');

            if ($user->cover !== "cover_default.jpg") {

                $this->MDT_deleteImage($user->cover, 'assets/images/student');
            }

        }

        $user->img = $img;
        $user->cover = $cover;
        $user->save();

        return back()->with('success', 'تم تحديث الصور بنجاح');

    }

}
