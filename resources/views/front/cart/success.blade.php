@extends('layouts.front')
@section('title', 'Success')


@section('content')



    <header class="container  border-main">
        <ul class="nav product">
            <li class="nav-item  "> <a class="nav-link  " href="{{ url('/') }}"> Home </a>
            </li>
            <li class="nav-item  "> <a class="nav-link  "> <i class="fas fa-arrow-right "
                        style="font-size: 20px"></i></a>
            </li>
            <li class="nav-item "> <a class="nav-link   " href=""> Success </a>
            </li>
        </ul>

    </header>
    <!--- --->
    <div class="container " style="min-height: 180px;"><br><br>
        <div class="row">
            <!--<h1>{{ app('request') }}</h1>-->
            <!--@if (isset($order))-->
            <?php $invoice = $order; ?>
            {{-- <h1>The name of fatorah is {{session()->get( 'order' )->name}}</h1> --}}
            <div class="  col-md-5 d-md-block" style="margin: 20px auto !important">
                <div class="table_block table-responsive dir-rtl" id="myHtml">
                    <table class="table table-bordered">
                        <thead class="btn-dark">

                            <tr>
                                <th colspan="2" class="text-center">@lang('site.order_summary')</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <tr>
                                <th scope="row" class="btn-dark">@lang('site.invoice_id')</th>
                                <td>{{ $invoice->invoice_id ?: $invoice->id }}</td>

                            </tr>
                            <tr>
                                <th scope="row" class="btn-dark">@lang('site.total_price')</th>
                                <td>{{ $invoice->total_price }} @lang('site.YER')</td>

                            </tr>
                            <th scope="row" class="btn-dark">@lang('site.email')</th>
                            <td>{{ $invoice->shipping_address->email }}</td>

                            </tr>
                            <tr>
                                <th scope="row" class="btn-dark">@lang('site.phone')</th>
                                <td>{{ $invoice->shipping_address->phone . ' ' }}</td>

                            </tr>
                            <tr>
                                <th scope="row" class="btn-dark">@lang('site.images_orders')</th>
                                <td>
                                    @foreach ($order->products as $product)
                                        <img src="{{ asset("assets/images/products/min/$product->img") }}"
                                            class="img-sm border" width="100">
                                    @endforeach
                                </td>

                            </tr>

                            <tr>
                                <th scope="row" class="btn-dark">@lang('site.address1')</th>
                                <td>{{ $invoice->shipping_address->address }}</td>

                            </tr>

                            <tr>
                                <th scope="row" class="btn-dark">@lang('site.name')</th>
                                <td>{{ $invoice->shipping_address->name }}</td>

                            </tr>
                            <tr>
                                <th scope="row" class="btn-dark">@lang('site.total_quantity')</th>
                                <td>{{ $invoice->products_count }}</td>

                            </tr>
                            <tr>
                                <th scope="row" class="btn-dark">@lang('site.date_of_order')</th>
                                <td>{{ $invoice->created_at }}</td>

                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="text-center">
                    <input id="btn_convert" class="btn w-100 bg-main" type="button" value="{{__('site.invoice_download')}}" />
                </div>

            </div>








            {{ Session::forget('order') }}

            {{-- @dd( "The name of fatorah is ".session()->get( 'order' )->name) --}}
            {{-- @dd( "The name of fatorah is ".session()->get( 'order' )->name) --}}

            <!--@endif-->
        </div>
    </div>



@stop
@section('js')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>

        $(document).ready(function() {

            $("#btn_convert").on('click', function() {
                html2canvas(document.getElementById("myHtml"), {
                    allowTaint: true,
                    useCORS: true
                }).then(function(canvas) {
                    var anchorTag = document.createElement("a");
                    document.body.appendChild(anchorTag);
                    // document.getElementById("previewImg").appendChild(canvas);
                    anchorTag.download = "filename.jpg";
                    anchorTag.href = canvas.toDataURL();
                    anchorTag.target = '_blank';
                    anchorTag.click();
                });
            });

        });
    </script>
@endsection
