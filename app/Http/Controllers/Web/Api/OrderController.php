<?php

namespace App\Http\Controllers\Web\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\OrderRequest;
use App\Models\Area;
use App\Models\Coupon;
use App\Models\Option;
use App\Models\OptionValue;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductOrder;
use App\Models\Setting;
use App\Models\ShippingAddress;
use App\Models\ProdColor;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use App\Models\Notification;
use App\Models\FcmTokenModel;
use Illuminate\Support\Facades\Mail;

use function Symfony\Component\Translation\t;
use DB;
class OrderController extends Controller
{
    private $order_price = 0;
    private $products_count = 0;
    private $unique_id;
    private $student_id = null;
    private $product_regular_price = 0;
    private $product_sale_price = 0;
    private $options = [];
    private $optionValueWanted = [];

    public function __construct()
    {
        $this->middleware('auth.guard:web-api')->except('save','shippingTime');

        if(request()->header('auth-token')){

            $this->middleware('auth.guard:web-api')->only('save','shippingTime');

        }
    }

    public function getOrder()
    {

        $order = auth()->user()
            ->orders()
            ->where('id', \request()->id)
            ->with(['products.subCategories', 'shipping_address'])
            ->first();

        return response([
            'status' => $order ? Response_Success : Response_Fail,
            'order' => $order,
        ]);
    }
    public function shippingTime(Request $request)
    {

        $max = Product::wherein('id',$request->products)->max('day_order');

    
        return response(['status' => Response_Success , 'time' => $max]);

    }
    public function getOrders()
    {

        $orders = auth()->user()
            ->orders()
            ->with('products')
            ->orderBy('id', 'desc')
            ->get();

        return response([
            'status' => count($orders) > 0 ? Response_Success : Response_Fail,
            'orders' => $orders,
        ]);
    }

    public function save(Request $request)
    {

        // start save shipping address

        $validator = \Validator::make($request->all(), (new OrderRequest())->rules());

        if ($validator->fails()) {

            return response([
                'status' => Response_Fail,
                'message' => $validator->errors()->all(),
            ]);
        }

        $shipping_address_id = $request->shipping_address_id;

        $area = Area::where('id' , $request->area_id)->first();

        if (!$area) {

            return response([
                'status' => Response_Fail,
                'message' => 'area not found',
            ]);
        }

        if (!$shipping_address_id) { // if not request shipping address id save data

            $shipping_address = $this->saveShippingAddressId($request);

            $shipping_address_id = $shipping_address->id;
        }
        // end save shipping address


        // start order

        if ( $this->foreachProducts($request) === false) {

            return response([
                'status' => Response_Fail,
                'order' => __('There is an error in the quantity entered'),
            ]);
        }

        $order  = $this->saveDataOrder($request , $shipping_address_id , $area);

        ProductOrder::where('order_id', $this->unique_id)->update([

            'order_id' => $order->id
        ]);
        $order = Order::where('id',$order->id)->with('products','shipping_address')->first();
        $first_product=$order->products->first();
        if($first_product){
           $st_pro= DB::table('product_student')->where('product_id',$first_product->id)->first();
            if($st_pro){
               $order->brand_id= $st_pro->student_id;
               $order->save();
            }
        }
        
        return response([
            'status' => Response_Success,
            'order' => $order,
        ]);

        //end order
    }


    private function foreachProducts($request)
    {

        $this->unique_id = random_int(100000, 90000000);

        $products_id = explode(',', $request->products_id);

        $quantity_products = explode(',', $request->quantity_products);

        $optionValue_products = explode('&', $request->optionValue_products);

        $students_id = explode(',', $request->student_id);

        $products = Product::whereIn('id', $products_id)->get(); // get request products

        if ($products->count() <= 0){return false;}

        foreach ($products as $product) {


            // get quantity product
            $quantityProduct = $this->quantity_products($quantity_products, $product);

            // update quantity product and check request quantity

            if ($this->updateQuantityOfProduct($quantityProduct, $product) === false) {

                return false;
            }

            // get option Value id
            $optionValueId = $this->optionValue_products($optionValue_products, $product);

            // update quantity option value and check request quantity
            if ($this->updateQuantityOfOptionValue($optionValueId , $quantityProduct,$product) === false) {

                return false;
            }

            // get price product adn save order;
            $this->priceProductAndUpdateOrderPrice($product, $quantityProduct);

            // get student id
            $this->getStudentId($students_id , $product);

            // save product_order;
            $this->saveProductOrder($product , $quantityProduct);

        }

        return  true;
    }

    private function quantity_products($quantity_products, $product)
    {

        $quantityProduct = null;
        foreach ($quantity_products as $quantity) {

            if (strpos($quantity, "$product->id=>") !== false) {

                $quantityProduct = explode('=>', $quantity)[1];
            }
        }

        return $quantityProduct;
    }

    private function optionValue_products($optionValue_products, $product)
    {

        $optionValueId = null;

        foreach ($optionValue_products as $optionValue) {

            if (strpos($optionValue, "$product->id=>") !== false) {

                $optionValueId = explode('=>', $optionValue)[1];
            }
        }

        return $optionValueId;
    }

    private function updateQuantityOfProduct($quantityProduct, $product)
    {
      if($product->is_clothes){
        $ProdColorQuantity=ProdColor::where('product_id',$product->id)->sum('quantity');

        if($product->quantity != $ProdColorQuantity){
          $product->update([
              'quantity' => $ProdColorQuantity
          ]);
        }
      }

        if ($quantityProduct && $product->quantity >= $quantityProduct) {

            $product->update([
                'quantity' => \DB::raw("quantity-$quantityProduct")
            ]);

            $this->products_count += $quantityProduct;
            return true;
        }

        return false;
    }

    private function updateQuantityOfOptionValue($optionValueId, $quantityProduct,$product)
    {
        // dd($is_clothes);
        if ($optionValueId) {
          if(!$product->is_clothes){
            foreach (explode(',', $optionValueId) as $optionValue) {
              // dd($optionValue);
                $optionValueRow = OptionValue::where('id', $optionValue)->first();

                if ($optionValueRow && $optionValueRow->quantity >= $quantityProduct) {

                    $optionValueRow->quantity = $optionValueRow->quantity - $quantityProduct;
                    $optionValueRow->save();

                } else {
                    return false;
                }
                $this->optionValueWanted[$optionValueRow->id] = $optionValueRow;

                $this->options[] = Option::with('attribute')
                    ->where('id', $optionValueRow->option_id)
                    ->first();
            }

          }else{
            $attr=explode(',', $optionValueId);
            $ProdColor=ProdColor::where('product_id',$product->id)->where('color_id',$attr[1])->where('size_id',$attr[0])->first();
            if ($ProdColor && $ProdColor->quantity >= $quantityProduct) {
                $ProdColor->quantity = $ProdColor->quantity - $quantityProduct;
                $ProdColor->save();
                $this->options[] = Option::with('attribute')
                    ->where('id', $attr[1])
                    ->first();
                $this->options[] = Option::with('attribute')
                    ->where('id', $attr[0])
                    ->first();

            } else {
                return false;
            }

            // dd($ProdColor);
          }

            return true;
        }
    }

    private function priceProductAndUpdateOrderPrice($product, $quantityProduct){

        $optionValueWanted =  end(  $this->optionValueWanted);
        // dd($optionValueWanted);
        if (count($this->options) > 0  && $optionValueWanted != null ) {

            if ($product->in_sale) {

                $this->order_price += $optionValueWanted->sale_price > 0 ? $optionValueWanted->sale_price* $quantityProduct : $optionValueWanted->regular_price* $quantityProduct;

            } else {

                $this->order_price += $optionValueWanted->regular_price * $quantityProduct;
            }

            $this->product_regular_price = $optionValueWanted->regular_price;

            $this->product_sale_price = $optionValueWanted->sale_price > 0  &&  $optionValueWanted->sale_price* $quantityProduct >  $this->product_regular_price ? $optionValueWanted->sale_price* $quantityProduct : 0;


        }
        else {

            if ($product->in_sale) {

                $this->order_price += $product->sale_price > 0 ? $product->sale_price* $quantityProduct : $product->regular_price* $quantityProduct;

            } else {

                $this->order_price += $product->regular_price* $quantityProduct;
            }

            $this->product_regular_price = $product->regular_price ;

            $this->product_sale_price = $product->sale_price ;

        }

        $this->optionValueWanted = [];
    }

    private function getStudentId($students_id , $product){


        foreach ($students_id as $student_id) {


            if (strpos($student_id, "=>$product->id") !== false) {

                $this->student_id =  explode('=>', $student_id)[0];
            }
        }

    }

    private function saveProductOrder($product , $quantityProduct){


        if (Cache::has('points_percentage')){

            $points_percentage = Cache::get('points_percentage');

        } else {

            $points_percentage =  Setting::where('name' , 'points_percentage')->first()->value;

            Cache::put('points_percentage', $points_percentage);
        }


        $end_price = $this->product_sale_price > 0 ? $this->product_sale_price : $this->product_regular_price;

        $points = (($end_price * $points_percentage)/100) * $quantityProduct;

        ProductOrder::create([
               'order_id' => $this->unique_id,
               'product_id' => $product->id,
               'product_name' => $product->name_ar .' | '.$product->name_en,
               'quantity' => $quantityProduct,
               'sale_price' => $this->product_sale_price,
               'regular_price' => $this->product_regular_price,
               'end_price' => $end_price,
               'attributes' => json_encode($this->options),
               'student_id' => $this->student_id,
               'points' => $points,
            ]);


        if ($this->student_id) {

            Student::where('id' , $this->student_id)->update([
                'points' => \DB::raw("points+$points"),
            ]);
        }

        $this->options = [];
        $this->product_regular_price = 0 ;
        $this->product_sale_price = 0;
        $this->student_id = null;


    }

    private function saveDataOrder($request , $shipping_address_id ,$area){

        $discount = $this->coupon($request->coupon_code , $this->order_price);
        return Order::create([
            'products_count' => $this->products_count,
            'shipping_price' => $area->shipping_price,
            'discount' => $discount,
            'order_price' => $this->order_price,
            'payment_method' => $request->payment_method,
            'note' => $request->note,
            'status' => 'pending',
            'shipping_address_id' => $shipping_address_id,
            'total_price' => ($area->shipping_price + $this->order_price) - $discount,
            'user_id' => auth()->id(),
        ]);
    }


    private function saveShippingAddressId($request)
    {

        return ShippingAddress::create([

            'title' => $request->title ?? Carbon::now()->format('Y-m-d'),
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'phone2' => $request->phone2,
            'area_id' => $request->area_id,
            'address' => $request->address,
            'note' => $request->note,
            'lat_and_long' => $request->lat_and_long,
            'user_id' => auth()->id(),
        ]);
    }


    private function coupon($coupon_code , $order_price){

        if ($coupon_code) {


            $coupon = Coupon::where('code' , $coupon_code)
                ->whereDate('end_date' , '>=' , Carbon::now()->format('Y-m-d'))
                ->where('is_active' , 1)
                ->where('min_price' , '<=', $order_price)
                ->first();

            if ($coupon && ($coupon->use < $coupon->limit)) {


                if ($coupon->type_discount === "percentage"):

                    $discount = ( $order_price * $coupon->discount) / 100;

                    return ((integer)$discount > $order_price) ? $order_price : $discount;

                else:

                    $discount = $coupon->discount;

                    return ((integer)$discount > $order_price) ? $order_price : $discount;

                endif;


            }//end  if find coupon adn coupon limit not end

            return  0;
        } // end if find coupon_code in request

        return 0;
    }
    
    public function updateOrder(Request $request)
    {

      $order=Order::whereId($request->order_id)->first();
      if(!$order){
        return response([
            'status' => Response_Fail,
            'order' => __('Order Not Found'),
        ]);

      }
        
      $order->status = 'accept';
      $order->save();
      if($order->shipping_address->email !=null){
        //   invoice
        $data['invoice']=$order;
        $data["email"]=$order->shipping_address->email;
            $from=env('MAIL_FROM_ADDRESS');
        $data["subject"]= 'order';
        
            Mail::send('emails.orderStore', $data, function ($message) use ($data, $from) {
                $message->from($from)->to($data["email"], $data["email"] )
                ->subject($data["subject"]);
             }); 
      }
         
        if($request->fcm_token){
          self::save_notf($request->fcm_token,false ,'Order',$order->id ,1,$type_model=null,$order->user_id);
        }
        // $offerEndingSoon = Product::customSelect(['end_sale'])
      return response([
          'status' => Response_Success,
          'order' => $order,
      ]);

    }
}
