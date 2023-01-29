@extends('layouts.front')
@section('title', $name)
@section('style')


    <style>
        .h img,
        .h video {
            max-height: 80vh;
        }

        h1.title-section {
            width: 300px;
            border-bottom: 1px solid #000000;
            padding: 10px 0px;
            margin: 10px 0px;
        }

        .swiper-title {
            /* margin: 0 0 10px 0 !important; */
            width: 200px;
            height: 30px;
            box-shadow: 1px 1px 3px 0px #ed3b452e;
            font-size: large;
            padding: 2px 0;
            text-align: center;
            /* border: 2px solid #172b4d; */
            margin: auto;
            margin-bottom: 10px;
        }

        span.swiper-pagination-bullet.swiper-pagination-bullet-active {
            background-color: #e7333d;
        }

        @media only screen and (max-width: 650px) {

            img.d-block.img-ads {
                max-height: 150px !important;
            }
        }

    </style>
@endsection
@section('content')

    <header class="container  border-main">
        <ul class="nav product">
            <li class="nav-item  "> <a class="nav-link  " href="{{ url('/') }}"> {{ __('site.index') }} </a>
            </li>
            <li class="nav-item  "> <a class="nav-link  "> <i class="fas fa-arrow-left "
                        style="font-size: 20px"></i></a>
            </li>
            <li class="nav-item "> <a class="nav-link   " href=""> {{ $name }} </a>
            </li>
        </ul>

    </header>
    <div class="container  border-main">
        <h1 class="title-section">{{ $name }} </h1>

        <div class="row  ">

            <div class="col-md-12 col-12">
                <div class="row  ">
                    <br>
                    @if ($populars->count() >= 1)
                        @foreach ($populars as $one)
                            <div class=" col-6 col-md-4 col-lg-3  mb-5"data-aos="zoom-in-down">
                                <div class="card">
                                    {!! $one->if_sale ? '<h6 class="bg-main abs">' . round($one->discount_percentage, 1, PHP_ROUND_HALF_DOWN) . '%</h6>' : '' !!}
                                    <a href="{{ route('product', $one->id) }}">
                                        <div class="h-resp" style="height:38vh;overflow:hidden">

                                            <img style="width: 100%;
                                              display: block;
                                                margin-left: auto;
                                                margin-right: auto;"
                                                src="{{ asset('assets/images/products/min/' . $one->img) }}"
                                                class="card-img-top  " alt="...">
                                        </div>
                                    </a>
                                    <div class="card-body text-center">
                                        <a href="{{ route('product', $one->id) }}"
                                            class="card-text ">{{ \Illuminate\Support\Str::limit($one->name, 14, '...') }}</a>
                                        <p class="card-title" href="">
                                            @if ($one->if_sale)
                                                <b>{{ get_price_helper($one->sale_price) }}</b>
                                                <span class="regular_price">{{ get_price_helper($one->regular_price) }}
                                                </span>
                                            @else
                                                <b>{{ get_price_helper($one->regular_price) }}</b>
                                            @endif


                                        </p>

                                    </div>
                                    <div class="row mr-0">
                                        <a href="{{ route('add.cart', [$one->id, 1]) }}"
                                            class="btn btn-dark border col-9">@lang('site.add to cart')</a>

                                        @if (!Auth::guard('web')->check())
                                            <div class="btn btn-light border col-3 heart text-center">
                                                <a class="addToWishlist" href="{{ route('login/client') }}">
                                                    <i class="far fa-heart  heart-block"></i>
                                                </a>

                                            </div>
                                        @elseif(Auth::guard('web')->check())
                                            <div class="addToWishlist btn btn-light border col-3 heart text-center"
                                                data-product-id="{{ $one->id }}">
                                                <i class=" far fa-heart  heart-block"></i>
                                            </div>
                                        @endif

                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @else
                        <div class="alert alert-light w-100 text-center" role="alert">
                            <h4>{{ __('site.notproducthere') }}</h4>
                        </div>
                    @endif
                </div>
                <br>
                {{ $populars->appends(request()->query())->links() }}
            </div>
        </div>
    </div>


@stop
@section('js')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
