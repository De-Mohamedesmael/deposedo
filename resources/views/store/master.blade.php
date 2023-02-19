<!DOCTYPE html >
<html lang="{{app()->getLocale()}}" dir="ltr">

<head>

    <!-- ///// meta ///// -->
    @include('store.includes.meta')

    <title>DepoSedo</title>
    <link rel="shortcut icon" href="{{asset('assets/images/favicon.png')}}" />

    <!-- ///// style css ///// -->
    @include('store.includes.style')
   <style>
    .header-container  .navbar{
    background: #31c2fa !important ;
}
    i.fa.fa-list-check {
        color: #31c2fa !important;
        font-size: large;
        margin-bottom: -5px;
    }
.counter-box.colored {
    background: #31c2fa !important;
}
span.align-self-center {
    color: white;
}
.sidebar-theme {
    background: #ffffffbf;
}
.bg-info {
    border-color: #31c2fa !important;
    color: #fff;
    background: linear-gradient(#31c2fa !important 5%,#00326f 100%);
}
#sidebar ul.menu-categories li.menu > .dropdown-toggle svg {
    color: #31c2fa !important;
}
.spinner-grow {
    color: #c52228 !important;
}

    </style>
</head>

    <body>

        @include('store.includes.load_screen')

        @include('store.layouts.navbar')

        @include('store.layouts.sub_navbar')


        <div class="main-container" id="container">

            <div class="overlay"></div>
            <div class="search-overlay"></div>

         <!-- ///// start sidebar ///// -->
            @include('store.layouts.sidebar')
         <!-- ///// end sidebar ///// -->


         <!-- ****** start page ****** -->
            <div id="content" class="main-content">

                <div class="layout-px-spacing">

                    @yield('content')

                    @include('store.includes.footer')

                </div>
            </div>
         <!-- ****** end page ****** -->
         </div>
    </body>


@include('store.includes.script')


</html>
