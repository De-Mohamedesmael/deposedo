<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\NotificationRequest;
use App\Models\Role;
use App\Models\Notification;
use App\Models\User;
use App\MyDataTable\MDT_Method_Action;
use App\MyDataTable\MDT_Query;
use Illuminate\Http\Request;

class NotificationController extends Controller
{

    use MDT_Query , MDT_Method_Action;

    public function __construct()
    {

        $this->middleware('haveRole:notification.index')->only('index');
        $this->middleware('haveRole:notification.create')->only(['create' , 'store']);
        $this->middleware('haveRole:notification.update')->only('update');
        $this->middleware('haveRole:notification.destroy')->only('destroy');
        $this->middleware('haveRole:notification.restore')->only('restore');
        $this->middleware('haveRole:notification.finalDelete')->only('finalDelete');

    }

    public function index()
    {

        return  $this->MDT_Query_method(// Start Query
            Notification::class ,
            'admin/pages/notifications/index',
            false
        ); // end query

    }


    public function create()
    {

        return view('admin.pages.notifications.create');

    }


    public function store(Request $request)
    {
        $validated = $request->validate([
        
            'title_ar'   => ['required' , 'string'  , 'max:50'],
            'title_en'   => ['required' , 'string'  , 'max:50'],
            'note_ar'   => ['required' , 'string'  , 'max:500'],
            'note_en'   => ['required' , 'string'  , 'max:500'],
            'img'       => ['required' , 'image' ,  'max:10000'],
            ]);
            
        
        self::save_notf(null,true ,'Info',null ,2,$request);
        return back()->with('success' , __('form.response.create notification'));

    }

  
    public function show()
    {

        return  $this->MDT_Query_method(// Start Query
            Notification::class ,
            'admin/pages/notifications/pending',
            false, // Soft Delete
            [ // Other Options
                'condition' => ['where' , 'is_active' , '=' , 0],
                'with'      => ['is_trash' => false ],

            ]

        ); // end query

    }


    public function destroy($id)
    {
        return $this->MDT_delete(Notification::class , $id);
    }

 



    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ..........  Methods Clean Code .............. ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    public function columnsDB($request,$user_id){

        $imgName = null;

        $img = $request->file('img');
        if ($img) {
            $imgName = time().$img->getClientOriginalExtension();
            $img->move(public_path('assets/images/notifications') , $imgName);
        }
        return [
            'type'                => 'Info',
            'title_ar'            => $request->title_ar,
            'title_en'           => $request->title_en,
            'body_ar'           => $request->note_en,
            'body_en'            => $request->note_ar,
            'img'       => $imgName ,

        ];
    }
}
