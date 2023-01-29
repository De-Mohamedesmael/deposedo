@extends('admin.master')

@section('breadcrumb')
    <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.orders')</span></li>

@endsection

@section('content')

    @include('admin.includes.modalBtnAction')

    {!! myDataTable_button() !!}



    {!! myDataTable_table([
        "id"              => 'id',
        "user.name"       => __('form.label.user name'),
        "user.phone"      => __('form.label.phone'),
        "products_count"  => __('form.label.count products'),
        "total_price"     => __('form.label.total order'),
        "status"          => __('form.label.status'),
        "imaget"          => __('form.label.image'),
        "deliveried_by"          => __('form.label.deliveried'),
    ]) !!}

@endsection

@section('css')

    <link rel="stylesheet" href="{{asset("assets/myDataTable/data.css")}}">
    <style>
        th.theOrderColumn.th-created_at, th.theOrderColumn.th-total_price, th.theOrderColumn.th-products_count {
            max-width: 100px !important;
            overflow-x: scroll;

        }

        img.img-item-one {
            width: 80px;
            padding: 5px;
        }
    </style>
@endsection

@section('js')
    <script src="{{asset("assets/myDataTable/data.js")}}"></script>
    <script>


        let status = '@json(__("aliases.status"))',
         deliveried_by = '@json($delivery)';

        myDataTableColumns({
            name: ['id', 'shipping_address.name', 'shipping_address.phone', 'products_count', 'total_price', 'status', 'imaget', 'deliveried_by'],
            class: {
                'updated_at': 'notEdit',
                'created_at': 'notEdit',
                'products_count': 'notEdit',
                'order_price': 'notEdit',
                'discount': 'notEdit',
                'shipping_price': 'notEdit',
                'total_price': 'notEdit',
                'image_t': 'notEdit'
            },
            alias: {status, deliveried_by},
            select: {status, deliveried_by},
            btn: {

                @can('role' , 'order.update')
                'edit': '{{route('admin.orders.update' , '')}}' + '/{id}',
                @endcan

                        @can('role' , 'order.show')
                'show': '{{route('admin.orders.show' , '')}}' + '/{id}',
                @endcan
                'print': '#',

            }
        })
    </script>
@endsection
