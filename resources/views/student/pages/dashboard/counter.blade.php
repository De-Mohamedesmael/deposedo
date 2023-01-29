<div class="m-5">
    <div class="row">

        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "> <i class="fa-solid fa-list-check"></i> <span class="counter">{{$orders_count}}</span>
                    <p>@lang('form.label.count orders')</p>
                </div>
            </a>
        </div>


        {{-- <div class="four col-md-3">
            <a>
                <div class="counter-box colored "> <i class="fa fa-thumbs-o-up"></i> <span class="counter">{{$student->limit_products}}</span>
                    <p>@lang('form.label.products available')</p>
                </div>
            </a>
        </div> --}}
        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "> <i class="fa-solid fa-list-check"></i> <span class="counter">{{$orders_count_today}}</span>
                    <p>@lang('form.label.count orders today')</p>
                </div>
            </a>
        </div>

        <div class="four col-md-4">
            <a>
                <div class="counter-box colored "> <i class="fa fa-thumbs-o-up"></i> <span class="counter">{{$added_products_count}}</span>
                    <p>@lang('form.label.products now')</p>
                </div>
            </a>
        </div>


    </div>
</div>
