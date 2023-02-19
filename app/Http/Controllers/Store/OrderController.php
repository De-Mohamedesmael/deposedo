<?php

namespace App\Http\Controllers\Store;

use App\Http\Controllers\Controller;
use App\Mail\StatusOrderMail;
use App\Models\Order;
use App\Models\ProductOrder;

use App\Models\ProductOrder as OrderItem;
use App\MyDataTable\MDT_Query;
use Illuminate\Http\Request;
use App\Models\FcmTokenModel;
use App\Models\Notification;

class OrderController extends Controller
{
       use MDT_Query;

      public function index()
    {

        $order_ids=OrderItem::where('student_id',auth()
            ->guard('student')->id())
            ->pluck('order_id')->toarray();
        return $this->MDT_Query_method(// Start Query
            Order::class,
            'store/pages/orders/index',
            false, // Soft Delete
            [
                'with_RS' => ['shipping_address'],

                'condition' => ['wherein' , 'id' , $order_ids],
                'condition2' => ['wherein' , 'status' , ["accept","done","shipping"]],
                'condition3' => ['where' , 'payment_method' , '=' , "knet"],
                ],'order'
            ); // end query

        }
        public function index_cach(){
            $order_ids=OrderItem::where('student_id',auth()
                ->guard('student')->id())
                ->pluck('order_id')->toarray();
            return $this->MDT_Query_method(// Start Query
                Order::class,
                'store/pages/orders/index_cach',
                false, // Soft Delete
                [
                    'with_RS' => ['shipping_address'],
                    'condition' => ['wherein' , 'id' , $order_ids],
                    'condition2' => ['wherein' , 'status' , ["accept","done","shipping"]],
                    'condition3' => ['where' , 'payment_method' , '=' , "cash"],
                    ]
                ); // end query
        }

    public function update(Request $request, $id)
    {

        $order = Order::findOrFail($id);

        $oldStatus = $order->status;

        $order->update($this->columnsDB($request));

        if ($order->status != $oldStatus) {

            $this->notificationUSER($order->user, $order);
            \Mail::to($order->user->email)->send(new StatusOrderMail($order  , $oldStatus));
        }
        if($order->status == 'shipping'){
         if($order->user_id != null){

            $FcmTokenModel= FcmTokenModel::where('user_id',$order->user_id)->first();
                 self::save_notf($FcmTokenModel->fcm_token,false ,'Order',$order->id ,2,$order,$order->user_id);
            }else{
                $old_notf = Notification::where('type_id',$order->id )->where('type','Order')->first();
                if($old_notf){
                  if(count($old_notf->fcm_token) != 0){
                      self::save_notf($old_notf->fcm_token[0],false ,'Order',$order->id ,2);
                    }
                }

            }

        }


        return response(['status' => 'success' , 'message' =>__('form.response.update order')]);

    }


    public function show($id)
    {
        $ids=OrderItem::where('order_id',$id)->where('student_id',auth()
            ->guard('student')->id())
            ->pluck('product_id')->toarray();
        $order = Order::with(['products'=>function($q) use($ids){
            $q->wherein('products.id',$ids);
            }])->findOrFail($id);


        return view('store.pages.orders.show')->with([
            'order' => $order,
            'lang' => app()->getLocale(),
        ]);
    }



    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ..........  Methods Clean Code .............. ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    public function columnsDB($request){


        return [
            'status'         => $request->status,
//            'order_price'    => $request->order_price,
//            'shipping_price' => $request->shipping_price,
//            'total_price'     => $request->total_price,
        ];
    }

    function notificationUSER($user,$order)
    {

        $SERVER_API_KEY = 'AAAANmCdJy0:APA91bHbvtbJpPAFrxm05fiuVXUhOznADwl3aw
25n56J7lmzqIdcrfXH04LKcEOLtVjNTG92p3uwBqIYMhcjVgbWNyN7z_XTWkngRGOT3tyBByJ4eJE_s1pNO6nMqcrN4AV9bzIhN38';

        $data = [
            "registration_ids" => $user->device_token,
            "notification" => [
                "title" => 'update order status',
                "body" => __("aliases.status.$order->status"),
                "sound" => "default" // required for sound on ios
            ],
        ];
        $dataString = json_encode($data);
        $headers = [
            'Authorization: key=' . $SERVER_API_KEY,
            'Content-Type: application/json',
        ];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);
        $response = curl_exec($ch);
        // dd($response);
    }

}
