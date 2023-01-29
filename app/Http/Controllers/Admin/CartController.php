<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\MyDataTable\MDT_Query;

class CartController extends Controller
{

    use MDT_Query;

    private $lang;

    public function __construct()
    {

        $this->lang = app()->getLocale();

//        $this->middleware('haveRole:carts.index')->only('index');
//        $this->middleware('haveRole:carts.show')->only('show');
    }

    public function index()
    {

        return $this->MDT_Query_method(// Start Query
            Cart::class,
            'admin/pages/carts/index',
            false, // Soft Delete
            [
                'with_RS' => ['product','user'],
//                'condition' => ['where', 'payment_method', '=', "knet"],
//                'condition2' => ['wherein', 'status', ["accept", "done", "shipping"]],
            ], 'cart'
        ); // end query

    }


    public function show($id)
    {
        $order = Cart::with('')->findOrFail($id);

        return view('admin.pages.orders.show')->with([
            'order' => $order,
            'lang' => $this->lang,
        ]);
    }


}
