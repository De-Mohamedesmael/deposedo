@extends('admin.master')

@section('content')

    <div class="col-md-12  no-print">
        <div class="card">
            <div class="card-header d-flex align-items-center">
                <h4>@lang('layout.daily_sale_report')</h4>
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



                            <div class="col-md-3">
                                <br>
                                <button type="submit" class="btn btn-success mt-2">@lang('layout.filter')</button>
                                <a href="{{url('admin/report/get-daily-sale-report')}}"
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
                        <tr>
                            <th><a
                                    href="{{url('admin/report/get-daily-sale-report?year='.$prev_year.'&month='.$prev_month)}}"><i
                                        class="fa fa-arrow-left"></i> {{trans('layout.previous')}}</a></th>
                            <th colspan="5" class="text-center">
                                {{date("F", strtotime($year.'-'.$month.'-01')).' ' .$year}}</th>
                            <th><a
                                    href="{{url('admin/report/get-daily-sale-report?year='.$next_year.'&month='.$next_month)}}">{{trans('layout.next')}}
                                    <i class="fa fa-arrow-right"></i></a></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><strong>@lang('layout.sunday')</strong></td>
                            <td><strong>@lang('layout.monday')</strong></td>
                            <td><strong>@lang('layout.tuesday')</strong></td>
                            <td><strong>@lang('layout.wednesday')</strong></td>
                            <td><strong>@lang('layout.thursday')</strong></td>
                            <td><strong>@lang('layout.friday')</strong></td>
                            <td><strong>@lang('layout.saturday')</strong></td>
                        </tr>
                        @php
                            $i = 1;
                            $flag = 0;
                        @endphp
                        @while ($i <= $number_of_day) <tr>
                            @for($j=1 ; $j<=7 ; $j++) @if($i> $number_of_day)
                                @php
                                    break;
                                @endphp
                            @endif
                            @if($flag)
                                @if($year.'-'.$month.'-'.$i == date('Y').'-'.date('m').'-'.(int)date('d'))
                                    <td>
                                        <p style="color:red"><strong>{{$i}}</strong></p>
                                @else
                                    <td>
                                        <p><strong>{{$i}}</strong></p>
                                        @endif

                                        @if(!empty($total_total_price[$i]))
                                            <strong>@lang("layout.total_total_price")</strong><br><span>{{round($total_total_price[$i])}}</span><br><br>
                                        @endif

                                        @if(!empty($total_discount[$i]))
                                            <strong>@lang("layout.product_discount")</strong><br><span>{{round($total_discount[$i])}}</span><br><br>
                                        @endif

                                        @if(!empty($total_order_price[$i]))
                                            <strong>@lang("layout.total_order_price")</strong><br><span>{{round($total_order_price[$i])}}</span><br><br>
                                        @endif

                                        @if(!empty($total_shipping_price[$i]))
                                            <strong>@lang("layout.total_shipping_price")</strong><br><span>{{round($total_shipping_price[$i])}}</span><br><br>
                                        @endif



                                    </td>
                                    @php
                                        $i++;
                                    @endphp
                                    @elseif($j == $start_day)
                                        @if($year.'-'.$month.'-'.$i == date('Y').'-'.date('m').'-'.(int)date('d'))
                                            <td>
                                                <p style="color:red"><strong>'.$i.'</strong></p>
                                        @else
                                            <td>
                                                <p><strong>{{$i}}</strong></p>
                                                @endif

                                                @if(!empty($total_total_price[$i]))
                                                    <strong>@lang("layout.total_total_price")</strong><br><span>{{round($total_total_price[$i])}}</span><br><br>
                                                @endif

                                                @if(!empty($total_discount[$i]))
                                                    <strong>@lang("layout.product_discount")</strong><br><span>{{round($total_discount[$i])}}</span><br><br>
                                                @endif

                                                @if(!empty($total_order_price[$i]))
                                                    <strong>@lang("layout.total_order_price")</strong><br><span>{{round($total_order_price[$i])}}</span><br><br>
                                                @endif

                                                @if(!empty($total_shipping_price[$i]))
                                                    <strong>@lang("layout.total_shipping_price")</strong><br><span>{{round($total_shipping_price[$i])}}</span><br><br>
                                                @endif

                                            </td>
                                            @php
                                                $flag = 1;
                                                $i++;
                                                continue;
                                            @endphp

                                            @else
                                                <td></td>
                                            @endif

                                            @endfor

                        </tr>
                        @endwhile

                        </tbody>
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
