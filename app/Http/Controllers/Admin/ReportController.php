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
use Illuminate\Support\Facades\DB;

class ReportController extends Controller
{

    /**
     * show the  sale report
     *
     * @return view
     */
    public function getSaleReport(Request $request)
    {
        $query = Order::leftjoin('product_order', function ($join) {
            $join->on('orders.id', 'product_order.order_id');
        })
            ->leftjoin('products', function ($join) {
                $join->on('product_order.product_id', 'products.id');
            })
            ->wherein('status', ["accept", "done", "shipping"]);
        if (!empty($request->method_pay)) {
            $query->where('orders.payment_method', $request->method_pay);
        }
        if (!empty($request->start_date)) {
            $query->whereDate('orders.created_at', '>=', $request->start_date);
        }
        if (!empty($request->end_date)) {
            $query->whereDate('orders.created_at', '<=', $request->end_date);
        }
        $transactions =  $query->select(
            DB::raw("SUM(product_order.end_price) as sold_amount"),
            DB::raw('SUM(product_order.quantity) as sold_qty'),
            'products.name_'.app()->getLocale().' as product_name'
        )->groupBy('product_order.product_id')->get();
        return view('admin.pages.dashboard.sale_report')->with(compact(
            'transactions'
        ));

    }

    /**
     * show the daily sale report
     *
     * @return view
     */
    public function getDailySaleReport(Request $request)
    {

        $method = $request->method_pay;
        $year = request()->year;
        $month = request()->month;
        if (empty($year)) {
            $year = Carbon::now()->year;
        }
        if (empty($month)) {
            $month = Carbon::now()->month;
        }
        $start = 1;
        $number_of_day = cal_days_in_month(CAL_GREGORIAN, $month, $year);
        while ($start <= $number_of_day) {
            if ($start < 10) {
                $date = $year . '-' . $month . '-0' . $start;
            } else {
                $date = $year . '-' . $month . '-' . $start;
            }
            $query = Order::wherein('status', ["accept", "done", "shipping"])
                ->whereDate('created_at', $date);


            if (!empty($method)) {
                $query->where('payment_method', $method);
            }

            $sale_data = $query->select(
                DB::raw('SUM(discount) AS total_discount'),
                DB::raw('SUM(order_price) AS total_order_price'),
                DB::raw('SUM(shipping_price) AS total_shipping_price'),
                DB::raw('SUM(total_price) AS total_total_price'),

            )->first();
            $total_discount[$start] = $sale_data->total_discount;
            $total_order_price[$start] = $sale_data->total_order_price;
            $total_shipping_price[$start] = $sale_data->total_shipping_price;
            $total_total_price[$start] = $sale_data->total_total_price;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        return view('admin.pages.dashboard.daily_sale_report', compact(
            'total_discount',
            'total_order_price',
            'total_shipping_price',
            'total_total_price',
            'start_day',
            'year',
            'month',
            'number_of_day',
            'prev_year',
            'prev_month',
            'next_year',
            'next_month',
        ));
    }
    /**
     * show the daily sale report
     *
     * @return view
     */
    public function getMonthlySaleReport(Request $request)
    {

        $method = $request->method_pay;
        $year = request()->year;

        if (empty($year)) {
            $year = Carbon::now()->year;
        }
        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');

        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $query = Order::wherein('status', ["accept", "done", "shipping"])
                ->whereDate('created_at', '>=', $start_date)
                ->whereDate('created_at', '<=', $end_date);
            if (!empty($method)) {
                $query->where('payment_method', $method);
            }

            $total_discount_query =$query->select(
                DB::raw('SUM(discount) AS total_discount'),
                DB::raw('SUM(order_price) AS total_order_price'),
                DB::raw('SUM(shipping_price) AS total_shipping_price'),
                DB::raw('SUM(total_price) AS total_total_price'),
            )->first();

            $total_discount[] = $total_discount_query->total_discount;
            $total_order_price[] = $total_discount_query->total_order_price;
            $total_shipping_price[] = $total_discount_query->total_shipping_price;
            $total_total_price[] = $total_discount_query->total_total_price;
            $start = strtotime("+1 month", $start);
        }
       return view('admin.pages.dashboard.monthly_sale_report', compact(
            'total_discount',
            'total_order_price',
            'total_shipping_price',
            'total_total_price',
            'year',
        ));
    }

}
