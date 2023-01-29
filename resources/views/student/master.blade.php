<!DOCTYPE html >
<html lang="{{app()->getLocale()}}" dir="ltr">

<head>

    <!-- ///// meta ///// -->
    @include('student.includes.meta')

    <title>Multi</title>
    <link rel="shortcut icon" href="{{asset('assets/images/favicon.png')}}" />

    <!-- ///// style css ///// -->
    @include('student.includes.style')
   <style>
    .header-container  .navbar{
    background: #b4883f !important ;
}

.counter-box.colored {
    background: #b4883f !important;
}
span.align-self-center {
    color: white;
}
.sidebar-theme {
    background: #ffffffbf;
}
.bg-info {
    border-color: #b4883f !important;
    color: #fff;
    background: linear-gradient(#b4883f !important 5%,#00326f 100%);
}
#sidebar ul.menu-categories li.menu > .dropdown-toggle svg {
    color: #b4883f !important;
}
.spinner-grow {
    color: #c52228 !important;
}

    </style>
</head>

    <body>

        @include('student.includes.load_screen')

        @include('student.layouts.navbar')

        @include('student.layouts.sub_navbar')


        <div class="main-container" id="container">

            <div class="overlay"></div>
            <div class="search-overlay"></div>

         <!-- ///// start sidebar ///// -->
            @include('student.layouts.sidebar')
         <!-- ///// end sidebar ///// -->


         <!-- ****** start page ****** -->
            <div id="content" class="main-content">

                <div class="layout-px-spacing">

                    @yield('content')

                    @include('student.includes.footer')

                </div>
            </div>
         <!-- ****** end page ****** -->
         </div>
    </body>


@include('student.includes.script')


</html>
