<div class="container border-main pt-4" >
    
    <div class="row  row5 text-center ">
        <div class="col-8 text-right">
            <h1 class="head-h1"> {{$title}}</h1>
        </div>
        <div class="col-4 text-left align-self-center" >
            <span class="span-more "> <a class="a-more" href="{{$url}}">{{__('site.more')}}</a></span>
        </div>
         <div  class="swiper-container-1 col-12 text-center" >
            <div class="swiper mySwiper2 text-center row w-100 mx-auto custom-h" >
               <div class="swiper-wrapper">
               @foreach($data as $kvalue => $one)
               <div class=" swiper-slide"  >
                   <br>
                   <div class="card" >
                     {!! $one->if_sale? '<h6 class="bg-main abs">'.round($one->discount_percentage,1,PHP_ROUND_HALF_DOWN) .'%</h6>':''!!}
                     {!! $one->is_order? '<h6 class="bg-main is_order">'. __('site.front_is_order') .'</h6>':''!!}
                     
                     <a href="{{route("product",$one->id)}}" style="padding: 5px 5px 0;">
                        <div class="h-resp" style="height:41vh;overflow:hidden">
                        <img class="" style="
                         width: auto;display: block;
                         margin-left: auto;
                         margin-right: auto;    width: 100%; height: 265px;" src="{{asset('assets/images/products/min/'.$one->img)}}" class="card-img-top  " alt="{{$one->name}}" >

                        </div>
                     </a>
                     <div class="card-body">
                         <a href="{{route("product",$one->id)}}" class="card-text ">{{\Illuminate\Support\Str::limit($one->name, 14, '..')}}</a>
                         <p class="card-title" href="">
                           @if($one->if_sale)
                             <b>{{get_price_helper($one->sale_price)}}</b>
                             <span class="regular_price">{{get_price_helper($one->regular_price)}} </span>
                           @else
                             <b>{{get_price_helper($one->regular_price)}}</b>
                           @endif


                         </p>
                     </div>
                     <div class="row mr-0 btn-item-product">
                       <a href="{{route('add.cart',[$one->id,1])}}" class="btn btn-dark border col-9">{{__('site.add to cart')}}</a>
                       @if(!Auth::guard('web')->check())
                         <div class="btn btn-light border col-3 heart text-center">
                            <a class="addToWishlist" href="{{route('login/client')}}">
                              
                              <i class="far fa-heart  heart-block"></i>
                            </a>

                         </div>
                           @elseif(Auth::guard('web')->check())
                               <div class="addToWishlist btn btn-light border col-3 heart text-center" data-product-id = "{{$one->id}}">
                                
                                 <i class=" far fa-heart  heart-block" ></i>
                               </div>

                           @endif
                     </div>
                  </div>
                </div>
              @endforeach

            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
          </div>
        </div>
 </div>
 
</div>

