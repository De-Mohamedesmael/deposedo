<div class="sidebar-wrapper sidebar-theme">

    <nav id="sidebar">
        <div class="shadow-bottom"></div>
        <ul class="list-unstyled menu-categories" id="accordionExample">

            <li class="menu">
                <a href="{{route('student.home')}}"  aria-expanded="false" class="dropdown-toggle" id="toggle-student">
                    <div class="">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-cpu"><rect x="4" y="4" width="16" height="16" rx="2" ry="2"></rect><rect x="9" y="9" width="6" height="6"></rect><line x1="9" y1="1" x2="9" y2="4"></line><line x1="15" y1="1" x2="15" y2="4"></line><line x1="9" y1="20" x2="9" y2="23"></line><line x1="15" y1="20" x2="15" y2="23"></line><line x1="20" y1="9" x2="23" y2="9"></line><line x1="20" y1="14" x2="23" y2="14"></line><line x1="1" y1="9" x2="4" y2="9"></line><line x1="1" y1="14" x2="4" y2="14"></line></svg>
                        <span>@lang('layout.dashboard')</span>
                    </div>
                </a>
            </li>

            <li class="menu">
              <a href="#products" data-toggle="collapse" data-active="false" aria-expanded="false" class="dropdown-toggle" id="toggle-products">
                    <div class="">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-cpu"><rect x="4" y="4" width="16" height="16" rx="2" ry="2"></rect><rect x="9" y="9" width="6" height="6"></rect><line x1="9" y1="1" x2="9" y2="4"></line><line x1="15" y1="1" x2="15" y2="4"></line><line x1="9" y1="20" x2="9" y2="23"></line><line x1="15" y1="20" x2="15" y2="23"></line><line x1="20" y1="9" x2="23" y2="9"></line><line x1="20" y1="14" x2="23" y2="14"></line><line x1="1" y1="9" x2="4" y2="9"></line><line x1="1" y1="14" x2="4" y2="14"></line></svg>
                        <span>@lang('layout.my products')</span>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="products" data-parent="#accordionExample">
                    <li id="li-products">
                        <a href="{{route('student.products.index')}}">@lang('layout.my products')</a>
                    </li>
                    <li id="li-create">
                        <a href="{{route('student.products.create')}}">@lang('layout.add product')</a>
                    </li>
                </ul>
            </li>

            <li class="menu">
                <a href="#orders" id="a-orders"  data-toggle="collapse" data-active="false" aria-expanded="false" class="dropdown-toggle" id="toggle-orders">
                    <div class="">
                      <i class="fa-solid fa-list-check"></i>
                        <span>@lang('layout.orders')</span>
                    </div>
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="orders" data-parent="#accordionExample">
                    <li id="li-orders">
                        <a href="{{route('student.orders')}}">@lang('layout.show online orders')</a>
                    </li>

                    <li id="li-cach-orders">
                        <a href="{{route('student.index_cach.index')}}">@lang('layout.show orders')</a>
                    </li>
                </ul>
            </li>
            {{--<li class="menu">
                <a href="{{route('student.orders')}}" data-active="false" aria-expanded="false" class="dropdown-toggle" id="toggle-orders">
                    <div class="">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-cpu"><rect x="4" y="4" width="16" height="16" rx="2" ry="2"></rect><rect x="9" y="9" width="6" height="6"></rect><line x1="9" y1="1" x2="9" y2="4"></line><line x1="15" y1="1" x2="15" y2="4"></line><line x1="9" y1="20" x2="9" y2="23"></line><line x1="15" y1="20" x2="15" y2="23"></line><line x1="20" y1="9" x2="23" y2="9"></line><line x1="20" y1="14" x2="23" y2="14"></line><line x1="1" y1="9" x2="4" y2="9"></line><line x1="1" y1="14" x2="4" y2="14"></line></svg>
                        <span>@lang('layout.my products in orders')</span>
                    </div>
                </a>
            </li>--}}


        </ul>

    </nav>

</div>
