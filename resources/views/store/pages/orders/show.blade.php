@extends('store.master')

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{route('store.orders')}}">@lang('layout.orders')</a></li>
    <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.show')</span></li>
@endsection

@section('content')

    <div class="container">
        <article class="card">
            <header class="card-header">@lang('form.label.order details')</header>
            <div class="card-body">
                <h6></h6>
                <article class="card">
                    <div class="card-body row">
                        <div class="col"> <strong>@lang('form.label.order date'):</strong> <br>{{$order->created_at}}</div>
                        <div class="col"> <strong>@lang('form.label.count products')</strong> <br> {{$order->products_count}} @lang('form.label.product') </div>
                        <div class="col"> <strong>@lang('form.label.order number'):</strong> <br> KE{{date('Y')}}-{{$order->id}} </div>
                    </div>
                    <div class="card-body row">
                        <div class="col"> <strong>@lang('form.label.order price'):</strong> <br>{{$order->order_price}} @lang('form.label.default currency') </div>
                        <div class="col"> <strong>@lang('form.label.shipping price'):</strong> <br>{{$order->shipping_price}} @lang('form.label.default currency') </div>
                        <div class="col"> <strong>@lang('form.label.total order'):</strong> <br>{{$order->total_price}} @lang('form.label.default currency') </div>
                    </div>
                </article>

                @php($status = ['reject' => 0, 'pending' => 1, 'accept' => 2, 'shipping' => 3 , 'done' => 4])

                @if ($order->status === 'reject')
                    <div class="alert alert-danger mt-5"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">@lang('aliases.status.reject')</span> </div>
                @endif

                <div class="track">
                    <div class="step {{$status[$order->status] >= 1 ? 'active' : ''}}"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">@lang('aliases.status.pending')</span> </div>
                    <div class="step {{$status[$order->status] >= 2 ? 'active' : ''}}"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text">@lang('aliases.status.accept')</span> </div>
                    <div class="step {{$status[$order->status] >= 3 ? 'active' : ''}}"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text">@lang('aliases.status.shipping')</span> </div>
                    <div class="step {{$status[$order->status] >= 4 ? 'active' : ''}}"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">@lang('aliases.status.done')</span> </div>
                </div>
                <hr>
                <ul class="row">

                    @foreach($order->products as $product)
                        <li class="col-md-4">
                            <figure class="itemside mb-3">
                                <div class="aside"><img src="{{asset("assets/images/products/min/$product->img")}}" class="img-sm border"></div>
                                <figcaption class="info align-self-center">
                                    <p class="title">{{$product->pivot->product_name}} <br>
                                </figcaption>
                            </figure>
                           <p>@lang('form.label.quantity') :{{$product->pivot->quantity}}</p>
                           <p>@lang('form.label.price') :{!! $product->pivot->sale_price > 0 ? $product->pivot->sale_price  ." <s>".$product->pivot->regular_price."</s>": $product->pivot->regular_price!!}</p>

                            @php($attrs = json_decode($product->pivot->attributes))
                            
                            @php($name = "name_$lang")
                                @if($attrs)
                                    @foreach($attrs as $attr)
                                        @if(!isset($attrs->{'7'})&&!isset($attrs->{'6'}))
                                            <p>{{$attr->attribute->$name . ": ". $attr->$name}}</p>
                                        @endif
                                    @endforeach
                                @endif
                                @if ($product->is_clothes == 1)
                                    @if(isset($attrs->{'6'})&&isset($attrs->{'6'}))
        
                                        <p>{{ 'Size' . ': ' . App\Models\Option::find($attrs->{'6'})->name_en }}</p>
                                        <p>{{ 'Color' . ': ' . App\Models\Option::find($attrs->{'7'})->name_en }}</p>
                                    @endif
                                @endif
                             
                        </li>
                    @endforeach

                </ul>
            </div>
        </article>

        <article class="card">
            <div class="card-body row">
                <div class="col"> <strong>@lang('form.label.name'):</strong> <br>{{$order->shipping_address->name}}</div>
                <div class="col"> <strong>@lang('form.label.phone'):</strong> <br>{{$order->shipping_address->phone . ' '}} {{$order->shipping_address->phone2  ?? ''}}</div>
                <div class="col"> <strong>@lang('form.label.email'):</strong> <br>{{$order->shipping_address->email}}</div>
            </div>

            <div class="card-body row">
                <div class="col"> <strong>@lang('form.label.address'):</strong> <br>{{$order->shipping_address->address}}</div>
                @if($order->shipping_address->area)
                    <div class="col"> <strong>@lang('form.label.country') - @lang('form.label.area'):</strong> <br>{{$order->shipping_address->area->country["name_$lang"] . ' - ' .$order->shipping_address->area["name_$lang"]}}</div>
                @endif
                <div class="col"> <strong>@lang('form.label.note'):</strong> <br>{{$order->note}}</div>

            </div>

        </article>
    </div>


@endsection

@section('css')

    <style>
        @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

        body {
            background-color: #eeeeee;
            font-family: 'Open Sans', serif
        }

        .container {
            margin-top: 50px;
            margin-bottom: 50px
        }

        .card {
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 0.10rem
        }

        .card-header:first-child {
            border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
        }

        .card-header {
            padding: 0.75rem 1.25rem;
            margin-bottom: 0;
            background-color: #fff;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1)
        }

        .track {
            position: relative;
            background-color: #ddd;
            height: 7px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            margin-bottom: 60px;
            margin-top: 50px
        }

        .track .step {
            -webkit-box-flex: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
            width: 25%;
            margin-top: -18px;
            text-align: center;
            position: relative
        }

        .track .step.active:before {
            background: #FF5722
        }

        .track .step::before {
            height: 7px;
            position: absolute;
            content: "";
            width: 100%;
            left: 0;
            top: 18px
        }

        .track .step.active .icon {
            background: #ee5435;
            color: #fff
        }

        .track .icon {
            display: inline-block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            position: relative;
            border-radius: 100%;
            background: #ddd
        }

        .track .step.active .text {
            font-weight: 400;
            color: #000
        }

        .track .text {
            display: block;
            margin-top: 7px
        }

        .itemside {
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            width: 100%
        }

        .itemside .aside {
            position: relative;
            -ms-flex-negative: 0;
            flex-shrink: 0
        }

        .img-sm {
            width: 80px;
            height: 80px;
            padding: 7px
        }

        ul.row,
        ul.row-sm {
            list-style: none;
            padding: 0
        }

        .itemside .info {
            padding-left: 15px;
            padding-right: 7px
        }

        .itemside .title {
            display: block;
            margin-bottom: 5px;
            color: #212529
        }

        p {
            margin-top: 0;
            margin-bottom: 1rem
        }

        .btn-warning {
            color: #ffffff;
            background-color: #ee5435;
            border-color: #ee5435;
            border-radius: 1px
        }

        .btn-warning:hover {
            color: #ffffff;
            background-color: #ff2b00;
            border-color: #ff2b00;
            border-radius: 1px
        }
    </style>

@endsection

@section('js')


@endsection
