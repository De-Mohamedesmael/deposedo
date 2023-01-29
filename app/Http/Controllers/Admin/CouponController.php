<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\CouponRequest;
use App\Models\Coupon;
use App\MyDataTable\MDT_Method_Action;
use App\MyDataTable\MDT_Query;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CouponController extends Controller
{

    use MDT_Method_Action , MDT_Query;

    public function __construct()
    {
//        $this->middleware('haveRole:coupon.index')->only('index');
//        $this->middleware('haveRole:coupon.create')->only(['create' , 'store']);
//        $this->middleware('haveRole:coupon.destroy')->only('destroy');

    }

    public function index()
    {

       return $this->MDT_Query_method(
            Coupon::class,
            'admin.pages.coupons.index',
            false
        );

    }


    public function create()
    {


        return  view('admin.pages.coupons.create');
    }


    public function store(CouponRequest $request)
    {
        $Coupon= Coupon::create($this->columnsDB($request));
        self::save_notf(null,true ,'Info', null ,1,$Coupon);
        
        return  back()->with('success' ,__('form.response.create coupon'));
    }


    public function update(CouponRequest $request, $id)
    {

        $coupon = Coupon::findOrFail($id);

        $coupon->update($this->columnsDB($request));

        return response(['status' => 'success' , 'message' => __('form.response.update coupon')]);
    }


    public function destroy($id)
    {
        return $this->MDT_delete(Coupon::class , $id);
    }




    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ..........  Methods Clean Code .............. ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    public function columnsDB($request){

        return [
            'name'        => $request->name,
            'code'        => $request->code,
            'end_date'    => $request->end_date,
            'type_discount'        => $request->type_discount,
            'discount'    => $request->discount,
            'min_price'   => $request->min_price,
            'limit'       => $request->limit,
//            'limit_user'  => $request->limit_user,
            'admin_id'    => auth('admin')->id()
        ];
    }

}
