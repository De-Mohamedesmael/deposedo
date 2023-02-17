@extends('admin.master')

@section('css')

    <link rel="stylesheet" href="{{asset('assets/myDataTable/data.css')}}">
    <style>
        .th-action {
            min-width: 400px !important;
        }
        .flex.justify-between.flex-1.sm\:hidden {
            display: none;
        }
        .btnPaginate svg.w-5.h-5 {
            width: 50px !important;
            direction: ltr !important;
        }
    </style>
@endsection

@section('breadcrumb')
@if(!$is_trash)
<li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.packages')</span></li>
@else
<li class="breadcrumb-item"><a href="{{route('admin.packages.index')}}">@lang('layout.packages')</a></li>
<li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.trash')</span></li>
@endif
@endsection

@section('content')
@include('admin.includes.modalBtnAction')

{!! myDataTable_button([
__('layout.add package') => route('admin.packages.create'),
]) !!}



{!! myDataTable_table([
"id" => 'id',
"name_ar" => __('form.label.name ar'),
"name_en" => __('form.label.name en'),
"image" => __('form.label.image'),
"count_product" => __('form.label.count_product'),
]) !!}

@endsection

@section('js')
<script src="{{asset('assets/myDataTable/data.js')}}"></script>
<script>
    myDataTableColumns({

            name   :  ['id', 'name_ar', 'name_en','img','count_product'],
            file   : {'img':'{full_path_image}'},
            btn    :  {

                @can('role' , 'package_periods.index')
                'periods'         : '{{route('admin.periods.index' )}}'+'/{id}',
                @endcan
                @can('role' , 'package.update')
                'edit'         : '{{route('admin.packages.update' , '')}}'+'/{id}',
                @endcan
                @can('role' , 'package.destroy')
                'delete'       : '{{route('admin.packages.destroy' , '')}}'+'/{id}',
                @endcan

                'print'        : '#',

            }
        })
</script>
@endsection
