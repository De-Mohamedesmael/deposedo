@extends('admin.master')

@section('breadcrumb')

    @if(!$is_trash)
        <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.products')</span></li>
    @else
        <li class="breadcrumb-item"><a href="{{route('admin.products.index')}}">@lang('layout.products')</a></li>
        <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.trash')</span></li>
    @endif
@endsection

@section('content')
    @include('admin.pages.products.form_create.form-excel')

    {{--    @include('includes.modalBtnAction' , ['big' => true])--}}

    {!! myDataTable_button([
       __('layout.add product') => route('admin.products.create'),
      ]) !!}



    {!! myDataTable_table([
        "id"             => 'id',
        "img"            => __('form.label.img'),
        "serial_number"  => __('form.label.serial_number'),
        "name_ar"        => __('form.label.name ar'),
        "quantity"        => __('form.label.quantity'),
        "regular_price"  => __('form.label.price'),
        "sale_price"     => __('form.label.price after discount'),
        "in_sale"        => __('form.label.discount'),
        "created_at"     => __('form.label.created_at'),
    ]) !!}

@endsection

@section('css')
    <link rel="stylesheet" href="{{asset("assets/myDataTable/data.css")}}">
    <style>
        th.theOrderColumn.th-img, th.theOrderColumn.th-name_ar, th.theOrderColumn.th-created_at {
            max-width: 100px !important;
            overflow-x: scroll;

        }

        td.td_name_ar {
            max-width: 200px !important;
            overflow-x: scroll;
        }
    </style>
@endsection

@section('js')
    <script src="{{asset("assets/myDataTable/data.js")}}"></script>
    <script>

        let boolean = {'false': false, 'true': true};

        // colLg = 6;

        myDataTableColumns({
            name: ['id', 'img','serial_number', "name_ar", 'quantity', 'regular_price', 'sale_price', 'in_sale', 'created_at'],
            // class  : {'updated_at': 'notEdit' , 'created_at': 'notEdit', 'products_count':'notEdit' },

            class: {'quantity': 'notEdit'},
            select: {'in_sale': boolean},
            file: {'img': "{{asset('assets/images/products/min/small_{img}')}}"},
            btn: {

                @can('role' , 'product.update')
                'edit': '{id}',
                @endcan

                        @if(!$is_trash)

                        @can('role' , 'product.destroy')
                'delete': '{{route('admin.products.destroy' , '')}}' + '/{id}',
                @endcan

                        @else

                        @can('role' , 'product.restore')
                'restore': '{{route('admin.products.restore' , '')}}' + '/{id}',
                @endcan

                        @can('role' , 'product.finalDelete')
                'delete': '{{route('admin.products.finalDelete' , '')}}' + '/{id}',
                @endcan

                        @endif

                'print': '#',

            }
        })

        $('body').on('click', '.dataEdit', function (e) {

            e.preventDefault();
            location.href = '{{url('admin/products')}}' + '/' + $(this).attr('href') + '/edit';
        })
    </script>
@endsection
