<div class="m-5">
    <div class="row">

        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa-solid fa-list-check"></i> <span
                            class="counter">{{$orders_count}}</span>
                    <p>@lang('form.label.count orders')</p>
                </div>
            </a>
        </div>
        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa-solid fa-list-check"></i> <span
                            class="counter">{{$totalPendingOrders }}</span>
                    <p>@lang('form.label.count pending orders')</p>
                </div>
            </a>
        </div>
        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa-solid fa-list-check"></i>
                    <div class="d-flex justify-content-center">
                        <span style="font-size: 20px;color:#fff">@lang('form.label.default currency')</span>
                        <span class="counter">{{$orders_price}} </span> &nbsp;
                    </div>
                    <p>@lang('form.label.price orders')</p>
                </div>
            </a>
        </div>
        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa-solid fa-list-check"></i> <span
                            class="counter">{{$orders_count_today}}</span>
                    <p>@lang('form.label.count orders today')</p>
                </div>
            </a>
        </div>
        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa-solid fa-list-check"></i>
                    <div class="d-flex justify-content-center">
                        <span style="font-size: 20px;color:#fff">@lang('form.label.default currency')</span>
                        <span class="counter">{{$orders_price_today}} </span> &nbsp;
                    </div>
                    <p>@lang('form.label.price orders today')</p>
                </div>
            </a>
        </div>

        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa fa-ravelry" aria-hidden="true"></i> <span
                            class="counter">{{$students_count}}</span>
                    <p>@lang('form.label.count students')</p>
                </div>
            </a>
        </div>

        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa fa-users" aria-hidden="true"></i> <span
                            class="counter">{{$users_count}}</span>
                    <p>@lang('form.label.count users')</p>
                </div>
            </a>
        </div>

        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa fa-product-hunt" aria-hidden="true"></i> <span
                            class="counter">{{$products_count}}</span>
                    <p>@lang('form.label.count products')</p>
                </div>
            </a>
        </div>

        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "><i class="fa fa-product-hunt" aria-hidden="true"></i> <span
                            class="counter">{{$totalSoldProducts}}</span>
                    <p>@lang('form.label.count products orders')</p>
                </div>
            </a>
        </div>

    </div>
</div>
