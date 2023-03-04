@extends('layouts.front')
@section('title', __('site.Checkout_t'))

@section('style')

    <style>

        label.form-check-label {
            padding: 0 20px;
        }
        .styl-item-r {
            float: right;
        }
        .div-order-day {
            text-align: center;
            font-size: 15px;
            font-weight: 700;
        }
        span#order_day {
            color: #b98737;
        }
        label.type_delivery {
            color: #b80000;
            font-size: 15px;
            font-weight: 700;
        }
        .div_type_g {
            text-align: center;
            border-radius: 10px;
            border: 1px solid #0000001a;
            max-height: 60px !important;
            padding: 5px;
        }
        h4#address_center {
            margin-top: 10px;
            font-size: 18px;
            text-align: center;
        }
    </style>
    @if(app()->getLocale()=='en')
        <style>
            .styl-item-r {
                float: left;
            }

        </style>

    @endif
@endsection



@section('content')


    <!--- --->
    <div class="container " >  <br><br>
        <form method="post" name="checkout" action="{{route("checkout.store")}}">
            @csrf
            <div class="row pad  ">
                <div class="col-md-8 ">
                    <h4 class="main-color "> {{__('site.Shipping Details')}}</h4>
                    <br>
                    @if(session('error'))
                        <div class="alert alert-danger text-center" style="width: 60%; margin-left: 15%;">
                            {{ session('error') }}
                        </div>
                    @endif
                    @if (Session::has('success-add'))
                        <div class="alert alert-success text-center">
                            <ul>
                                <li>{!! \Session::get('success-add') !!}</li>
                            </ul>
                        </div>
                    @endif
                    @if ($errors->any())
                        <div class="alert alert-danger" style="width:100%">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <div class="form-group">
                        <input type="text" class="form-control " name="username" placeholder="{{__('site.full name')}}" required>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control " name="phone"  placeholder="{{__('site.Phone')}}  " required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="email" class="form-control " name="email" placeholder="{{__('site.Email address')}}   " >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <select name="country"  class="form-control" style="height: 55px;" id="Orders_city_id" required>
                                    @foreach(\App\Models\Country::get() as $country)
                                        <option value="{{$country->id}}">{{$country->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <select name="city"  class="form-control" id="test" style="height: 55px;" required>
                                    <option value="">{{__('site.city')}}</option>

                                </select>
                                <div id="test1"></div>
                            </div>
                        </div>

                        <div class="col-md-8 type_delivery_div hide row">
                            <div class="type_d_div div_type_g col-md-6">
                                <input class="type_delivery" type="radio" id="delivery" name="type_delivery" value="delivery" checked>
                                <label  class="type_delivery" for="delivery">{{__('site.delivery')}} <br> {{__('site.price')}}
                                    <span class="type_delivery_price" id="type_delivery_price_delivery">()</span></label>
                                <input type="hidden"  id="input_type_delivery_price" >
                            </div>
                            <div class="type_dask_div div_type_g col-md-6">
                                <input class="type_delivery" type="radio" id="dask_shipping" name="type_delivery" value="dask">
                                <label  class="type_delivery" for="dask_shipping">{{__('site.dask_shipping')}}<br> {{__('site.price')}}
                                    <span class="type_delivery_price" id="type_delivery_price_dask">()</span></label><br>
                                <input type="hidden"  id="input_type_delivery_price_dask" >
                                <input type="hidden"  id="get_currency_code_helper" value="{{get_currency_code_helper()}}" >
                            </div>
                        </div>
                        <div class="col-md-6 center_div hide">
                            <div class="form-group">
                                <label for="center_id">{{__('site.center_id')}}</label>
                                <select name="center_id"  class="form-control" style="height: 55px;" id="center_id" onchange="functionCenter()" required>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 center_div hide">
                            <h4 class="alert alert-success" id='address_center'> </h4>
                        </div>
                    </div>
                    <br>

                    <div class="form-group">
                        <input type="text" class="form-control " name="address"  placeholder="{{__('site.address')}}" required>
                    </div><br>
                    <div class="form-group">
                        <input type="hidden" class="form-control " name="postcode" vule="0" >
                    </div>

                    <div class="form-group">
                        <textarea class="col-12" name="note"  placeholder="{{__('site.Order notes (optional)')}}" rows="6"></textarea>
                    </div>
                    <br><br>
                    <br><br>
                </div>
                <div class="col-md-4 ">
                    <div class="col-12 border">
                        <div class="btn-dark row">
                            <h4 class=" col-12 mr-0">   {{__('site.Order Summary')}}</h4>


                        </div><br>
                        <?php $total=0 ; $order_is_order = 0;?>
                        @if(session('cart'))
                            @foreach(session('cart') as $id => $items)
                                @foreach($items as $key1 => $details)

                                    @php
                                        $total += $details['price'] * $details['quantity'] ;
                                        $product = \App\Models\Product::where('id', $details['id'])->first();
                                    @endphp

                                    @if($order_is_order != 1 && $product -> is_order ==1)
                                            <?php $order_is_order = 1;?>
                                    @endif

                                    <div class="row ">
                                        <a href="{{route("product",$product->id)}}" class=" col-3">
                                            <img alt="{{$product->name}}" src="{{asset('assets/images/products/min/'.$product->img)}}" width="80px;">
                                        </a>
                                        <input type="hidden" name ="product_ids[]" value="{{$product->id}}">
                                        <div class="col-6">
                                            <a href="{{route("product",$product->id)}}" >{{$product->name}}</a>
                                            <p class="mr-0">Qty : {{$details['quantity']}}</p>
                                        </div>
                                        @php
                                            $sum = $details['price'] * $details['quantity'];
                                        @endphp
                                        <p class="col-3"> {{get_price_helper($sum)}} </p>
                                    </div>
                                    <hr>
                                @endforeach
                            @endforeach
                        @endif
                        <div class="div-order-day {{ $order_is_order != 1 ?  'd-none' : '' }}">
                            {{ __('site.front_is_order_day')  }} <span id="order_day"></span> {{ __('site.day')  }}
                        </div>
                        <p > {{__('site.SUBTOTAL')}} :<b class="styl-item-r main-color">{{get_price_helper($total)}}</b></p>
                        <p >{{__('site.Shipping')}} :<b class="styl-item-r main-color" > <span id="test3">{{get_price_helper(0)}}</span></b></p> <hr>
                        <p >{{__('site.ORDER TOTAL')}} : <b class="styl-item-r main-color" id="total_show">{{get_price_helper($total)}}</b></p> <hr>
                        <input type="hidden" name ="shipping" value = {{0}} >
                        <input type="hidden" name ="price" id="total" value = {{$total}}  >
                        @if(\Auth::guard("web"))
                            <input type="hidden" name ="user_id" value = {{\Auth::guard("web")->user()->id??""}} >
                        @else
                            <input type="hidden" name ="user_id" value ="0" >
                        @endif
                        <h4 class="main-color">{{__('site.Coupon Discount')}}</h4>
                        <input type="text" class="form-control "  name="coupon_code" placeholder="Coupon code" > <br>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="type" id="exampleRadios1" value="cash" checked>
                            <label class="form-check-label" for="exampleRadios1">
                                {{__('site.Cash on delivery')}}
                                <br>{{__('site.(Pay with cash upon delivery.)')}}

                            </label>
                        </div><br>
                        <hr><br>
                        <p>{{__('site.Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our')}} <a href="{{route('front.info','PrivacyPolicy')}}" target="_blank" class="main-color">{{__('site.PrivacyPolicy2')}}</a>

                        </p>
                        <hr><br>
                        <div class="form-check">
                            <input id="confirm" name="" class="form-check-input" type="checkbox" checked  >
                            <label class="form-check-label" for="confirm">
                                {{__('site.I want to receive updates about products and promotions.')}}
                            </label>
                        </div><br>
                        <button id="btn_form" type="submit"   class="btn w-100 bg-main " onClick="if (!  document.checkout.confirm.checked) {alert('{{__('site.Please accept the terms and conditions!')}}') ; return false; }">
                            {{__('site.place order')}}
                        </button><br><br><br>
                    </div>
                </div>
            </div>
        </form>
        <br><br>
    </div>
@endsection
@section('js')


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>

        $(document).ready(function () {
            console.log('ok');

            getCity();


            $('#Orders_city_id').on('change',
                function () {
                    getCity();
                }
            )
            $('#test').on('change',
                function () {
                    getDelivery();
                }
            )


            function getCity() {
                var city =  $('#Orders_city_id').val() ? $('#Orders_city_id').val():1;

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    }
                });

                $.ajax({
                    url: "{{ route('get.city') }}",
                    method: 'post',
                    data:{
                        _token: "{{ csrf_token() }}",
                        city : city
                    },
                    success: function(result){

                        // console.log(result);
                        if(!result.success)
                        {
                            Swal.fire({
                                icon: 'error',
                                title: result.msg,
                            });

                        } else {

                            // alert(result.delivery);
                            //                            $('#Orders_city_id').html(result.cities)
                            $('#test').html(result.delivery);
                            getDelivery();
                            //                        $('#test1').html(result.val11)
                        }

                    },
                    error:function (error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'لم تكتمل العمليه ',
                        })
                    }
                });

            }




            function getDelivery() {
                var city =  $('#test').val() ? $('#test').val():1;
                var product_ids  = $("input[name='product_ids[]']")
                    .map(function(){return $(this).val();}).get();
                var total =  $('#total').val() ? $('#total').val():0;

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    }
                });

                $.ajax({
                    url: "{{ route('get.delivery') }}",
                    method: 'post',
                    data:{
                        _token: "{{ csrf_token() }}",
                        city : city,
                        total:total,
                        product_ids : product_ids,
                    },
                    success: function(result){

                        // console.log(result);
                        if(!result.success)
                        {
                            Swal.fire({
                                icon: 'error',
                                title: result.msg,
                            })
                        } else {

                            $('.type_delivery_div').removeClass('hide');
                            $('#type_delivery_price_delivery').html(result.delivery);
                            $('#input_type_delivery_price').val(result.val_p);
                            if(result.delivery_desk != 0  && result.centers != ''){
                                $('#type_delivery_price_dask').html(result.delivery_desk);
                                $('#input_type_delivery_price_dask').val(result.val_desk);
                                $('.type_dask_div').removeClass('hide');
                                $('#center_id').html(result.centers);
                            }else{
                                $('.type_dask_div').addClass('hide');
                            }
                            $('#test3').html(result.delivery);
                            $('#total_show').html(result.total1);
                            $('#order_day').html(result.order_day);
                            $('#delivery').prop("checked", true);
                        }

                    },
                    error:function (error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'لم تكتمل العمليه ',
                        })
                    }
                });

            }
            $('input[type=radio][name=type_delivery]').change(function() {
                var total =  $('#total').val() ? $('#total').val():0;

                currency= $('#get_currency_code_helper').val();
                if (this.value == 'delivery') {
                    val_delivery= $('#input_type_delivery_price').val();
                    $('#test3').html(val_delivery+' '+currency);
                    g_total =parseInt(total)+parseInt(val_delivery);
                    $('#total_show').html(g_total+' '+currency);
                    $('.center_div').addClass('hide');
                }else{
                    val_delivery= $('#input_type_delivery_price_dask').val();
                    $('.center_div').removeClass('hide');
                    functionCenter();
                    $('#test3').html(val_delivery+' '+currency);
                    g_total =parseInt(total)+parseInt(val_delivery);
                    $('#total_show').html(g_total+' '+currency);

                }

            });
        })

        function functionCenter(){
            var address =  $('option:selected','#center_id').attr('address') ,
                title_a =  $('option:selected','#center_id').attr('title_a') ;
            $('#address_center').html(title_a +' : '+ address);
        }

    </script>

@stop
