@extends('admin.master')

@section('breadcrumb')
    <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.carts')</span></li>

@endsection

@section('content')


    {!! myDataTable_button() !!}



    {!! myDataTable_table([
        "id"              => 'id',
        "user.name"       => __('form.label.user name'),
        "user.phone"      => __('form.label.phone'),
        "product.name_ar"      => __('form.label.name'),
        "product.image"      => __('form.label.image'),
        "amount"  => __('form.label.amount'),
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

        myDataTableColumns({
            name: ['id', 'user.name', 'user.phone', 'product.name_ar', 'product.img', 'amount'],
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
            file: {'product.img': "{{asset('assets/images/products/min/small_{product.img}')}}"},
        })
    </script>
@endsection
