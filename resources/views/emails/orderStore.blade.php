    
    <div class="  col-md-5 d-md-block" style="margin: 20px auto !important">
            <div class="table_block table-responsive dir-rtl">
                <table class="table table-bordered" style="padding: 10px;">
                    <thead class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">
                        <tr>
                            <th colspan="2" class="text-center" style=" background-color: #fff;padding: 5px;color: #d7bc66;">@lang('site.order_new_mail')</th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center" style=" background-color: #d7bc66;padding: 5px;color: #fff;">@lang('site.order_summary')</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        <tr>
                            <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.invoice_id')</th>
                            <td style="text-align: center;border: 1px solid #000;padding: 2px;">{{ $invoice->invoice_id ?: $invoice->id }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.total_price')</th>
                            <td style="text-align: center;border: 1px solid #000;padding: 2px;">{{ $invoice->total_price }} @lang('site.DZD')</td>

                        </tr>
                        <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.email')</th>
                        <td style="text-align: center;border: 1px solid #000;padding: 2px;">{{ $invoice->shipping_address->email }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.phone')</th>
                            <td style="text-align: center;border: 1px solid #000;padding: 2px;">{{ $invoice->shipping_address->phone . ' ' }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.images_orders')</th>
                            <td style="text-align: center;border: 1px solid #000;padding: 2px;">
                                @foreach ($invoice->products as $product)
                                    <img src="{{ asset('assets/images/products/min/'.$product->img) }}"
                                        class="img-sm border" width="100">
                                @endforeach
                            </td>

                        </tr>

                        <tr>
                            <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.address1')</th>
                            <td style="text-align: center;border: 1px solid #000;padding: 2px;">{{ $invoice->shipping_address->address }}</td>

                        </tr>

                        <tr>
                            <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.name')</th>
                            <td style="text-align: center;border: 1px solid #000;padding: 2px;">{{ $invoice->shipping_address->name }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.total_quantity')</th>
                            <td style="text-align: center;border: 1px solid #000;padding: 2px;">{{ $invoice->products_count }}</td>

                        </tr>
                        <tr>
                            <th scope="row" class="btn-dark" style="background-color: #d2b250de;padding: 0 5px !important;color: #fff;border: 1px solid #000;">@lang('site.date_of_order')</th>
                            <td style="text-align: center;border: 1px solid #000;padding: 2px;">{{ $invoice->created_at }}</td>

                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
<span style="color:darkblue"> {{__('api.if you have any questions you can contact with us in our email')}}, (info@multi-kw.com) </span>
<strong>
    {{__('api.thank you')}} .
</strong>
