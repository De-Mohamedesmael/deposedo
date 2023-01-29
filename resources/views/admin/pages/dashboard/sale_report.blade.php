@extends('admin.master')

@section('content')

    <div class="col-md-12  no-print">
        <div class="card">
            <div class="card-header d-flex align-items-center">
                <h4>@lang('layout.sale_report')</h4>
            </div>
            <form action="">
                    <div class="col-md-12">
                        <div class="row">

                            <div class="col-md-2">
                                <div class="form-group">
                                    {!! Form::label('method_pay', __('layout.payment_type'), []) !!}
                                    {!! Form::select('method_pay', ['knet'=>__('layout.payment'),'cash'=>__('layout.cash')], request()->method_pay,
                                    ['class' =>
                                    'form-control','placeholder' =>' ','data-live-search'=>"true"]) !!}
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    {!! Form::label('start_date', __('layout.start_date'), []) !!}
                                    {!! Form::input('dateTime-local','start_date', request()->start_date, ['class' => 'form-control']) !!}
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    {!! Form::label('end_date', __('layout.end_date'), []) !!}
                                    {!! Form::input('dateTime-local','end_date', request()->end_date, ['class' => 'form-control']) !!}
                                </div>
                            </div>


                            <div class="col-md-3">
                                <br>
                                <button type="submit" class="btn btn-success mt-2">@lang('layout.filter')</button>
                                <a href="{{url('admin/report/sale-report')}}"
                                   class="btn btn-danger mt-2 ml-2">@lang('layout.clear_filter')</a>
                            </div>
                        </div>
                    </div>
                </form>
            <div class="card-body">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table dataTable">
                            <thead>
                            <tr>
                                <th>@lang('layout.product_name')</th>
                                <th class="sum">@lang('layout.sold_amount')</th>
                                <th class="sum">@lang('layout.sold_qty')</th>
                            </tr>
                            </thead>

                            <tbody>
                            @foreach ($transactions as $transaction)
                                <tr>
                                    <td>{{$transaction->product_name}}</td>
                                    <td> {{round($transaction->sold_amount,2)}}</td>
                                    <td> {{round($transaction->sold_qty,2)}}</td>
                                </tr>

                            @endforeach
                            </tbody>
                            <tfoot>
                            <tr>
                                <th style="text-align: right">@lang('layout.total')</th>
                                <th>{{$transactions->sum('sold_amount')}}</th>
                                <th>{{$transactions->sum('sold_qty')}}</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
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
    <script>
        var table = $(".dataTable").DataTable([]);
    </script>
@endsection
