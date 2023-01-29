<?php

namespace App\Http\Controllers\Web\Api;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\ShowNotification;

use App\Models\FcmTokenModel;
use Carbon\Carbon;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
     public function __construct()
    {
        if(request()->header('auth-token')){

            $this->middleware('auth.guard:web-api')->only('index','count','show','save_token');

        }
    }

    public function index(Request $request)
    {
        if(auth()->user()){
            $culom="user_id";
            $value=auth()->user()->id;
        }else{
           $culom="fcm_token";
            $value=$request->fcm_token; 
        }
        // dd($culom);
        $notifications_m= Notification::where($culom,'like','%'.$value.'%')->latest()->get();
        $notifications=[];
        foreach($notifications_m as $notification){
            if(in_array($value,$notification->$culom)){
                array_push($notifications,$notification);

            }
        }
        
        return response([
            'status' => count($notifications) > 0 ? Response_Success : Response_Fail,
            'data' => $notifications,
        ]);
    }
     public function count(Request $request)
    {
        if(auth()->user()){
            $culom="user_id";
            $value=auth()->user()->id;
        }else{
           $culom="fcm_token";
            $value=$request->fcm_token; 
        }
        
        $notifications_m= Notification::where($culom,'like','%'.$value.'%')->get();
        $notifications=[];
        foreach($notifications_m as $notification){
            if(in_array($value,$notification->$culom)){
                if(!$notification->is_read($value)){
                    array_push($notifications,$notification);
 
                }
            }
        }
        return response([
            'status' => Response_Success,
            'data' => count($notifications),
        ]);
    }
     public function show(Request $request)
    {
       
        if(auth()->user()){
            $value=auth()->user()->id;
        }else{
            $value=$request->fcm_token; 
        }
        $old_notifications= ShowNotification::where([
                'notification_id'=>$request->notification_id,
                'user_id'=>$value
            ])->first();
            // dd($old_notifications);
        if($old_notifications){
            return response([
            'status' => Response_Success,
            'data' => 1,
        ]);
        }
        $notifications= ShowNotification::create([
                'notification_id'=>$request->notification_id,
                'user_id'=>$value
            ]);
        return response([
            'status' => Response_Success,
            'data' => 1,
            ]);
        
    }
    public function save_token(Request $request)
    {

        $notifications= FcmTokenModel::where('token',$request->fcm_token)->first();
        if(!$notifications){
          $notifications=  FcmTokenModel::create([
                                "token"=>$request->fcm_token,
                              ]);
                              
            if(auth()->user()){
                $notificationsauth= FcmTokenModel::where('user_id',auth()->user()->id)->delete();
                $notifications->user_id = auth()->user()->id;
                $notifications->save();
             
            }
        }else{
            if(auth()->user()){
                $notificationsauth= FcmTokenModel::where('user_id',auth()->user()->id)->first();
                if($notificationsauth){
                    $notificationsauth->token =$request->fcm_token;
                    $notificationsauth->save();
                }else{
                    $notifications->user_id = auth()->user()->id;
                    $notifications->save();
                }
                
             
            }
        }
        return response([
            'status' => Response_Success,
            'data' => $notifications,
        ]);
    }
}
