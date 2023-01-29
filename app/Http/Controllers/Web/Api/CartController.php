<?php

namespace App\Http\Controllers\Web\Api;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use Illuminate\Http\Request;
use mysql_xdevapi\Exception;

class CartController extends Controller
{
    public function index(Request $request)
    {
        $carts = Cart::where('user_id',$request->user_id)->orwhere('fcm_token',$request->user_id)->with('product')->latest()->get();

        return response([
            'status' => count($carts) > 0 ? Response_Success : Response_Fail,
            'data' => $carts,
        ]);
    }
    public function store(Request $request)
    {

        try {
            $cart=  Cart::updateOrCreate([
               'user_id'=>$request->user_id,
               'fcm_token'=>$request->fcm_token,
               'product_id'=>$request->product_id,
            ],['amount'=>$request->amount]);



            return response([
                'status' =>$cart? Response_Success : Response_Fail,
                'data' => $cart,
            ]);
        }catch (\Exception $e){
            return response([
                'status' =>    Response_Fail,
                'data' => null,
            ]);
        }
    }
    public function remove(Request $request)
    {
        $cart=  Cart::where('user_id',$request->user_id)->orwhere('fcm_token',$request->user_id)
            ->where('product_id',$request->product_id)->delete();

            return response([
                'status' =>$cart ? Response_Success : Response_Fail,
                'data' => null,
            ]);

    }
    public function removeAll(Request $request)
    {
        $cart=  Cart::where('user_id',$request->user_id)
            ->orwhere('fcm_token',$request->user_id)
            ->delete();

            return response([
                'status' =>$cart ? Response_Success : Response_Fail,
                'data' => null,
            ]);

    }

}
