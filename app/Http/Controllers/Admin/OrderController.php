<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\StatusOrderMail;
use App\Models\Admin;
use App\Models\FcmTokenModel;
use App\Models\Notification;
use App\Models\Order;
use App\MyDataTable\MDT_Query;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{

    use MDT_Query;

    private $lang;

    public function __construct()
    {

        $this->lang = app()->getLocale();

        $this->middleware('haveRole:order.index')->only('index');
        $this->middleware('haveRole:order.update')->only('update');
        $this->middleware('haveRole:order.show')->only('show');
    }

    public function index()
    {
        $delivery = Admin::where('role_id', 3)->pluck('name', 'id')->all();

        return $this->MDT_Query_method(// Start Query
            Order::class,
            'admin/pages/orders/index',
            false, // Soft Delete
            [
                'with_RS' => ['shipping_address'],
                'with' => ['delivery' => $delivery],
                'condition' => ['where', 'payment_method', '=', "knet"],
                'condition2' => ['wherein', 'status', ["accept", "done", "shipping"]],
            ], 'order'
        ); // end query

    }

    public function index_cach()
    {
        // dd('fff');
        return $this->MDT_Query_method(// Start Query
            Order::class,
            'admin/pages/orders/index_cach',
            false, // Soft Delete
            [
                'with_RS' => ['shipping_address'],
                'condition' => ['where', 'payment_method', '=', "cash"],
                'condition2' => ['wherein', 'status', ["accept", "done", "shipping"]],
            ]
        ); // end query
    }

    public function index_inpaid()
    {
        return $this->MDT_Query_method(// Start Query
            Order::class,
            'admin/pages/orders/index_inpaid',
            false, // Soft Delete
            [
                'with_RS' => ['shipping_address'],
                'condition' => ['wherenotin', 'status', ["accept", "done", "shipping"]],
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
            \Mail::to($order->user->email)->send(new StatusOrderMail($order, $oldStatus));
        }
        if ($order->status == 'shipping') {
            if ($order->user_id != null) {

                $FcmTokenModel = FcmTokenModel::where('user_id', $order->user_id)->first();
                self::save_notf($FcmTokenModel->fcm_token, false, 'Order', $order->id, 2, $order, $order->user_id);
            } else {
                $old_notf = Notification::where('type_id', $order->id)->where('type', 'Order')->first();
                if ($old_notf) {
                    if (count($old_notf->fcm_token) != 0) {
                        self::save_notf($old_notf->fcm_token[0], false, 'Order', $order->id, 2);
                    }
                }

            }

        }


        return response(['status' => 'success', 'message' => __('form.response.update order')]);

    }


    public function show($id)
    {
        $order = Order::with(['products', 'updated_order'])->findOrFail($id);

        return view('admin.pages.orders.show')->with([
            'order' => $order,
            'lang' => $this->lang,
        ]);
    }



    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ..........  Methods Clean Code .............. ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    public function columnsDB($request)
    {


        return [
            'status' => $request->status,
            'last_updated_by' => Auth::user()->id,
//            'order_price'    => $request->order_price,
            'deliveried_by' => $request->deliveried_by,
//            'shipping_price' => $request->shipping_price,
//            'total_price'     => $request->total_price,
        ];
    }

    function notificationUSER($user, $order)
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
