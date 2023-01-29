<!DOCTYPE html >
<html lang="{{app()->getLocale()}}" dir="ltr">

<head>

    <!-- ///// meta ///// -->
    @include('admin.includes.meta')

    <title>Deposedo</title>
    <link rel="shortcut icon" href="{{asset('assets/images/favicon.png')}}" />

    <!-- ///// style css ///// -->
    @include('admin.includes.style')
    <style>
    .header-container  .navbar{
    background: #3fc0f0  !important;
}

.counter-box.colored {
    background: #3fc0f0;
}
span.align-self-center {
    color: white;
}
.sidebar-theme {
    background: #ffffffbf;
}
#sidebar i {
    color: #000000 !important;
}
.bg-info {
    border-color: #3fc0f0;
    color: #fff;
    background: linear-gradient(#3fc0f0 5%,#00326f 100%);
}
#sidebar ul.menu-categories li.menu > .dropdown-toggle svg {
    color: #3fc0f0;
}
.header-container {
direction: ltr;
z-index: 1030;
border-bottom: 1px solid #0eafdaa3;
}
.header-container .navbar {
background: #3fc0f0 !important;
}
.btn-myDataTable select, .btn-myDataTable a, .btn-myDataTable button {
    background-color: #2b8eb8;
    color: white;
    border: 1px solid #217fa8;
  }
  button.print-dataTable.print-button {
    background-color: #0000;
    border: none;
}

.req{
    color:red !important;
}
    </style>

</head>

    <body>

        @include('admin.includes.load_screen')

        @include('admin.layouts.navbar')

        @include('admin.layouts.sub_navbar')


        <div class="main-container" id="container">

            <div class="overlay"></div>
            <div class="search-overlay"></div>

         <!-- ///// start sidebar ///// -->
            @include('admin.layouts.sidebar')
         <!-- ///// end sidebar ///// -->


         <!-- ****** start page ****** -->
            <div id="content" class="main-content">

                <div class="layout-px-spacing">

                    @yield('content')

                    @include('admin.includes.footer')

                </div>
            </div>
         <!-- ****** end page ****** -->
         </div>
    </body>


@include('admin.includes.script')


</html>
