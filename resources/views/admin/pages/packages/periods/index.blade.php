@extends('admin.master')

@section('breadcrumb')
@if(!$is_trash)

<li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.package_periods')</span></li>
@else
    <li class="breadcrumb-item"><a href="{{route('admin.packages.index')}}">@lang('layout.packages')</a></li>
<li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.trash')</span></li>
@endif
@endsection

@section('content')
@include('admin.includes.modalBtnAction')


{!! myDataTable_button([
__('layout.add package_periods') => route('admin.periods.create'),
]) !!}



{!! myDataTable_table([
"id" => 'id',
"period" => __('form.label.period in month'),
"price" => __('form.label.price'),
"package_id" => __('form.label.package'),
]) !!}

@endsection

@section('css')
    <style>
        .flex.justify-between.flex-1.sm\:hidden {
            display: none;
        }
        .btnPaginate svg.w-5.h-5 {
            width: 50px !important;
            direction: ltr !important;
        }
    </style>
<link rel="stylesheet" href="{{asset('assets/myDataTable/data.css')}}">
@endsection

@section('js')
<script src="{{asset('assets/myDataTable/data.js')}}"></script>
<script>
    let package_id = '@json($packages)';
    myDataTableColumns({
            name   :  ['id', 'period','price','package_id'],
            alias  : {package_id},
            select : {package_id},
            btn    :  {

                @can('role' , 'package_periods.update')
                'edit'         : '{{route('admin.periods.update' , '')}}'+'/{id}',
                @endcan
                @can('role' , 'package_periods.destroy')
                'delete'       : '{{route('admin.periods.destroy' , '')}}'+'/{id}',
                @endcan

                'print'        : '#',

            }
        })
</script>
@endsection
