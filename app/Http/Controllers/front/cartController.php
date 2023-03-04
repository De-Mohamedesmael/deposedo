<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use  App\Models\Item;
use  App\Models\Category;
use  App\Models\Slider;
use  App\Models\SubCategory;
use  App\Models\Product;
use  App\Models\ProdColor;
use App\Models\Country;
use App\Models\Area;
use App\Models\Coupon;

use App\Models\ShippingAddress;
use Carbon\Carbon;

use  App\Models\Order;
use  App\Models\ProductOrder as OrderItem;
use Illuminate\Support\Facades\Mail;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use RealRashid\SweetAlert\Facades\Alert;


class cartController extends Controller
{

        public function getCity(Request $request){
//        dd($request->all());
        $city_id = $request->city;

        $govern= Area::where('country_id',$city_id)->get();
//        dd($govern);
        if (!$govern) {
            return response()->json([
                'success' => false,
                'msg' => __('site.Can not find country  !!')
            ]);
        }

        $val = '';
        $delivery = '';
        foreach ($govern as $item){
        $delivery .= '<option value="' . $item->id .'">' . $item->name . '</option>';

        }

        return response()->json([
            'success' => true,
            'delivery' => $delivery
        ]);

    }

        public function getDelivery(Request $request){
         $govern_id = $request->city;
        if (!$govern_id ) {
            return response()->json([
                'success' => false,
                'msg' => __('site.Please Choose City  !!')
            ]);
        }
       $max_days =  Product::wherein('id',$request->product_ids)->max('day_order');
        // dd($max_days);
        $govern=Area::where('id',$govern_id )->first();
       // dd($govern);
        if (!$govern) {
            return response()->json([
                'success' => false,
                'msg' => __('site.Can not find City  !!')
            ]);
        }
          $price=sumALLPriceDelivry($request->product_ids,$govern);
        $val = $price['shipping_price'];
        $val_desk = $price['shipping_price_desk'];
        $total=get_price_helper($request->total + $price['shipping_price']);
        $delivery = get_price_helper($price['shipping_price']);
        $delivery_desk = $price['shipping_price_desk'] >0 ?  get_price_helper($price['shipping_price_desk']):0;
            $centers=null;
            if($govern->wilaya_id){
               $centers= getCenters($govern->wilaya_id)['data'];
               $html='';
               foreach($centers as $center){
                   $html.='<option value="'.$center['center_id'].'" address="'.$center['address'].'" title_a="'.__("site.address_center").'">'.$center['name'].'</option>';
               }
            }
        return response()->json([
            'success' => true,
            'val_p' => $val,
            'val_desk' => $val_desk,
            'centers' => $html,
            'total1' => $total,
            'delivery' => $delivery,
            'delivery_desk' => $delivery_desk,
            'order_day'=>$max_days,
        ]);

    }


    public function go_to_cart(){
        return view ("front.cart.cart");
    }





    public function checkout(){
         $cart = session()->get('cart');

         if($cart==[]){
             Alert::error('error Title', "cart is empty");
          return back();
         }

        return view("front.cart.checkout_en");
    }






    public function remove_from_cart(Request $request)
     {
         if($request->id) {

          $cart = session()->get('cart');

          if(isset($cart[$request->id])) {
          unset($cart[$request->id]);
         session()->put('cart', $cart);

                     }

       session()->flash('success', 'Product removed successfully');
       return redirect()->route("cart.show");
    }
}





     public function update_cart($item_id,$qut,$key,Request $request){
         $cart = session()->get('cart');

         if($cart){

             if(isset($cart[$item_id])) {
                $cart[$item_id][$key]['quantity'] = $qut;
                session()->put('cart', $cart);
             }else{
                return get_response("0","error",1);
             }

         }else{
           return get_response("0","error",0);
         }

         $total = 0;
         session()->put('cart', $cart);
         if(count(session('cart')) > 0){
            foreach(session('cart') as $id => $details){
                foreach ($details as $key2 => $value) {
                  $total += $value['price'] * $value['quantity'] ;

                }
            }
          }
          return get_response("0","error",$total);

     }



    //get method
    public function add_to_cart($item_id,$qut,Request $request){

        $product = Product::findOrFail($item_id);
        return redirect()->route("product",$item_id);
        $cart = session()->get('cart');
        $product = Product::findOrFail($item_id);
        // if cart is empty then this the first product
          if(!$cart) {
                $cart = [
                    $item_id => [
                    "id" => $product->id,
                    "category_id"=>$product->vendor_id,
                    "option_id"=>$request->option_id,
                    "name" => $product->name,
                    "name_en" => $product->name_en,
                    "quantity" => $qut,
                    "price" =>  $product->if_sale ? $product->sale_price :$product->regular_price,
                    "image" => $product->img,
                    "slug" => $product->id
                    ]
                  ];
                  session()->put('cart', $cart);
                return view("front.cart.cart");
                //return redirect()->route("cart")->with('success', 'تم اضافة المنتج الي السلة..');
          }else{
              if(isset($cart[$item_id])  ) {
                    return view("front.cart.cart");

                    //return redirect()->route("cart")->with('success', 'تم اضافة المنتج الي السلة..');

              }else{
                $vendor_id = $product->vendor_id ??0;
//                foreach($cart as $k => $v) {
//                    if($vendor_id != $v["category_id"]){
//                        Alert::error('error Title', "Cart products must be from one Vendor, you can empty the cart");
//                      return back();
//
//                    }
//
//
//                }

                $cart[$item_id] = [
                  "id" => $product->id,
                  "name" => $product->name,
                  "name_en" => $product->name_en,
                  "quantity" => $qut,
                  "price" =>$product->if_sale ? $product->sale_price :$product->regular_price,
                  "image" => $product->img,
                  "category_id"=>$product->vendor_id,
                  "option_id"=>$request->option_id,

                  "slug" => $product->id
                ];
                session()->put('cart', $cart);
                //print_r($cart);
                //die;
                return view("front.cart.cart");

                  return redirect()->route("cart")->with('success', 'تم اضافة المنتج الي السلة..');
                }
              }


    }


    //post method
    public function add_to_cart_post(Request $request){
         $item_id = $request->item_id;
         $qut = $request->qut ;
         if($item_id =="" || $qut == ""){
             return back();
         }
        $cart = session()->get('cart');
        // dd( $cart);
        $product = Product::findOrFail($item_id);
        $attributes =  $request->has('attributes') ?  $request->input('attributes') : null;

        if($attributes){
          if(in_array(0,$attributes)){
            if($request->ajax()){
              return response([
                    'status' => 'error',
                    'data'  => __('site.error_in_attributes') ,
                ]);
            }

            return redirect()->back()->with('error',__('site.error_in_attributes'));

          }
          // $product->
        if($product-> is_clothes == 0){
          foreach ($product->options as $option) {

            if(in_array($option->id,$attributes)){
              if($option->quantity < $request->qut ){
                if($request->ajax()){
                  return response([
                        'status' => 'error',
                        'data'  => __('site.error_in_quantity') ,
                    ]);
                }
                return redirect()->back()->with('error',__('site.error_in_quantity'));
              }
            }
          }
        }else{
          $ProdColor=ProdColor::where('product_id',$product->id)
                                ->where('color_id',$attributes[7])
                                ->where('size_id',$attributes[6])
                                ->where('quantity','>=',$qut)->first();
              if(!$ProdColor){
                  if($request->ajax()){
                    return response([
                          'status' => 'error',
                          'data'  => __('site.error_in_quantity') ,
                      ]);
                  }
                  return redirect()->back()->with('error',__('site.error_in_quantity'));
            }

          }

        }else{
          if($product->quantity < $request->qut){
            if($request->ajax()){
              return response([
                    'status' => 'error',
                    'data'  => __('site.error_in_quantity') ,
                ]);
            }
            return redirect()->back()->with('error',__('site.error_in_quantity'));
          }
        }
      $brand_id = $product->students->first() ? $product->students->first()->id : 0;
        // if cart is empty then this the first product
        if(!$cart) {
            $cart = [
              $item_id =>[
              0 =>[
                  "id" => $product->id,
                  "quantity" => $qut,
                  "price" =>  $product->if_sale ? $product->sale_price :$product->regular_price,// $product->price,
                  "brand_id"=>$brand_id,
                  "attributes"=>$attributes,
                ]
            ]
            ];
            session()->put('cart', $cart);
            // dd( $cart);
            // return view("front.cart.cart");
            if($request->ajax()){
              return response([
                    'status' => 'success',
                    'data'  => __('site.addToCartDone') ,
                ]);
            }
            return redirect()->back()->with('success',__('site.addToCartDone'));
        }else{
            $old_product = Product::whereId($cart[array_key_first($cart)][0]['id'])->First();
//          if($brand_id != $cart[array_key_first($cart)][0]['brand_id']){
//            if($request->ajax()){
//              return response([
//                    'status' => 'error',
//                    'data'  => __('site.error_in_brand') ,
//                ]);
//            }
//              return redirect()->back()->with('error',__('site.error_in_brand'));
//          }
//          if($product->is_order != $old_product->is_order){
//               if($request->ajax()){
//                  return response([
//                        'status' => 'error',
//                        'data'  => __('site.error_is_order'.$product->is_order) ,
//                    ]);
//                }
//                return redirect()->back()->with('error',__('site.error_is_order'.$product->is_order));
//          }



          if(isset($cart[$item_id])) {
            $is_eq=0;
            foreach ($cart[$item_id] as $key =>  $value) {

              if( $attributes == $value['attributes']){
                $is_eq=1;
              $cart[$item_id][$key]['quantity'] = $qut;
                // dd($cart[$item_id]);

              }
              // dd( $cart);
              // dd('false');

            }
            if($is_eq==0){
                $new_cart =[
                "id" => $product->id,
                "quantity" => $qut,
                "price" =>  $product->if_sale ? $product->sale_price :$product->regular_price,// $product->price,
                "brand_id"=>$brand_id,
                "attributes"=>$attributes,
              ];
                  array_push($cart[$item_id],$new_cart);
            }
            session()->put('cart', $cart);
            // dd($cart);
            if($request->ajax()){
              return response([
                    'status' => 'success',
                    'data'  => __('site.addToCartDone') ,
                ]);
            }
            return redirect()->back()->with('success',__('site.addToCartDone'));

          }else{

              $cart[$item_id] = [
                        0 =>[
                          "id" => $product->id,
                          "quantity" => $qut,
                          "price" =>  $product->if_sale ? $product->sale_price :$product->regular_price,// $product->price,
                          "brand_id"=>$brand_id,
                          "attributes"=>$attributes,
                        ]
                      ];
                  session()->put('cart', $cart);
                  if($request->ajax()){
                    return response([
                          'status' => 'success',
                          'data'  => __('site.addToCartDone') ,
                      ]);
                  }
                  return redirect()->back()->with('success',__('site.addToCartDone'));

              }
        }


  }







    public function  checkout_store (Request $request) {
        if(session('cart') and !empty(session('cart'))) {
            $rules = [
                'username' => 'required',
                'phone' => 'required',
                 'country' => 'required',
                 'city' => 'required',
                'address' => 'required',
                'type_delivery' => 'required',

            ];
            $messages= [
            'username.required'  => 'Please enter your username',
            'address.required'  => 'Please enter the address',
            'phone.required'  => 'Please enter the phone',
            'country.required'  => 'Please choosse country ',
            'city.required'  => 'Please enter the city',
            ];

            $valid=Validator::make($request->all(),$rules, $messages);
            if ($valid->fails()) {
                    return back()->with('error',$valid->errors()->first());
            }
            if (!$request->shipping_address_id) {
                $shipping_address = $this->saveShippingAddressId($request);
                $shipping_address_id = $shipping_address->id;
            }
            $discount = $this->coupon($request->coupon_code ,  $request->price);

            $govern=Area::where('id',$request->city )->first();
            $all_val = sumALLPriceDelivry($request->product_ids,$govern);
            $val= $request->type_delivery == 'delivery'?$all_val['shipping_price']:$all_val['shipping_price_desk'];
            $total=($request->price + $val )-$discount;
            $payment_method='cash';

            // dd(Order::first());
            $save = Order::create([
                  "status" =>"accept",
                  "note" =>$request->note,
                  "products_count" => 0,
                  "order_price" => $request->price,
                  "type_delivery" => $request->type_delivery,
                  "shipping_price" => $val,
                  "total_price" => $total,
                  "user_id"=>$request->user_id,
                  "shipping_address_id" => $shipping_address_id,
                  "discount" => $discount,
                  'payment_method'=>$payment_method,
              ]);
              // dd($save);
              if($save){
                  foreach(session('cart') as $k => $items) {
                    foreach ($items as $key => $v) {
                      // code...

                              $product=Product::whereId($k)->first();


                              $student = $product->students->first();
                              $student_id= $student ? $student->id : 0 ;

                              // "sale_price" => 773.0
                              // "regular_price" => 917.0
                                // dd(OrderItem::first());
                              $end_price =  $product->in_sale ? $product->sale_price : $product->regular_price;
                                OrderItem::create([
                                      "product_id"=>  $product->id,
                                      "order_id"=> $save->id,
                                      "product_name"=>$product->name,
                                      "quantity"=>$v["quantity"],
                                      "sale_price"=>$product->sale_price,
                                      "regular_price"=>$product->regular_price,
                                      "attributes"=>  json_encode($v["attributes"]),
                                      "student_id"=>   $student_id,
                                      "end_price"=>$end_price*$v["quantity"],
                                    ]);

                                  $save->increment('products_count',$v["quantity"]);
                                }
                          }

                  $price=OrderItem::where('order_id',$save->id)->sum('end_price');
                  $save->order_price=$price;
                  $save->brand_id= null;
                 if($request->type_delivery != 'delivery'){
                     $save->center_id=$request->center_id;
                  }
                if($save->shipping_address->email !=null){
                    //   invoice
                    $data['invoice']=$save;
                    $data["email"]=$save->shipping_address->email;
                        $from=env('MAIL_FROM_ADDRESS');
                    $data["subject"]= 'order';
                    Mail::send('emails.orderStore', $data, function ($message) use ($data, $from) {
                        $message->from($from)->to($data["email"], $data["email"] )
                        ->subject($data["subject"]);
                     });
                  }
                 $save->save();
                        session()->forget('cart');


                        return view('front.cart.success')->with(['order'=>$save]);

                      }


              }else{
                      return back()->with('error',__('site.cart is empty'));
             }
           }





    public function v2_payment(Request $request,$order_id,$user_id = null){

              $order =  Order::find($order_id);


                $data = $this->makePayment(\Illuminate\Support\Facades\Request::merge(['order_id' => $order->id]));

                        // dd($data);
                $json = json_decode($data->getContent(), true);

                $success =  $json['success'];

                if (!$success) {
                    Alert::error($json['msg'], '');

                    return back();
                }
                //mail here
                //        Mail::send('email.donePay',['name' => $request->name,'order_id'=>$order->id,'total_price'=>$request->total_price,'total_quantity'=>$request->total_quantity,'invoice_link'=>$order->invoice_link], function($message) use($request,$order){
                //            $message->to($request->email)
                //                ->from('sales@easyshop-qa.com', 'Example')
                //            ->subject('Pay done');
                //        });


                return redirect($json['link']);





      }


    public function success_payment($order_id,Request $request){

      //  dd("error");
          $paymentId=$request->paymentId;
            $data=$this->getPaymentStatus($paymentId);

          $order = Order::findOrFail($order_id);
          $json = json_decode($data->getContent(), true);


          if($json['InvoiceStatus'] == "Paid"){
            $order->update([
             "status"=>"accept"

            ]);
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
          }else{
            return redirect()->route('error_payment',$order->id);
          }
          //getPaymentStatus

         return view('front.cart.success')->with(compact('order'));

    }


    /************** payment *********************/

      public function makePayment(Request $request): \Illuminate\Http\JsonResponse
    {

        if (!$request->order_id) {
            response()->json(
                [
                    'success' => false,
                    'msg' => 'Data Not Match Any Order !'
                ]
            );
        }

        $order = Order::find($request->order_id);

        if (!$order) {
            response()->json(
                [
                    'success' => false,
                    'msg' => 'Order is not exist !'
                ]
            );
        }

        //TODO :: GET USER PHONE
        $ShippingAddress=ShippingAddress::find($order->shipping_address_id);
        $country_code =$ShippingAddress->area != null ? ($ShippingAddress->area->country != null ? $ShippingAddress->area->country->code:"+965" ):"+965";
        $name=$ShippingAddress->name?:'Test Name';
        $email=$ShippingAddress->email?:'test@test.com';
        $phone=$ShippingAddress->phone?:'12345678';
        $success_url = route('success_payment',$order->id);
        $error_url = route('error_payment',$order->id);

        //        TODO :: VALIDATION FOR BOOKING  IF  MONEY ALREADY PAID


        /* ------------------------ Configurations ---------------------------------- */
        //Test

        // $password = $live ?env('UPAY_PASSWORD'):stripslashes('test');
        // $api_key = $live ?env('UPAY_API_KEY'):'jtest123';


        // $apiURL = 'https://apitest.myfatoorah.com';
        // $apiKey = 'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
        //Live
        $apiURL = env('API_URL_MYFATOORAH') ;
        $apiKey = env('API_KEY_MYFATOORAH'); //Live token value to be placed here: https://myfatoorah.readme.io/docs/live-token


        /* ------------------------ Call SendPayment Endpoint ----------------------- */

        $order_item = OrderItem::where('order_id', $request->order_id)->get();
        $delivery_cost = $ShippingAddress->area;

        $invoiceItems = array();

            foreach ($order_item as $item) {
                array_push($invoiceItems, [
                    'ItemName'  => $item->product_name, //ISBAN, or SKU
                    'Quantity'  => $item->quantity, //Item's quantity
                    'UnitPrice' => number_format($item->end_price, 3, '.', ''), //Price per item
                ]);
            }







        array_push($invoiceItems, [
            'ItemName'  => "Shippng cost", //ISBAN, or SKU
            'Quantity'  => 1, //Item's quantity
            'UnitPrice' => number_format($order->shipping_price, 3, '.', ''), //Price per item
        ]);

        // dd(






        //Fill POST fields array
        $postFields = [
            //Fill required data
            'NotificationOption' => 'Lnk', //'SMS', 'EML', or 'ALL'
            'InvoiceValue' => $order->total_price,
            'CustomerName' => $name,
            //Fill optional data
            'DisplayCurrencyIso' => 'DZD',
            'MobileCountryCode'  => $country_code,
            'CustomerMobile'     => $phone,
            'CustomerEmail'      => $email ?? "no@gmail.com",
            'CallBackUrl'        => $success_url,
            'ErrorUrl'           =>  $error_url,
            'InvoiceItems'       => $invoiceItems,

        ];

        //Call endpoint
        $data = $this->sendPayment($apiURL, $apiKey, $postFields);
        // dd($data);
        //You can save payment data in database as per your needs
        $invoiceId = $data->InvoiceId;
        $paymentLink = $data->InvoiceURL;

        $order->invoice_id = $invoiceId;
        $order->invoice_link = $paymentLink;
        $order->save();


        return response()->json(
            [
                'success' => true,
                'link' => $paymentLink,
                'data' => $data,
                'order' => $order
            ]
        );
    }


    public function sendPayment($apiURL, $apiKey, $postFields)
    {
        $json = $this->callAPI("$apiURL/v2/SendPayment", $apiKey, $postFields);
        return $json->Data;
    }


    public  function handleError($response)
    {

        $json = json_decode($response);
        if (isset($json->IsSuccess) && $json->IsSuccess == true) {
            return null;
        }

        //Check for the errors
        if (isset($json->ValidationErrors) || isset($json->FieldsErrors)) {
            $errorsObj = isset($json->ValidationErrors) ? $json->ValidationErrors : $json->FieldsErrors;
            $blogDatas = array_column($errorsObj, 'Error', 'Name');

            $error = implode(', ', array_map(function ($k, $v) {
                return "$k: $v";
            }, array_keys($blogDatas), array_values($blogDatas)));
        } else if (isset($json->Data->ErrorMessage)) {
            $error = $json->Data->ErrorMessage;
        }

        if (empty($error)) {
            $error = (isset($json->Message)) ? $json->Message : (!empty($response) ? $response : 'API key or API URL is not correct');
        }

        return $error;
    }

    public   function callAPI($endpointURL, $apiKey, $postFields = [], $requestType = 'POST')
    {

        $curl = curl_init($endpointURL);
        curl_setopt_array($curl, array(
            CURLOPT_CUSTOMREQUEST => $requestType,
            CURLOPT_POSTFIELDS => json_encode($postFields),
            CURLOPT_HTTPHEADER => array("Authorization: Bearer $apiKey", 'Content-Type: application/json'),
            CURLOPT_RETURNTRANSFER => true,
        ));

        $response = curl_exec($curl);
        $curlErr = curl_error($curl);

        curl_close($curl);

        if ($curlErr) {
            //Curl is not working in your server
            die("Curl Error: $curlErr");
        }

        $error = $this->handleError($response);
        if ($error) {
            die("Error: $error");
        }

        return json_decode($response);
    }


    public function getPaymentStatus($payment_id): \Illuminate\Http\JsonResponse
    {


        /* ------------------------ Configurations ---------------------------------- */

        // //Test
        // $apiURL = 'https://apitest.myfatoorah.com';
        // $apiKey = 'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';

        //Live
        $apiURL = env('API_URL_MYFATOORAH') ;
        $apiKey = env('API_KEY_MYFATOORAH'); //Live token value to be placed here: https://myfatoorah.readme.io/docs/live-token


        /* ------------------------ Call getPaymentStatus Endpoint ------------------ */
        //Inquiry using paymentId
        $keyId = $payment_id;
        $KeyType = 'paymentId';


        $postFields = [
            'Key' => $keyId,
            'KeyType' => $KeyType
        ];
        //Call endpoint
        $json = $this->callAPI("$apiURL/v2/getPaymentStatus", $apiKey, $postFields);

        //Display the payment result to your customer
        return response()->json($json->Data);
    }

    //////
    public function callBackUrl(Request $request)
    {
        //        dd($request->all());
        $payment_id = $request->paymentId;


        $invoice_data =  $this->getPaymentStatus($payment_id);
        //        return $invoice_data;
        $invoice_id = $invoice_data->original->InvoiceId;
        $invoice_status = $invoice_data->original->InvoiceStatus;

        //ORDER

        $order = Order::where('invoice_id', $invoice_id)->first();

        if (!$order) {
            //                    dd($request->all());

            Alert::error('Order is not Exist !');
            return redirect()->route('/');
        }
        session()->forget('coupon');

        $order->status = 1;
        $order->save();
        /*
             * order with order_id and price is price paid successfully and delivery is happening
             *
             *
             * */
        // Mail::send('email.donePay', ['name' => $order->name, 'order_id' => $request->paymentId, 'total_price' => $order->total_price, 'total_quantity' => $order->total_quantity, 'invoice_link' => $order->invoice_link], function ($message) use ($order) {
        //     $message->to($order->email)
        //         ->from('sales@easyshop-qa.com', 'Sara Merdas')
        //         ->subject('Pay done');
        // });

        //        Mail::send('email.donePay',['name' => $request->name,'order_id'=>$order->id,'total_price'=>$request->total_price,'total_quantity'=>$request->total_quantity], function($message) use($request,$order){
        //            $message->to($request->email)
        //                ->from('sales@easyshop-qa.com', 'Example')
        //                ->subject('Pay done');
        //        });
        //TODO ::MAIL IS HERE

        Session::forget('cart');
        Session::forget('cart_details');

        Alert::success('Payment Completed Successfully !', '');


        return redirect()->route('/')->with(['order' => $order]);
        //ORDER 1


        //ALERT


        //HOME

    }

    public function errorUrl(Request $request)
    {
        // dd($request->all());
        $payment_id = $request->paymentId;



        $invoice_data =  $this->getPaymentStatus($payment_id);
        //        return $invoice_data;
        $invoice_id = $invoice_data->original->InvoiceId;
        $invoice_status = $invoice_data->original->InvoiceStatus;

        $order = Order::where('invoice_id', $invoice_id)->first();
        // dd($order);
        session()->forget('coupon');


        Alert::error('Payment Not Completed !', '');

        return redirect()->route('/')->with(['order' => $order]);;
    }
    /**************************************/
     public function error_payment($order_id,Request $request){
		//  dd("error");
        $paymentId=$request->paymentId;
            $data=$this->getPaymentStatus($paymentId);

          $order = Order::findOrFail($order_id);
          $json = json_decode($data->getContent(), true);

          $data = Order::findOrFail($order_id);

          if($json['InvoiceStatus'] == "Paid"){
                return redirect()->route('success_payment',$order->id);

            }
          // return redirect()->route('v2_payment',$data->id);
         return view('front.cart.error');

     }

     private function saveShippingAddressId($request)
     {

         return ShippingAddress::create([

             'title' => $request->title ?? Carbon::now()->format('Y-m-d'),
             'name' => $request->username,
             'email' => $request->email ?? 'no@gmail.com',
             'phone' => $request->phone,
             'area_id' => $request->city,
             'address' => $request->address,
             'note' => $request->note,
             'lat_and_long' => $request->lat_and_long,
             'user_id' =>  $request->user_id,
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
}




 }
