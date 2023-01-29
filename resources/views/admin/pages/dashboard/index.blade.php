@extends('admin.master')

@section('content')

    @include('admin.pages.dashboard.counter')
    <div class="col-md-12 mt-4">
        <form class="w-100" >
            <div class="col-md-3">
                <label for="from_date"><b>@lang('layout.from_year')</b></label>
                <input class="form-control" type="text" id="datepicker"  value="{{date('Y')}}"/>

            </div>
        </form>
        <div class="card line-chart-example">
            <div class="card-header d-flex align-items-center">
                <h4>@lang('lang.cash_flow')</h4>
            </div>
            <div class="card-body">
                @php
                    $color = '#733686';
                    $color_rgba = 'rgba(115, 54, 134, 0.8)';
                    $color_not = '#8f0000';


                @endphp
                <canvas id="cashFlow2" data-color="{{ $color }}" data-color_rgba="{{ $color_rgba }}" data-color_not="{{ $color_rgba }}"
                        data-recieved="{{ json_encode($payment_received) }}"
                        data-sent="{{ json_encode($cach_received) }}"
                        data-not="{{ json_encode($orders_not_comp) }}"
                        data-month="{{ json_encode($month) }}"
                        data-label1="@lang('layout.payment_received')"
                        data-label2="@lang('layout.cach_received')"
                        data-label3="@lang('layout.orders_not_comp')"
                ></canvas>
            </div>
        </div>
    </div>
{{--
    @include('admin.pages.dashboard.graph')--}}

    <hr>
    @include('admin.pages.dashboard.tables')


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
    <script type="text/javascript" src="{{asset('assets/plugins/chart.js/Chart.min.js') }}"></script>

    <script src="{{asset('assets/plugins/apex/apexcharts.min.js')}}"></script>
    <script>

        // ------------------------------------------------------- //
        // Line Chart
        // ------------------------------------------------------ //
        var cashFlow2 = $("#cashFlow2");
        if (cashFlow2.length > 0) {
            var recieved = cashFlow2.data("recieved");
            brandPrimary = cashFlow2.data("color");
            brandPrimaryRgba = cashFlow2.data("color_rgba");
            brandPrimaryNot = cashFlow2.data("color_not");
            var sent = cashFlow2.data("sent");
            var not = cashFlow2.data("not");
            var month = cashFlow2.data("month");
            var label1 = cashFlow2.data("label1");
            var label2 = cashFlow2.data("label2");
            var label3 = cashFlow2.data("label3");
            var cashFlow_chart = new Chart(cashFlow2, {
                type: "line",
                data: {
                    labels: [
                        month[0] ?? '',
                        month[1] ?? '',
                        month[2] ?? '',
                        month[3] ?? '',
                        month[4] ?? '',
                        month[5] ?? '',
                        month[6] ?? '',
                        month[7] ?? '',
                        month[8] ?? '',
                        month[9] ?? '',
                        month[10] ?? '',
                        month[11] ?? '',
                    ],
                    datasets: [
                        {
                        label: label1,
                        fill: true,
                        lineTension: 0.3,
                        backgroundColor: "transparent",
                        borderColor: brandPrimary,
                        borderCapStyle: "butt",
                        borderDash: [],
                        borderDashOffset: 0.0,
                        borderJoinStyle: "miter",
                        borderWidth: 3,
                        pointBorderColor: brandPrimary,
                        pointBackgroundColor: "#fff",
                        pointBorderWidth: 5,
                        pointHoverRadius: 5,
                        pointHoverBackgroundColor: brandPrimary,
                        pointHoverBorderColor: "rgba(220,220,220,1)",
                        pointHoverBorderWidth: 2,
                        pointRadius: 1,
                        pointHitRadius: 10,
                        data: [
                            recieved[0] ?? 0,
                            recieved[1] ?? 0,
                            recieved[2] ?? 0,
                            recieved[3] ?? 0,
                            recieved[4] ?? 0,
                            recieved[5] ?? 0,
                            recieved[6] ?? 0,
                            recieved[7] ?? 0,
                            recieved[8] ?? 0,
                            recieved[9] ?? 0,
                            recieved[10] ?? 0,
                            recieved[11] ?? 0,
                        ],
                        spanGaps: false,
                    },
                        {
                            label: label2,
                            fill: true,
                            lineTension: 0.3,
                            backgroundColor: "transparent",
                            borderColor: "rgba(255, 137, 82, 1)",
                            borderCapStyle: "butt",
                            borderDash: [],
                            borderDashOffset: 0.0,
                            borderJoinStyle: "miter",
                            borderWidth: 3,
                            pointBorderColor: "#ff8952",
                            pointBackgroundColor: "#fff",
                            pointBorderWidth: 5,
                            pointHoverRadius: 5,
                            pointHoverBackgroundColor: "#ff8952",
                            pointHoverBorderColor: "rgba(220,220,220,1)",
                            pointHoverBorderWidth: 2,
                            pointRadius: 1,
                            pointHitRadius: 10,
                            data: [
                                sent[0] ?? 0,
                                sent[1] ?? 0,
                                sent[2] ?? 0,
                                sent[3] ?? 0,
                                sent[4] ?? 0,
                                sent[5] ?? 0,
                                sent[6] ?? 0,
                                sent[7] ?? 0,
                                sent[8] ?? 0,
                                sent[9] ?? 0,
                                sent[10] ?? 0,
                                sent[11] ?? 0,
                            ],
                            spanGaps: false,
                        },
                        {
                            label: label3,
                            fill: true,
                            lineTension: 0.3,
                            backgroundColor: "transparent",
                            borderColor: "#8f0000",
                            borderCapStyle: "butt",
                            borderDash: [],
                            borderDashOffset: 0.0,
                            borderJoinStyle: "miter",
                            borderWidth: 3,
                            pointBorderColor: "#8f0000",
                            pointBackgroundColor: "#fff",
                            pointBorderWidth: 5,
                            pointHoverRadius: 5,
                            pointHoverBackgroundColor: "#8f0000",
                            pointHoverBorderColor: "#8f0000",
                            pointHoverBorderWidth: 2,
                            pointRadius: 1,
                            pointHitRadius: 10,
                            data: [
                                not[0] ?? 0,
                                not[1] ?? 0,
                                not[2] ?? 0,
                                not[3] ?? 0,
                                not[4] ?? 0,
                                not[5] ?? 0,
                                not[6] ?? 0,
                                not[7] ?? 0,
                                not[8] ?? 0,
                                not[9] ?? 0,
                                not[10] ?? 0,
                                not[11] ?? 0,
                            ],
                            spanGaps: false,
                        },
                    ],
                },
            });
        }

        $(document).ready(function() {

            $('.counter').each(function () {
                $(this).prop('Counter',0).animate({
                    Counter: $(this).text()
                }, {
                    duration: 4000,
                    easing: 'swing',
                    step: function (now) {
                        $(this).text(Math.ceil(now));
                    }
                });
            });

        });

        var d_2options2 = {
            chart: {
                id: 'sparkline1',
                group: 'sparklines',
                type: 'area',
                height: 280,
                sparkline: {
                    enabled: true
                },
            },
            stroke: {
                curve: 'smooth',
                width: 2
            },
            fill: {
                opacity: 1,
            },
            series: [{
                name: 'منتج',
                data:  @json($orders)
            }],
            labels:  @json($orders),
            yaxis: {
                min: 0
            },
            grid: {
                padding: {
                    top: 125,
                    right: 0,
                    bottom: 36,
                    left: 0
                },
            },
            fill: {
                type:"gradient",
                gradient: {
                    type: "vertical",
                    shadeIntensity: 1,
                    inverseColors: !1,
                    opacityFrom: .40,
                    opacityTo: .05,
                    stops: [45, 100]
                }
            },
            tooltip: {
                x: {
                    show: false,
                },
                theme: 'dark'
            },
            colors: ['#fff']
        }

        var d_2C_2 = new ApexCharts(document.querySelector("#total-products"), d_2options2);
        d_2C_2.render();

    </script>
    <script src="{{asset('assets/js/dashboard/dash_1.js')}}"></script>
@endsection
