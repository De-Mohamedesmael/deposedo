<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
class WishListController extends Controller
{
    //

    public function index(){
        $items = Auth::guard('web')->user()->wishlist()->latest()->get();
        // dd($items);
    return view('wishlist',compact('items'));

    }
    public function store(Request $request){
        if(!Auth::guard('web')->check()){
            return response()->json(['status'=>'error','message'=>'من فضلك قم بتسجيل الدخول اولا']);

        }
        if (!Auth::guard('web')->user()->wishlistsHas(request('productId'))){
       
            Auth::guard('web')->user()->wishlist()->attach(request('productId'));
            return response()->json(['status'=>'success','message'=>'تم الاضافة الي المفضله بنجاح']);
        }else{
            return response()->json(['status'=>'error','message'=>'المنتج موجود من قبل في المفضلة']);

        }
    }

    public function destroy(){
        Auth::guard('web')->user()->wishlist()->detach(request('productId'));
        return response()->json(['message'=>'Deleted successfully to your wish list']);

    }
}
