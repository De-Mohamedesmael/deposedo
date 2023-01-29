@extends('layouts.front')
@section('title')
    @lang('site.app_name')
@endsection
@section('style')
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.css">

    <style>
        .h img,
        .h video {
            max-height: 80vh;
        }

        .swiper-title {
            /* margin: 0 0 10px 0 !important; */
            width: 100%;
            height: 30px;
            box-shadow: 1px 1px 3px 0px #ed3b452e;
            font-size: 20px;
            font-weight: 600;
            padding: 2px 0;
            text-align: center;
            /* border: 2px solid #172b4d; */
            margin: auto;
            margin-bottom: 10px;
            background: #000;
            color: #fff;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
        }

        .swiper-container img {
            border: 1px solid #0000000a;
        }

        span.swiper-pagination-bullet.swiper-pagination-bullet-active {
            background-color: #e7333d;
        }

        @media only screen and (max-width: 650px) {

            img.d-block.img-ads {
                max-height: 150px !important;
            }
        }

        @media (min-width: 1200px){
        .container.container-carousel {
            max-width: 1240px;
        }
        }

        .brands-div img.aos-init.aos-animate {
            border: 4px solid #c4964d !important;
            border-radius: 50% !important;
        }

    </style>
@endsection

@section('content')
    {{-- @dd($order); --}}
    @if (isset($order))
        <?php $invoice = $order; ?>
        {{-- <h1>The name of fatorah is {{session()->get( 'order' )->name}}</h1> --}}
        <div class="  col-md-5 d-md-block" style="margin: 20px auto !important">
            <div class="table_block table-responsive dir-rtl">
                <table class="table table-bordered">
                    <thead class="btn-dark">

                        <tr>
                            <th colspan="2" class="text-center">@lang('site.order_summary')</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        <tr>
                            <th scope="row" class="btn-dark">@lang('site.invoice_id')</th>
                            <td>{{ $invoice->invoice_id ?: $invoice->id }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark">@lang('site.total_price')</th>
                            <td>{{ get_price_helper($invoice->total_price) }} </td>

                        </tr>
                        <th scope="row" class="btn-dark">@lang('site.email')</th>
                        <td>{{ $invoice->shipping_address->email }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark">@lang('site.phone')</th>
                            <td>{{ $invoice->shipping_address->phone . ' ' }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark">@lang('site.images_orders')</th>
                            <td>
                                @foreach ($order->products as $product)
                                    <img src="{{ asset("assets/images/products/min/$product->img") }}"
                                        class="img-sm border" width="100">
                                @endforeach
                            </td>

                        </tr>

                        <tr>
                            <th scope="row" class="btn-dark">@lang('site.address1')</th>
                            <td>{{ $invoice->shipping_address->address }}</td>

                        </tr>

                        <tr>
                            <th scope="row" class="btn-dark">@lang('site.name')</th>
                            <td>{{ $invoice->shipping_address->name }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark">@lang('site.total_quantity')</th>
                            <td>{{ $invoice->products_count }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark">@lang('site.date_of_order')</th>
                            <td>{{ $invoice->created_at }}</td>

                        </tr>

                    </tbody>
                </table>
            </div>
        </div>








        {{ Session::forget('order') }}

        {{-- @dd( "The name of fatorah is ".session()->get( 'order' )->name) --}}
        {{-- @dd( "The name of fatorah is ".session()->get( 'order' )->name) --}}
    @endif
    <div class="container container-carousel ">
        <!-----start carousel --->
        <div id="carouselExampleIndicators" class="carousel slide  carousel-fade border-main" data-ride="carousel">
            <ol class="carousel-indicators">
                @foreach ($sliders as $i => $one)
                    <li data-target="#carouselExampleIndicators" data-slide-to="{{ $i }}"
                        class="@if ($loop->first) active @endif"></li>
                @endforeach
            </ol>
            <div class="carousel-inner">
                @foreach ($sliders as $one)
                    <div class="carousel-item h  @if ($loop->first) active @endif">
                        <a class="w-100" href="{{$one -> in_app==0?$one ->link :($one ->type == 'product'?route("product",$one->link):route("vendor",$one->link))}}" target="_blank">
                            <img class="d-block " style="
                                              width: 100%;display: block;
                                              margin-left: auto;
                                              margin-right: auto;height: auto;"
                                src="{{ asset('assets/images/sliders/' . $one->img) }}" alt="{{ $one->name_en }}">
                        </a>
                    </div>
                @endforeach
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">@lang('site.Previous')</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">@lang('site.Next')</span>
            </a>
        </div>
        <!-----start category --->

        <div class="container-fluid ">
            <div class="container border-main">
                <br>
                <br>
                <br>
                <div class="row vendor mb-2">
                    <h1 class="col-12 text-center h1-after mb-4">{{ __('site.shop_cat') }} </h1>

                    <div class="swiper-container col-12 text-center custom-h3">
                        <div class="swiper mySwiper text-center row w-100 mx-auto custom-h3">

                            <div class="swiper-wrapper">
                                @foreach ($vendors as $k => $one)
                                    @if ($one->img != '')
                                        <div class="swiper-slide " data-id="{{ $k }}">
                                            <a href="{{ route('vendor', $one->id) }}"
                                                style="text-decoration: none !important;">
                                                <img src="{{ asset('assets/images/categories/' . $one->img) }}"
                                                    class=" " alt="{{ $one->name_en }}" style="width: 100%;height: 250px;margin:auto;border-top-left-radius: 20px;
                                                        border-top-right-radius: 20px"  data-aos="flip-left"data-aos-easing="ease-out-cubic" data-aos-duration="2000">
                                                <div class="swiper-title"  data-aos="flip-left"data-aos-easing="ease-out-cubic" data-aos-duration="2000">
                                                    {{ $one->name }}
                                                </div>
                                            </a>
                                        </div>
                                    @endif
                                @endforeach

                            </div>
                            <div class="swiper-pagination"></div>

                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                    </div>

                </div>
            </div>
        </div>
        <!----- shop --->
        @include('front.includes.list_pro', [
            'title' => __('site.offers_title'),
            'data' => $offers,
            'url' => route('productByType', 'offers'),
        ])



        <div class="container-fluid brands-div  ">
            <div class="container border-main"><br>
                <div class="row vendor mb-2">
                    <div class="col-12 text-right mb-3">
                        <h1 class="head-h1">{{ __('site.brands') }} </h1>
                    </div>
                    <div class="swiper-container col-12 text-center h-100">
                        <div class="swiper mySwiper-brand text-center row w-100 mx-auto custom-h-brand">

                            <div class="swiper-wrapper">
                                @foreach ($brands as $k => $one)
                                    @if ($one->img != '')
                                        <div class="swiper-slide " data-id="{{ $k }}">
                                            <a href="{{ route('brand', $one->id) }}"
                                                style="text-decoration: none !important;" >
                                                <img src="{{ asset('assets/images/student/' . $one->img) }}"
                                                    class=" " alt="{{ $one->name_en }}"
                                                    style="width: 100%;height: 250px;margin:auto;"  data-aos="flip-left"data-aos-easing="ease-out-cubic" data-aos-duration="2000">
                                                {{-- <div class="swiper-title">
                                        {{$one->name}}
                                      </div> --}}
                                            </a>
                                        </div>
                                    @endif
                                @endforeach

                            </div>
                            <!-- Add Pagination -->
                            <div class="swiper-pagination"></div>
                        </div>
                        <div class="swiper-pagination"></div>

                    </div>

                </div>
            </div>
        </div>

        {{-- @include('front.includes.ads_temp', ['items' => $ads->where('position' , 1)]) --}}
        @include('front.includes.list_pro', [
            'title' => __('site.newProducts'),
            'data' => $newProducts,
            'url' => route('productByType', 'newProducts'),
        ])
        @include('front.includes.ads_temp', ['items' => $ads->where('position', 2)])
        @include('front.includes.list_pro', [
            'title' => __('site.recommendedProducts'),
            'data' => $recommendedProducts,
            'url' => route('productByType', 'recommendedProducts'),
        ])

    </div>
@endsection

@section('js')

    <script>
        if ($(window).width() > 380) {
            var swiper = new Swiper(".swiper-container", {
                breakpoints: {

                    // when window width is >= 480px
                    770: {
                        slidesPerView: 4,
                        spaceBetween: 30
                    },
                    // when window width is >= 640px
                    1000: {
                        slidesPerView: 4,
                        spaceBetween: 30
                    }
                },

                autoplay: {
                    delay: 2500,
                    disableOnInteraction: false,
                },
                freeMode: true,
                // autoplay: {
                //     delay: 1500,
                // },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
            });
        }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.js"></script>
    <script>
        if ($(window).width() <= 380) {
            var swiper = new Swiper(".swiper-container", {

                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 30,
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true
                }
            });
        }
    </script>
    <script>
        var swiper = new Swiper(".mySwiper1", {
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
            breakpoints: {
                freeMode: true,
            }
        });

        $(document).on('click', '.addToWishlist', function(e) {

            e.preventDefault();
            $.ajax({
                type: 'get',
                url: "{{ route('wishlist.store') }}",
                data: {
                    'productId': $(this).attr('data-product-id'),
                },
                success: function(data) {
                    if (data.message) {
                        alert(data.message)
                    } else {
                        alert('This product already in you wishlist');
                    }
                }
            });


        });
    </script>
@endsection
