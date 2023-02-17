@extends('layouts.front')
@section('title', $records->name)
@section('style')


    <style>
        h1.title-section {
            width: 300px;
            border-bottom: 1px solid #000000;
            padding: 10px;
            margin: 10px;
        }
        i.fa.fa-arrow-down-wide-short {
            font-size: 20px;
            font-weight: bold;
            color: #0e4194;
        }
        .sortby {
            font-size: 20px;
            font-weight: 700;
            color: #3fc0f0;
        }
        a.sortby {
            font-size: initial;
        }
    </style>
@endsection
@section('content')
    <div class=" container-fluid d-md-flex d-none subcats">
        @if (count($subCategories_header) > 0)
            @foreach ($subCategories_header as $sub)
                <div class="item @if ($id == $sub->id) bg-brown @endif">
                    <a href="{{ route('vendor', $sub->id) }}">{!! $sub['name_' . app()->getlocale()] !!}</a>
                </div>
            @endforeach
        @endif



    </div>
    <header class="container  border-main">
        <ul class="nav product">
            <li class="nav-item  "> <a class="nav-link  " href="{{ url('/') }}"> {{ __('site.index') }} </a>
            </li>
            <li class="nav-item  "> <a class="nav-link  "> <i class="fas fa-arrow-left "
                        style="font-size: 20px"></i></a>
            </li>
            @if ($records->parent_id != 0)
                <li class="nav-item "> <a class="nav-link   " href="{{ route('vendor', $ParentCategory->id) }}">
                        {{ $ParentCategory['name_' . app()->getlocale()] }} </a>
                </li>
                <li class="nav-item  "> <a class="nav-link  "> <i class="fas fa-arrow-left "
                            style="font-size: 20px"></i></a>
                </li>
            @endif

            <li class="nav-item "> <a class="nav-link   " href=""> {{ $records->name }} </a>
            </li>
        </ul>

    </header>
    {{-- <div class="container  mt-3">
        <div class="row mb-2">
            <h1 class="col-md-12   main-color text-center">
                <img src="{{ asset('assets/images/categories/' . $records->img) }}" width="50px;"> {{ $records->name }}
            </h1>
        </div>
    </div>
     @if ($offers->count() >= 1)
        <div class="container border-main">
            <div class="row  row5 ">
                <div class="col-12"style="padding: 10px;
                ">
                    <h1 class=" title-section"> @lang('site.offers')</h1>
                </div>
                @foreach ($offers as $one)
                    <div class=" col-6 col-md-4 col-lg-3 mb-5 ">
                        <br>
                        <div class="card" >
                            {!! $one->if_sale ? '<h6 class="bg-main abs">' . round($one->discount_percentage, 1, PHP_ROUND_HALF_DOWN) . '%</h6>' : '' !!}
                            <a href="{{ route('product', $one->id) }}">
                                <img style="width: 100%;height: 200px;
                                  display: block;
                                    margin-left: auto;
                                    margin-right: auto;" src="{{ asset('assets/images/products/min/' . $one->img) }}"
                                    class="card-img-top  " alt="...">
                            </a>
                            <div class="card-body text-center">
                                <a href="{{ route('product', $one->id) }}"
                                    class="card-text ">{{ \Illuminate\Support\Str::limit($one->name, 14, '...') }}</a>
                                <p class="card-title" href="">
                                    @if ($one->if_sale)
                                        <b>{{ get_price_helper($one->sale_price) }}</b>
                                        <span class="regular_price">{{ get_price_helper($one->regular_price) }} </span>
                                    @else
                                        <b>{{ get_price_helper($one->regular_price) }}</b>
                                    @endif


                                </p>
                            </div>
                            <div class="row mr-0">
                                <a href="{{ route('add.cart', [$one->id, 1]) }}"
                                    class="btn btn-dark border col-9">@lang('site.add to cart')</a>
                                <div class="btn btn-light border col-3 heart text-center">
                                    <i class="far fa-heart  heart-block"></i>
                                </div>

                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            {{ $offers->appends(request()->query())->links() }}
        </div>
    @endif --}}
    <div class="container  border-main">
        <div class="row  ">
            <div class="col-md-12 col-12">
                <div class="row  ">
                    <br>
                    <div class="col-8" style="padding: 10px;
                        ">
                        <h1 class=" title-section">@lang('site.all products') </h1>
                    </div>
                    <div class="col-4" style="padding: 10px;">
                        <div class="nav-link  border-right">
                            <div class="dropdown language-dropdown">
                                <i class="fa fa-arrow-down-wide-short"></i>
                                <a data-toggle="dropdown" href="#"><span class="change-text sortby">
                                  {{ __('site.sortby_'.$sortby)}}
                              </span> <i class="fa fa-angle-down sortby"></i></a>
                                <ul class="dropdown-menu language-change  text-center">
                                    @foreach($sortbys as  $sortby_f)
                                        <li>
                                            <a class="sortby" rel="alternate" href="{{ route('vendor',['id'=>$records->id ,'sortby'=>$sortby_f]) }}">
                                                {{ __('site.sortby_'.$sortby_f)}}
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div><!-- language-dropdown -->
                        </div>
                    </div>
                    @if ($populars->count() >= 1)
                        @foreach ($populars as $one)
                            <div class=" col-6 col-md-4 col-lg-3 mb-5 ">
                                <div class="card" >
                                    {!! $one->if_sale ? '<h6 class="bg-main abs">' . round($one->discount_percentage, 1, PHP_ROUND_HALF_DOWN) . '%</h6>' : '' !!}
                                    <a href="{{ route('product', ['id' => $one->id, 'sub' => $id]) }}">
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
                                        <a href="{{ route('product', ['id' => $one->id, 'sub' => $id]) }}"
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
                                        <div class="btn btn-light border col-3 heart text-center">
                                            <i class="far fa-heart  heart-block"></i>
                                        </div>
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
