<html lang="{{app()->getlocale()}}">
<head>
         <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="{{asset('front/css/bootstrap.min.css')}}">
            <link rel="stylesheet" href="{{asset('front/css/all.min.css')}}">
          <link rel="stylesheet" href="{{asset('front/css/main-style.min.css')}}">
            <link rel="stylesheet" href="{{asset('front/css/media.css')}}">
            <link rel="stylesheet" href="{{asset('front/css/carousel.css')}}">
            <meta name="google-site-verification" content="wLIaeYETirTnl55HvIJ9w9BxTpaE92F3bVbx7q3Xf8I" />
            <link
            rel="stylesheet"
            href="https://unpkg.com/swiper/swiper-bundle.min.css"
            />
    <link rel="shortcut icon" href="{{asset('assets/images/__favicon.png')}}">

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Almarai&display=swap" rel="stylesheet">
            <!-- Global site tag (gtag.js) - Google Ads: 10927707723 -->


             <style>
                body{
                  font-family: 'ArbFONTS', sans-serif !important;
                }
               .ads_header img.d-block.img-ads {
                    height: 110px !important;
                }
                .col-lg-3.col-sm-6.col-6 {
                    padding: 0;
                }
                footer.bg-b {
                    color: rgb(0, 0, 0);
                    background: linear-gradient(to left, #ffffff 60% , #ffffff) !important;
                }
                footer.bg-b a {
                    color: rgb(0, 0, 0) !important;
                }
                footer h5{
                    color: #fff
                }
                a.dropdown-item.top-slide {
                    color: #141515 !important;
                }
                .row.payment_img {
                    width: 100% !important;
                }

                .mzkbtn {
                    width: 100%;
                    /* -webkit-animation: glowing 1500ms infinite; */
                    -moz-animation: glowing 1500ms infinite;
                    -o-animation: glowing 1500ms infinite;
                    /* animation: glowing 1500ms infinite; */
                }
                .mzkbtn {
                    color: #ffffff !important;
                    background-color: #3fc0f0;
                    color: white;
                    border: none;
                    border-radius: 8px;
                    font-size: 13px;
                    text-transform: none;
                    font-family: inherit;
                    word-spacing: 2px;
                    letter-spacing: 1px;
                }


                .mzkbtn{
                	/*margin-left: 600px;*/
                	/*width:100%;*/
                	-webkit-animation: glowing 1500ms infinite;
                  -moz-animation: glowing 1500ms infinite;
                  -o-animation: glowing 1500ms infinite;
                  animation: glowing 1500ms infinite;
                }
                    @-webkit-keyframes glowing {
                      0% { background-color: #3fc0f0; -webkit-box-shadow: 0 0 3px #B20000; }
                      50% { background-color: #3fc0f0; -webkit-box-shadow: 0 0 40px #FF0000; }
                      100% { background-color: #3fc0f0; -webkit-box-shadow: 0 0 3px #B20000; }
                    }
                    @-moz-keyframes glowing {
                      0% { background-color: #3fc0f0; -moz-box-shadow: 0 0 3px #B20000; }
                      50% { background-color: #3fc0f0; -moz-box-shadow: 0 0 40px #FF0000; }
                      100% { background-color: #3fc0f0; -moz-box-shadow: 0 0 3px #B20000; }
                    }
                    @-o-keyframes glowing {
                      0% { background-color: #3fc0f0; box-shadow: 0 0 3px #B20000; }
                      50% { background-color: #3fc0f0; box-shadow: 0 0 40px #FF0000; }
                      100% { background-color: #3fc0f0; box-shadow: 0 0 3px #B20000; }
                    }
                    @keyframes glowing {
                      0% { background-color: #3fc0f0; box-shadow: 0 0 3px #3fc0f0; }
                      50% { background-color: #3fc0f0; box-shadow: 0 0 40px #3fc0f0; }
                      100% { background-color: #3fc0f0; box-shadow: 0 0 3px #3fc0f0; }
                    }


                .mzkbtn:hover {
                    color: #3fc0f0 !important;
                    background: #fff !important;
                }

                .icon-mob-down {
                    color: #ffffff !important;
                    background-color: #000 !important;
                    border: none;
                    border-radius: 8px;
                    font-size: 13px;
                    text-transform: none;
                    font-family: inherit;
                    word-spacing: 2px;
                    letter-spacing: 1px;
                    border-radius: 50%;
                    padding:5px !important;

                    font-size:50px !important;
                }


                .icon-mob-down{
                	-webkit-animation: glowing2 1500ms infinite;
                  -moz-animation: glowing2 1500ms infinite;
                  -o-animation: glowing2 1500ms infinite;
                  animation: glowing2 1500ms infinite;
                }
                    @-webkit-keyframes glowing2 {
                      0% { background-color: #000; -webkit-box-shadow: 0 0 3px #B20000; }
                      50% { background-color: #000; -webkit-box-shadow: 0 0 40px #FF0000; }
                      100% { background-color: #000; -webkit-box-shadow: 0 0 3px #B20000; }
                    }
                    @-moz-keyframes glowing2 {
                      0% { background-color: #000; -moz-box-shadow: 0 0 3px #B20000; }
                      50% { background-color: #000; -moz-box-shadow: 0 0 40px #FF0000; }
                      100% { background-color: #000; -moz-box-shadow: 0 0 3px #B20000; }
                    }
                    @-o-keyframes glowing2 {
                      0% { background-color: #000; box-shadow: 0 0 3px #B20000; }
                      50% { background-color: #000; box-shadow: 0 0 40px #FF0000; }
                      100% { background-color: #000; box-shadow: 0 0 3px #B20000; }
                    }
                    @keyframes glowing2 {
                      0% { background-color: #000; box-shadow: 0 0 3px #000; }
                      50% { background-color: #000; box-shadow: 0 0 40px #000; }
                      100% { background-color: #000; box-shadow: 0 0 3px #000; }
                    }


                .icon-mob-down:hover {

                    color: #000 !important;
                    background: #3fc0f0 !important;
                }
                footer li.nav-item.p-1 {
                    background: none !important;
                }
                .swiper-slide:hover .btn-item-product {

                    margin: 19%!important;
                    margin-top: 40%!important;
                }
                .swiper-slide:hover .card {
                    border: 1px solid #00000014;
                    box-shadow: inset 1px 1px 9px 1px #0000000f;
                }


                @media (max-width: 700px){

                    .card .is_order {
                        left: 0 !important;
                        bottom: 0 !important;
                        top: auto !important;
                    }

                    .card {
                        padding-bottom: 26px !important;
                    }

                }
                @media (min-width: 351px) and (max-width: 500px){

                    .brands-div .swiper-container {
                            margin-top: 5px;
                        }
                    .brands-div img.aos-init.aos-animate {
                        height: 100px !important;
                    }
                    .custom-h3 {
                        height: 24vh;
                    }
                    .custom-h-brand {
                        height: 20vh!important;
                    }
                    .h-resp {
                        height: 24vh !important;
                        overflow: hidden;
                    }
                    .h-resp img {
                        height: 200px !important;
                    }
                }
                .card .is_order {
                    position: absolute;
                    left: 0;
                    top: 0;
                    height: 40px;
                    padding: 10px;
                    color: #fff;
                    background-color: #c7933f;
                    border-bottom-right-radius: 10px;
                }
                .header-dark {
                    background: linear-gradient(to right,#ffffff,#ffffff);
                }
                .nav_div_hed {
                    margin: 0 -65px;
                }

                ul.nav.navbar-nav.w-90.p-0 {
                    width: 60%;
                    margin: 0 40Px 0 0 !important;

                }
                li.nav-item.w-90.row.li-col {
                    background-color: #fff;
                }
                @media (max-width: 768px){
                    .li-a-col {
                        margin: 2px;
                        padding: 0;
                        border: none !important;
                    }
                }
                    #nav_div>div {
                        background-color: #2da6d3;
                    }
                .nav_div_hed sup#cart_counter {
                    top: -18px;
                    left: -25px;
                    color: #a00000 !important;
                }
                i.fa.fa-language ,i.fa.fa-coins{
                    color: #32a3cd;
                    font-size: 20px;
                }
                body#body-id {
                    overflow-x: hidden;
                }
             </style>
                 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


     <title>@yield('title')</title>
         @yield('style')


</head>
<body class="body-style" id="body-id">
  <div class=" container-fluid  d-lg-block  bg-light top-header d-none" id="myHeader1">
        <header class=" " style="">
            <div class="float-left d-flex">
                  <div class="nav-link  border-left">
                      <div class="dropdown language-dropdown">
                          <i class="fa fa-language"></i>
                          <a data-toggle="dropdown" href="#"><span class="change-text">{{ LaravelLocalization::getCurrentLocaleNative() }}</span> <i class="fa fa-angle-down"></i></a>
                          <ul class="dropdown-menu language-change  text-center">
                              @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                                  <li>
                                      <a rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                                          {{ $properties['native'] }}
                                      </a>
                                  </li>
                              @endforeach
                          </ul>
                      </div><!-- language-dropdown -->
                  </div>
                <div class="nav-link  border-left">
                      <div class="dropdown language-dropdown">
                          <i class="fa fa-coins"></i>
                          <a data-toggle="dropdown" href="#"><span class="change-text">
                                  {{ get_currency_helper()}}
                              </span> <i class="fa fa-angle-down"></i></a>
                          <ul class="dropdown-menu language-change  text-center">
                              @foreach($currencies_home as  $currency_home)
                                  <li>
                                      <a rel="alternate" href="{{ route('front.set-currency',$currency_home->id) }}">
                                          {{ $currency_home->name }}
                                      </a>
                                  </li>
                              @endforeach
                          </ul>
                      </div><!-- language-dropdown -->
                  </div>
            </div>
            <ul class="nav  float-right pad-10" >

                @if(!Auth::guard('web')->check())
                    <li class="nav-item link-login">  <a class="nav-link border-right "  href="{{route('login/client')}}" > <i class="fas fa-unlock"></i>  @lang('site.log in')</a>
                        <div class=" login">
                            <form  role="form" action="{{route('login/client')}}" method ="post">
                                @csrf
                                <div class="form-group">

                                    <div class="arrow">
                                        <i class="fas fa-sort-up"></i></div>
                                    <input placeholder="@lang('site.email') " name="email" class="w-100 " type="email">
                                    <input placeholder="@lang('site.password') " name="password" class="w-100" minlength="6" type="password">
                                    <button type="submit" class="btn w-100 btn-dark bg-main"> @lang('site.log in') </button>
                                    <a href="{{ route('forget.password.get') }}" class=""> @lang('site.forget password?')</a><br><br>
                                    <p>@lang('site.do not have account yet') <a href="{{route('register/client')}}" class="main-color"> @lang('site.creat one')</a></p>
                                </div>
                            </form>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  border-right"  href="{{route('register/client')}}" >
                           <i class="fas fa-key"></i>  @lang('site.register')

                        </a>
                    </li>
                @elseif(Auth::guard('web')->check())
                    <li class="nav-item link-login">
                        <a class="nav-link border-right "  href="{{route('account.index')}}" >
                           <i class="fas fa-user"></i>  {{Auth::guard('web')->user()->name}}
                         </a>
                   </li>
                @endif
                @if(Auth::guard('web')->check())
                  <li class="nav-item">
                    <a class="nav-link  border-right"  href="{{route('wishlist.products.index')}}" >
                      <i class="fas fa-heart"></i> @lang('site.wishlist') </a>
                  </li>
                @endif
                <li class="nav-item  li1" >
                    @include('front.includes.header_cart')
                </li>

                @if(Auth::guard('web')->check())
                    <li class="nav-item link-logout">
                        <a class="nav-link border-right "  href="{{route('logout.client')}}" >
                          <i class="fas fa-sign-out-alt"></i>  @lang('site.Logout')</a>
                    </li>
                @endif

            </ul>
            <div style="clear: both"></div>
        </header>
    </div>

<div class=" container-fluid  d-lg-block d-none bg-light sc-header">
      <header class=" container-fluid" style="">

          <div class="float-left col-10">
              <div class="row">
                  <div class=" col-2">
                      <a  class="  logo  " href="{{route('home')}}">
                        <img src="{{asset('assets/images/favicon.png')}}" style="height: 105px;  width: 140px;">
                      </a>
                  </div>
                   <div class=" col-1">
                  </div>
                  <div class=" col-9 ads_header ">
                      <div class=" container">
                        <div class="swiper mySwiper1" style="height:auto;">
                          <div class="swiper-wrapper"style="height:auto;">
                            @foreach($ads_h as $one)
                              <div class="swiper-slide @if($loop->first) active @endif" >
                              <a class="w-100" href="{{$one -> in_app==0?$one ->link :($one ->type == 'product'?route("product",$one->link):route("vendor",$one->link))}}">
                                <img class="d-block img-ads" style="
                                  width: 100%;display: block;
                                  margin-left: auto;
                                  margin-right: auto;"data-aos="zoom-in"
                                  src="{{asset('assets/images/ads/'.$one->img)}}" alt="">
                                </a>
                              </div>
                            @endforeach
                          </div>
                        </div>
                    </div>
                  </div>
              </div>

          </div>

          <ul class="nav float-right  col-2 pt-4 ">
              <li class="nav-item w-100 ">
                  <form class="mr-0 ">
                      <div class="input-group  ">

                          <input type="hidden" id="id2" name="id" value="@yield('id')">
                          <input type="hidden" id="cat_or_sub2" name="cat_or_sub" value="@yield('cat_or_sub')">

                          <input type="text" class="form-control " placeholder="{{__('site.search')}}" aria-label="{{__('site.search')}}"
                                 aria-describedby="basic-addon2" name="search" id="search-word2" style="margin-left: 10px;border-top-right-radius: 15px;
                                 border-bottom-right-radius: 15px;">
                          <div class="input-group-append bg-brown"  style="border-top-left-radius: 15px;
                          border-bottom-left-radius: 15px;">
                              <button class="btn btn-outline-secondary mzkbtn search-submit2"  id="">
                                  <i class="fas fa-search" style="font-size: 20px"></i>
                              </button>
                          </div>
                      </div>

                  </form>

              </li>

          </ul>

          <div style="clear: both"></div>
      </header>
  </div>
<header class=" container-fluid d-lg-block d-none bg-b " style="background: #fff !important" id="myHeader2">
    <div class=" container-fluid " style="background:#000">
        <div class="row">
            <ul class="nav  ">
                <li class="nav-item "><a class="nav-link  " href="{{route('home')}}"> @lang('site.index') </a>
                </li>
            {{--    @foreach($blue_zone_cats as $k=> $cat)
                      @if($cat->subCategories->count() < 1)
                        <li class="nav-item "> <a class="div-bar-item div-button  " href="{{route('vendor' , $cat->id)}}"> {{ $cat->name }}</a>  </li>
                      @else
                           <li class="nav-item dropdown ">
                               <a class="nav-link dropdown-toggle div-bar-item div-button"   href="{{route('vendor' , $cat->id)}}" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               {{ $cat->name }}</a>
                               <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                 <a class="dropdown-item top-slide" href="{{route('vendor' , $cat->id)}}">عرض الكل</a>
                                 <div class="dropdown-divider"></div>
                                @foreach($cat->subCategories as $sub_cat)
                                     <a class="dropdown-item"  href="{{route('vendor' , $sub_cat->id)}}">
                                             {{ $sub_cat->name }}
                                     </a>
                                 @endforeach
                               </div>
                           </li>
                     @endif
                @endforeach --}}
                @foreach($blue_zone_cats as $k=> $cat)
                      @if($k==7 )
                        @break
                      @endif
                      {{-- @if($cat->subCategories->count() < 1) --}}
                        <li class="nav-item "> <a class="nav-link  " href="{{route('vendor' , $cat->id)}}"> {{ $cat->name }}</a>  </li>
                      {{-- @else --}}
                        {{-- <div class="nav-item  dropdown dropdown-bg-full" style="position: unset">
                            <a href="#" class="dropdown-toggle item-bg-drop" data-toggle="dropdown">
                              {{ $cat->name }}
                            </a>
                            <div class="dropdown-menu dropdown-bg-full ">
                              <a class="dropdown-item top-slide" href="{{route('vendor' , $cat->id)}}">عرض الكل</a>
                                  @foreach($cat->subCategories as $sub_cat)
                                    <a class="dropdown-item"  href="{{route('vendor' , $sub_cat->id)}}" style="color: #b58840 !important;">
                                            {{ $sub_cat->name }}
                                    </a>
                                  @endforeach
                            </div>
                        </div> --}}
                      {{-- @endif --}}
                 @endforeach
                <li class="nav-item ">
                    <a class="nav-link  " href="{{route('front.info','TermsAndConditions')}}">
                    @lang('site.terms_and_condition')
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link  " href="{{route('front.info','PrivacyPolicy')}}">
                     @lang('site.policies')
                    </a>
                </li>

            </ul>
          </div>
    </div>
</header>


    <div class="header-dark d-lg-none p-0 m-header" >
     <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search p-0">
         <div class="container">
           <a class="navbar-brand" href="{{route('home')}}">
             <img src="{{asset('assets/images/favicon.png')}}" style="height:70;width:90">
           </a>
           <div class="nav_div_hed">
      			<a href="@if(!Auth::guard('web')->check())
                   {{route('login/client')}}
                   @else
                    {{route('account.index')}}
                    @endif">
      				<img src="{{asset('public/assets/images/nav_bottom/my2.png')}}" class="nav_bottom " width="58" height="39">
      			</a>
      		</div>
      		<div class="nav_div_hed">
      			<a href="{{route("cart.show")}}">
      			    <sup class="text-danger" id="cart_counter" style="font-size: 10px;">
                      {{ (session('cart')  !== null )? count(session('cart')): 0  }}
                    </sup>
      				<img src="{{asset('public/assets/images/nav_bottom/Cart2.png')}}" class="nav_bottom " width="58" height="39">
      													<strong class="cart_count" style="display:none"></strong>
      							</a>
      		</div>
           <div id="google_translate_element_mob">
               <div class="dropdown language-dropdown">
                   <i class="fa fa-language"></i>
                   <a data-toggle="dropdown" href="#"><span class="change-text">{{ LaravelLocalization::getCurrentLocale() }}</span> <i class="fa fa-angle-down"></i></a>
                   <ul class="dropdown-menu language-change text-center">
                       @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                           <li>
                               <a rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                                   {{ $properties['native'] }}
                               </a>
                           </li>
                       @endforeach
                   </ul>
               </div><!-- language-dropdown -->
           </div>
             <div class="collapse navbar-collapse p-0 "
                 id="navcol-1">
                 <ul class="nav navbar-nav w-90 p-0">

                       <li class="nav-item w-90 row li-col " style="    border: none !important;">


                         <div class="li-a-col  col-12 ">
                           <form class="mr-0 " style="margin: 0 10px  0  !important;">
                               <div class="input-group  ">

                                   <input type="hidden" id="id2" name="id" value="@yield('id')">
                                   <input type="hidden" id="cat_or_sub2" name="cat_or_sub" value="@yield('cat_or_sub')">

                                   <input type="text" class="form-control " placeholder="{{__('site.search')}}" aria-label="{{__('site.search')}}"
                                          aria-describedby="basic-addon2" name="search" id="search-word2" style="margin-left: 10px;border-top-right-radius: 15px;
                                          border-bottom-right-radius: 15px;">
                                   <div class="input-group-append bg-brown" style="border-top-left-radius: 15px;
                                   border-bottom-left-radius: 15px;">
                                       <button class="btn btn-outline-secondary search-submit2" >
                                           <i class="fas fa-search" style="font-size: 20px"></i>
                                       </button>
                                   </div>
                               </div>

                           </form>
                         </div>

                       </li>




                       {{--
                     <li class="nav-item "><a class="nav-link  " href="{{route('home')}}"> @lang('site.index') </a>
                     </li>
                     <li class="nav-item dropdown megamenu-li dmenu li1">
                         <a class="nav-link dropdown-toggle" href="" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">@lang('site.categories')</a>
                         <div class="dropdown-menu megamenu sm-menu border-top li2" aria-labelledby="dropdown01">
                             <div class="row">
                                 <div class="col-md-8 col-md-12 row">
                                     @foreach($blue_zone_cats as $cat)
                                         <div class="col-sm-6 col-lg-3 border-right mb-4">
                                             <h6><a class="nav-link "
                                             href="{{route('vendor' , $cat->id)}}">
                                             <img src="{{asset('assets/images/categories/'.$cat->img)}}" class=" " alt="{{$cat->name}}"  style="width:30px;height:30px;margin:auto;">
                                                 {{ $cat->name }}

                                         </a></h6>

                                               @foreach($cat->subCategories as $sub_cat)
                                                     <a class="dropdown-item" href="{{route('vendor' , $sub_cat->id)}}">
                                                       <img src="{{asset('assets/images/categories/'.$sub_cat->img)}}" class=" " alt="{{$sub_cat->name}}"  style="width:20px;height:20px;margin:auto;">
                                                             {{ $sub_cat->name }}
                                                         </a>

                                                 @endforeach
                                         </div>

                                     @endforeach
                                 </div>

                             </div>
                         </div>
                     </li>

                     <li class="nav-item ">
                         <a class="nav-link  " href="{{route('front.info','TermsAndConditions')}}">
                         @lang('site.terms_and_condition')
                         </a>
                     </li>
                     <li class="nav-item ">
                         <a class="nav-link  " href="{{route('front.info','PrivacyPolicy')}}">
                          @lang('site.policies')
                         </a>
                     </li>--}}

                 </ul>
           </div>
     </nav>

 </div>
 <div class="div-sidebar div-bar-block div-collapse div-card animate-left" style="width:200px;" id="mySidebar">
   <button class="div-bar-item div-button div-large div-hide-large" onclick="div_close()"><i class="fas fa-times"></i>
   </button>
   <a class="div-bar-item div-button  " href="{{route('home')}}"> @lang('site.index') </a>
   @foreach($blue_zone_cats as $k=> $cat)
         @if($cat->subCategories->count() < 1)
            <a class="div-bar-item div-button  " href="{{route('vendor' , $cat->id)}}"> {{ $cat->name }}</a>
         @else
              <li class="nav-item dropdown ">
                  <a class="nav-link dropdown-toggle div-bar-item div-button"   href="{{route('vendor' , $cat->id)}}" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  {{ $cat->name }}</a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item top-slide" href="{{route('vendor' , $cat->id)}}">عرض الكل</a>
                    <div class="dropdown-divider"></div>
                   @foreach($cat->subCategories as $sub_cat)
                        <a class="dropdown-item"  href="{{route('vendor' , $sub_cat->id)}}">
                                {{ $sub_cat->name }}
                        </a>
                    @endforeach
                  </div>
              </li>
        @endif
   @endforeach
   <a class="div-bar-item div-button  " href="{{route('front.info','TermsAndConditions')}}">  @lang('site.terms_and_condition')</a>
   <a class="div-bar-item div-button  " href="{{route('front.info','PrivacyPolicy')}}"> @lang('site.policies') </a>
 </div>
<div  id="content-container">
@yield('new_titles')
    @yield('content')

          <div class="d-lg-none"id="nav_div">
          		<div class="nav_div_bt">
          			<a href="{{route('home')}}">
          				<img src="{{asset('public/assets/images/nav_bottom/home.png')}}" class="nav_bottom on" width="58" height="39">
          			</a>
          		</div>
          		<div class="nav_div_bt">
          			<img src="{{asset('public/assets/images/nav_bottom/search.png')}}" class="nav_bottom" id="icon_search2" width="58" height="39">
          		</div>
          		<div class="nav_div_bt">
          			<img src="{{asset('public/assets/images/nav_bottom/menu.png')}}" class="nav_bottom" id="hd_ct_yk2" width="58" height="39" onclick="div_open();">
          		</div>
          		<div class="nav_div_bt">
          			<a href="@if(!Auth::guard('web')->check())
                       {{route('login/client')}}
                       @else
                        {{route('account.index')}}
                        @endif">
          				<img src="{{asset('public/assets/images/nav_bottom/my.png')}}" class="nav_bottom " width="58" height="39">
          			</a>
          		</div>
          		<div class="nav_div_bt">
          			<a href="{{route("cart.show")}}">
          				<img src="{{asset('public/assets/images/nav_bottom/Cart.png')}}" class="nav_bottom " width="58" height="39">
          													<strong class="cart_count" style="display:none"></strong>
          							</a>
          		</div>
          	</div>
         </div>
         <!-----start footer --->
          <footer class="container-fluid  border-top bg-b pb-5 pt-4">
                 <div class="container">
                   {{-- <div class="row p-2 d-md-none d-block" style="background: #b58840">
                    <div class="col-lg-3 col-sm-6 col-6" >
                        <h5  class="text-dir">@lang('site.Company Information')</h5>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-6" >
                        <h5 class="text-dir">@lang('site.Contact us links')</h5>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-6" >
                        <h5 class="text-center">@lang('site.Follow us on')</h5>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-6" >
                        <h5 class="text-center">@lang('site.Follow us on')</h5>
                    </div>


                   </div> --}}
                     <div class="row ">


                        <div class="col-lg-3 col-sm-6 col-6" >
                            <h5  class="text-right black-c">@lang('site.Company Information')</h5>
                            <ul class="navbar-nav  w-100 p-0 pr-2" >
                                  <li class="nav-item  ">
                                      <a class="nav-link  " href="{{route('home')}}"> @lang('site.index') </a>
                                  </li>
                                  <li class="nav-item ">
                                      <a class="nav-link  " href="{{route('front.info','about')}}">
                                      @lang('site.About us')
                                      </a>
                                  </li>
                                  <li class="nav-item ">
                                      <a class="nav-link  " href="{{route('front.info','TermsAndConditions')}}">
                                      @lang('site.terms_and_condition')
                                      </a>
                                  </li>
                                  <li class="nav-item ">
                                      <a class="nav-link  " href="{{route('front.info','PrivacyPolicy')}}">
                                       @lang('site.policies')
                                      </a>
                                  </li>


                            </ul>
                            <br> <br>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-6">
                        <h5 class="text-right black-c">@lang('site.Contact us links')</h5>


                            @php
                                $phone = \App\Models\Setting::where('name','phone')->first();
                                $facebook = \App\Models\Setting::where('name','facebook')->first();
                                $instagram = \App\Models\Setting::where('name','instagram')->first();
                                $snapchat = \App\Models\Setting::where('name','snapchat')->first();
                                $icons = \App\Models\Icon::whereNotin('title',['google','iphone'])->get();
                                $google = \App\Models\Icon::where('title','google')->first();
                                $iphone = \App\Models\Icon::where('title','iphone')->first();
                            @endphp
                          <ul class="navbar-nav  w-100 p-0" >
                              @if($phone)
                                <li class="nav-item">
                                    <a class="nav-link  "  href="tel:{{$phone->description }}" >  @lang('site.Call') : <img class="icon-img footer-icon" src="{{asset('assets/images/icons/164926728115538.png')}}" alt="">
                                        <img class="icon-img footer-icon" src="{{asset('assets/images/icons/164926729491308.png')}}" alt="">
                                    </a>
                                </li>
                              @endif


                                <li class="nav-item ">
                                    <a class="nav-link  "  href="{{route("contact")}}" > @lang('site.contact us')</a>
                                </li>

                            </ul>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-6">
                        <h5 class="text-center black-c">@lang('site.Follow us on')</h5>

                          <ul class="navbar-nav  w-100 p-0 justify-content-center" style="flex-direction: row" >
                              @if($icons->count() > 1 )
                                  @foreach($icons as $icon)
                                      <li class="nav-item  p-1">
                                          <a class="nav-link  "  href="{{$icon->link }}" target="_blank"> <img class="icon-img footer-icon" src="{{$icon->full_src}}" alt="">
                                          </a>
                                      </li>
                                  @endforeach
                              @else
                                  @if($facebook)
                                    <li class="nav-item  p-1">
                                        <a class="nav-link  "  href="{{$facebook->link }}" target="_blank"> <img class="icon-img footer-icon" src="{{asset('assets/images/icons/164926746970148.png')}}" alt="">
                                        </a>
                                    </li>
                                  @endif
                                  @if($instagram)
                                    <li class="nav-item  p-1">
                                        <a class="nav-link  "  href="{{$instagram->link }}" target="_blank"> <img class="icon-img footer-icon" src="{{asset('assets/images/icons/164920274952956.png')}}" alt="">
                                        </a>
                                    </li>
                                  @endif
                                  @if($snapchat)
                                    <li class="nav-item  p-1">
                                        <a class="nav-link  "  href="{{$snapchat->link }}" target="_blank"> <img class="icon-img footer-icon" src="{{asset('assets/images/icons/164920269479238.png')}}" alt="">
                                        </a>
                                    </li>
                                  @endif
                              @endif



                            </ul>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-6">
                          <h5 class="text-center black-c">@lang('site.download_app')</h5>
                          <ul class="navbar-nav  w-100 p-0 justify-content-center" style="flex-direction: row" >
                              @if($google)
                                <li class="nav-item  p-1" style="background: none !important;">
                                    <a class="nav-link  a-mob-down"  href="{{$google->link }}" target="_blank"> <i class="icon-mob-down fab fa-google-play" style='color: #fff !important;padding: 5px 0 5px 10px !important;'></i>
                                    </a>
                                </li>
                              @endif
                              @if($iphone)
                                <li class="nav-item  p-1" style="background: none !important;">
                                    <a class="nav-link a-mob-down "  href="{{$iphone->link }}" target="_blank"> <i class="icon-mob-down fab fa-app-store"style='color: #fff !important;' ></i>
                                    </a>
                                </li>
                              @endif
                                {{-- <li class="nav-item  border-bottom">
                                    <a class="nav-link  "  href="" >  @lang('site.Email') : {{\App\Models\Setting::where('name','email')->first()->description }}</a>
                                </li> --}}


                            </ul>
                        </div>
                        <div class="col-12">
                            <div class=" text-center p-2">
                                 @lang('site.All rights reserved to kocart 2022 Designed and developed by')
                                <a href="#" class="main-color" style="color: #55708B !important;">DepoSedo</a>
                            </div>

                        </div>


                   </div>

               </div>
           </footer>

            <!-- country -->



          <script src="{{asset('front/js/jquery-3.3.1.min.js')}}"></script>

        <script src="{{asset('front/js/popper.min.js')}}"></script>
        <script src="{{asset('front/js/bootstrap.min.js')}}"></script>
        <script src="{{asset('front/js/wow.min.js')}}"></script>
        <script src="https://kit.fontawesome.com/a25cfb3468.js" crossorigin="anonymous"></script>

          <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
        @if (session('error_login'))


                <script>
                        Swal.fire({
                          icon: 'error',
                          title: 'Oops...',
                          text: "{{ session()->get('error_login') }}",
                          confirmButtonText: 'okay'
                        });
                </script>
        @endif
        @if (session('error'))

                <script>
                        Swal.fire({
                          icon: 'error',
                          title: 'Oops...',
                          text: "{{ session()->get('error') }}",
                          confirmButtonText: 'okay'
                        });
                </script>
        @endif
        @if (session('success'))

                <script>
                        Swal.fire({
                          icon: 'success',
                          title: 'Done',
                          text: "{{ session()->get('success') }}",
                          confirmButtonText: 'okay'
                        });
                </script>
        @endif
     <script>
              new WOW().init();
              </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
  </script>
        <script src="{{asset('front/js/scripts.js')}}"></script>
    <script src="{{asset('front/js/main-js.js')}}"></script>
     <script src="{{asset('front/js/canvas.js')}}"></script>
    <script src="{{asset('front/js/canvas2.js')}}"></script>
    @stack('content')
    @include('sweetalert::alert')
    <script>
    var swiper = new Swiper(".mySwiper2", {

        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            // when window width is >= 480px
            770: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            // when window width is >= 640px
            1000: {
                slidesPerView: 4,
                spaceBetween: 30
            }
        },

        // autoplay: {
        //       delay: 2500,
        //       disableOnInteraction: false,
        //       },
        freeMode: true,
        // autoplay: {
        //     delay: 1500,
        // },

        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
    var swiper = new Swiper(".mySwiper", {
         breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            // when window width is >= 480px
            770: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            // when window width is >= 640px
            1000: {
                slidesPerView: 3,
                spaceBetween: 30
            }
        },
        //   autoplay: {
        //       delay: 2500,
        //       disableOnInteraction: false,
        //       },
        freeMode: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });


    var swiper = new Swiper(".mySwiper-brand", {
         breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 3,
                spaceBetween: 20
            },
            // when window width is >= 480px
            770: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            // when window width is >= 640px
            1000: {
                slidesPerView: 4,
                spaceBetween: 30
            }
        },
        //   autoplay: {
        //       delay: 2500,
        //       disableOnInteraction: false,
        //       },
        freeMode: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });

</script>

    <script>
      window.onscroll = function() {myFunction();myFunction1();};
      var header = document.getElementById("myHeader2");
      var sticky = header.offsetTop;
      var header1 = document.getElementById("myHeader1");
      var sticky1 = header.offsetTop;
      function myFunction() {
          if (window.pageYOffset > sticky) {
            header.classList.add("sticky1");
          } else {
            header.classList.remove("sticky1");
          }
      }
      function myFunction1() {
          if (window.pageYOffset > sticky1) {
            header1.classList.add("sticky");
          } else {
            header1.classList.remove("sticky");
          }
      }
      function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
      }
    $(document).ready(function () {
      $("#icon_search2").click(function(){
          if($('#navcol-1').hasClass("show")){
            $('#navcol-1').removeClass('show');

          }else{
            $('#navcol-1').addClass('show');
            topFunction();
          }
      });

        $('.navbar-light .dmenu').hover(function () {
                $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
            }, function () {
                $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
            });
        });
        $('#search-submit').on('click' , function (e) {
            e.preventDefault();

            //TODO :: CALL AJAX

            let id = $('#id').val();
            let cat_or_sub =$('#cat_or_sub').val();
            let search =$('#search-word').val();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });

            $.ajax({
                type:'GET',
                url:'{{route('searching')}}',
                data:{
                    id:id,
                    cat_or_sub:cat_or_sub,
                    search:search,
                },
                success:function(data) {
                    // $("#msg").html(data.msg);
                    console.log(data);
                    $('#content-container').html(data)

                }
            });
        })

        $('.search-submit2').on('click' , function (e) {
            e.preventDefault();

            //TODO :: CALL AJAX

            let id = $('#id2').val();
            let cat_or_sub =$('#cat_or_sub2').val();
            let search =$('#search-word2').val();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });

            $.ajax({
                type:'GET',
                url:'{{route('searching')}}',
                data:{
                    id:id,
                    cat_or_sub:cat_or_sub,
                    search:search,
                },
                success:function(data) {
                    // $("#msg").html(data.msg);
                    console.log(data);
                    $('#content-container').html(data)

                }
            });
        })
</script>

<script>
            /*!
 * jQuery Cookie Plugin v1.4.1
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2006, 2014 Klaus Hartl
 * Released under the MIT license
 */
(function (factory) {
  if (typeof define === 'function' && define.amd) {
    define(['jquery'], factory);
  } else if (typeof exports === 'object') {
    module.exports = factory(require('jquery'));
  } else {
    factory(jQuery);
  }
}(function ($) {

  var pluses = /\+/g;

  function encode(s) {
    return config.raw ? s : encodeURIComponent(s);
  }

  function decode(s) {
    return config.raw ? s : decodeURIComponent(s);
  }

  function stringifyCookieValue(value) {
    return encode(config.json ? JSON.stringify(value) : String(value));
  }

  function parseCookieValue(s) {
    if (s.indexOf('"') === 0) {
      s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
    }

    try {
      s = decodeURIComponent(s.replace(pluses, ' '));
      return config.json ? JSON.parse(s) : s;
    } catch(e) {}
  }

  function read(s, converter) {
    var value = config.raw ? s : parseCookieValue(s);
    return $.isFunction(converter) ? converter(value) : value;
  }

  var config = $.cookie = function (key, value, options) {

    if (arguments.length > 1 && !$.isFunction(value)) {
      options = $.extend({}, config.defaults, options);

      if (typeof options.expires === 'number') {
        var days = options.expires, t = options.expires = new Date();
        t.setMilliseconds(t.getMilliseconds() + days * 864e+5);
      }

      return (document.cookie = [
        encode(key), '=', stringifyCookieValue(value),
        options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
        options.path    ? '; path=' + options.path : '',
        options.domain  ? '; domain=' + options.domain : '',
        options.secure  ? '; secure' : ''
      ].join(''));
    }

    var result = key ? undefined : {},
      cookies = document.cookie ? document.cookie.split('; ') : [],
      i = 0,
      l = cookies.length;

    for (; i < l; i++) {
      var parts = cookies[i].split('='),
        name = decode(parts.shift()),
        cookie = parts.join('=');

      if (key === name) {
        result = read(cookie, value);
        break;
      }

      if (!key && (cookie = read(cookie)) !== undefined) {
        result[name] = cookie;
      }
    }

    return result;
  };

  config.defaults = {};

  $.removeCookie = function (key, options) {
    $.cookie(key, '', $.extend({}, options, { expires: -1 }));
    return !$.cookie(key);
  };

}));
            /*
 show Modals
*/
 jQuery(function($){
    function initnewsLetterObj($obj) {
        var pause = $obj.attr('data-pause');
         setTimeout(function() {
           $obj.modal('show');
         }, pause);
    };

    $('#Modalnewsletter').on('click', '.checkbox-group', function() {
        $.cookie('modalnewsletter', '1', { expires: 7 });
    });
    $('#ModalVerifyAge').on('click', '.js-btn-close', function() {
        $.cookie('modalverifyage', '2', { expires: 7 });
        console.log("click");
        return false;
    });
     $('#ModalDiscount').on('click', '.js-reject-discount', function() {
        $.cookie('modaldiscount', '3', { expires: 7 });
        console.log("click");
        return false;
    });
    var $body = $('body'),
        modalnewsletter = $.cookie('modalnewsletter'),
        newsLetterObj = $('#Modalnewsletter'),
        modalverifyage = $.cookie('modalverifyage'),
        verifyageObj = $('#ModalVerifyAge'),
        modaldiscount = $.cookie('modaldiscount'),
        discountObj = $('#ModalDiscount');

    if (modalnewsletter == 1) return;
    if(newsLetterObj.length){
        initnewsLetterObj(newsLetterObj);
        $body.addClass('modal-newsletter');
        $('#Modalnewsletter').on('click', '.modal-header .close', function() {
          $body.removeClass('modal-newsletter');
        });
    };

    if(modalverifyage == 2) return;
    if(verifyageObj.length){
        initnewsLetterObj(verifyageObj);
        verifyageObj.on('click', '.js-btn-close', function() {
            verifyageObj.find('.modal-header .close').trigger('click');
            return false;
        });
    };

    if(modaldiscount == 3) return;
    if(discountObj.length){
        initnewsLetterObj(discountObj);
        discountObj.on('click', '.js-reject-discount', function() {
            discountObj.find('.modal-header .close').trigger('click');
            return false;
        });
    };
});
function div_open() {
  document.getElementById("mySidebar").style.display = "block";
  $('#hd_ct_yk2').attr('onclick','div_close();')
}

function div_close() {
  document.getElementById("mySidebar").style.display = "none";
  $('#hd_ct_yk2').attr('onclick','div_open();')

}
$(function() {
    $(".img-item")
        .mouseover(function() {
            // var src = $(this).attr("src").match(/[^\.]+/) + "over.gif";
            // $(this).attr("src", src);
        })
        .mouseout(function() {
            // var src = $(this).attr("src").replace("over.gif", ".gif");
            // $(this).attr("src", src);
        });
});

        </script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

@yield('js')
</body>

</html>
