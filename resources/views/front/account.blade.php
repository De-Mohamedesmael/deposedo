@extends('layouts.front')
@section('title',__('site.My Account'))

@section('content')

    <div class="container account" >
        <div class="row pad  ">

            <h1  class="col-12  text-center">{{__('site.My Account')}}<br></h1>
            <br>
            <div class="  col-12 justify-content-center border">
                <a href="{{route('account.orders',Auth::guard('web')->user()->id)}}" class="btn bg-main mr-10 float-right">{{__('site.My orders')}}</a>
                <a href=" {{route('wishlist.products.index')}}" class="btn bg-main mr-10  float-right">{{__('site.wishlist')}} </a>
                {{--    <a href="{{route('address.index',Auth::guard('web')->user()->id)}}" class="btn bg-main mr-10  float-right"> {{__('site.address book')}}</a>--}}
                <a href="{{route('account.edit',Auth::guard('web')->user()->id)}}" class="btn bg-main mr-10  float-right"> {{__('site.Edit account')}}</a>
            </div>
            <form class=" col-12  border">

                <div class="row border-bottom pad-10">
                    <label class="col-md-3 col-12  "><b> {{__('site.full name')}} :</b></label>
                    <p class="  col-9 pad-0 ">{{Auth::guard('web')->user()->name}}</p><br>
                </div>
                <div class="row border-bottom pad-10">
                    <label class="col-md-3 col-12 "> <b>{{__('site.email')}}</b></label>
                    <p class="  col-9 pad-0 ">{{Auth::guard('web')->user()->email}}</p><br>
                </div>

                <div class="row border-bottom pad-10">
                    <label class="col-md-3 col-12  "><b> {{__('site.Phone')}}</b></label>
                    <p class="  col-9 pad-0 ">{{Auth::guard('web')->user()->phone}}</p><br>
                </div>

                <div class="row border-bottom pad-10">
                    <label class="col-md-3 col-12  "><b> {{__('site.country')}}</b></label>
                    <p class="  col-9 pad-0 ">{{Auth::guard('web')->user()->country != null ?Auth::guard('web')->user()->country->name : null  }}</p><br>
                </div>


            </form>
        </div></div>



@endsection
