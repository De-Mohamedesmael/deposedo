@extends('admin.master')

@section('content')

    <div class="col-md-12  no-print">
        <div class="card">
            <div class="card-header d-flex align-items-center">
                <h4>@lang('layout.monthly_sale_report')</h4>
            </div>
            <form action="">
                    <div class="col-md-12">
                        <div class="row">

                            <div class="col-md-3">
                                <div class="form-group">
                                    {!! Form::label('method_pay', __('layout.payment_type'), []) !!}
                                    {!! Form::select('method_pay', ['knet'=>__('layout.payment'),'cash'=>__('layout.cash')], request()->method_pay,
                                    ['class' =>
                                    'form-control','data-live-search'=>"true"]) !!}
                                </div>
                            </div>


                            <input type="hidden"  name="year" value="{{$year}}">
                            <div class="col-md-3">
                                <br>
                                <button type="submit" class="btn btn-success mt-2">@lang('layout.filter')</button>
                                <a href="{{url('admin/report/get-monthly-sale-report')}}"
                                   class="btn btn-danger mt-2 ml-2">@lang('layout.clear_filter')</a>
                            </div>
                        </div>
                    </div>
                </form>
            <div class="card-body">
                <div class="col-md-12">
                    <table class="table table-bordered"
                           style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;">
                        <thead>
                        @php
                            $next_year = $year + 1;
                            $pre_year = $year - 1;
                        @endphp
                        <tr>
                            <th><a href="{{url('admin/report/get-monthly-sale-report?year='.$pre_year)}}"><i
                                        class="fa fa-arrow-left"></i> {{trans('layout.previous')}}</a></th>
                            <th colspan="10" class="text-center">{{$year}}</th>
                            <th><a href="{{url('admin/report/get-monthly-sale-report?year='.$next_year)}}">{{trans('layout.next')}}
                                    <i class="fa fa-arrow-right"></i></a></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><strong>@lang('layout.January')</strong></td>
                            <td><strong>@lang('layout.February')</strong></td>
                            <td><strong>@lang('layout.March')</strong></td>
                            <td><strong>@lang('layout.April')</strong></td>
                            <td><strong>@lang('layout.May')</strong></td>
                            <td><strong>@lang('layout.June')</strong></td>
                            <td><strong>@lang('layout.July')</strong></td>
                            <td><strong>@lang('layout.August')</strong></td>
                            <td><strong>@lang('layout.September')</strong></td>
                            <td><strong>@lang('layout.October')</strong></td>
                            <td><strong>@lang('layout.November')</strong></td>
                            <td><strong>@lang('layout.December')</strong></td>
                        </tr>
                        <tr>
                            @foreach($total_discount as $key => $discount)
                                <td>
                                    @if($discount > 0)
                                        <strong>{{trans("layout.total_discount")}}</strong><br>
                                        <span>{{round($discount)}}</span><br><br>
                                    @endif
                                    @if($total_order_price[$key] > 0)
                                        <strong>{{trans("layout.total_order_price")}}</strong><br>
                                        <span>{{round($total_order_price[$key],2)}}</span><br><br>
                                    @endif
                                    @if($total_shipping_price[$key] > 0)
                                        <strong>{{trans("layout.total_shipping_price")}}</strong><br>
                                        <span>{{round($total_shipping_price[$key],2)}}</span><br><br>
                                    @endif
                                    @if($total_total_price[$key] > 0)
                                        <strong>{{trans("layout.total_total_price")}}</strong><br>
                                        <span>{{round($total_total_price[$key],2)}}</span><br><br>
                                    @endif


                                </td>
                            @endforeach
                        </tr>
                        </tbody>
                    </table>
                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('css')
    <style>
        .container {
            margin-top: 100px
        }

        .counter-box {
            display: block;
            background: #f6f6f6;
            padding: 40px 20px 37px;
            text-align: center
        }

        .counter-box p {
            margin: 5px 0 0;
            padding: 0;
            color: #909090;
            font-size: 18px;
            font-weight: 500
        }

        .counter-box i {
            font-size: 60px;
            margin: 0 0 15px;
            color: #d2d2d2
        }

        .counter {
            display: block;
            font-size: 32px;
            font-weight: 700;
            color: #666;
            line-height: 28px
        }

        .counter-box.colored {
            background: #1274cb;
            margin: 5px
        }

        .counter-box.colored p,
        .counter-box.colored i,
        .counter-box.colored .counter {
            color: #fff
        }
    </style>
@endsection


@section('js')

    <script src="{{asset('assets/plugins/apex/apexcharts.min.js')}}"></script>

    <script src="{{asset('assets/js/dashboard/dash_1.js')}}"></script>
@endsection
