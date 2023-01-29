<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductOrder;
use App\Models\Student;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {


        $orders = [];


        Order::latest('id')
            ->where('created_at', '>', Carbon::now()->subWeek())
            ->get(['id', 'created_at'])
            ->groupBy(function ($item) {
                return $item->created_at->format('Y-m-d');
            })->each(function ($value) use (&$orders) {
                $orders [] = $value->count();
            });


        $lastProducts = Product::latest()
            ->take(10)
            ->get();


        $lastOrders = Order::latest()
            ->take(10)
            ->get();

        $topProductsLikes = Product::orderBy('likes_count', 'desc')
            ->take(10)
            ->get();

        $topProductsRating = Product::orderBy('ratings', 'desc')
            ->take(10)
            ->get();
        $totalSoldProducts = ProductOrder::sum('quantity');
        $totalPendingOrders = Order::wherenotin('status', ["accept", "done", "shipping"])->count();
        $payment_received=[];
        $cach_received=[];
        $month=[];
       $y= \request()->has('year') ? request()->year : date('Y');
        for ($m=1; $m<=12; $m++) {
            $month[] = date('F', mktime(0,0,0,$m, 1, date('Y')));

            $cach_received[]=Order::where('payment_method','cash')->wherein('status',['accept','shipping','done'])->whereYear('created_at',$y)->whereMonth('created_at',$m)->sum('total_price');
            $payment_received[]=Order::where('payment_method','knet')->wherein('status',['accept','shipping','done'])->whereYear('created_at',$y)->whereMonth('created_at',$m)->sum('total_price');
            $orders_not_comp[]=Order::whereNotin('status',['accept','shipping','done'])->whereYear('created_at',$y)->whereMonth('created_at',$m)->sum('total_price');
        }

        return view('admin.pages.dashboard.index')->with([
            'cach_received'=>$cach_received,
            'payment_received'=>$payment_received,
            'orders_not_comp'=>$orders_not_comp,
            'month'=>$month,
            'lang' => app()->getLocale(),
            'orders' => array_reverse($orders),
            'products_count' => Product::count(),
            'orders_count' => Order::count(),
            'orders_count_today' => Order::whereDate('created_at', Carbon::today())->count(),
            'orders_price_today' => Order::whereDate('created_at', Carbon::today())->sum('total_price'),
            'orders_price' => Order::sum('total_price'),
            'students_count' => Student::where('is_active', 1)->count(),
            'users_count' => User::count(),
            'last_products' => $lastProducts,
            'last_orders' => $lastOrders,
            'top_products_likes' => $topProductsLikes,
            'top_products_ratings' => $topProductsRating,
            'totalSoldProducts' => $totalSoldProducts,
            'totalPendingOrders' => $totalPendingOrders ,
        ]);
    }

}
