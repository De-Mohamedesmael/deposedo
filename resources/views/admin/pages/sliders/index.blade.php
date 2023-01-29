@extends('admin.master')


@section('breadcrumb')
    <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.sliders')</span></li>
@endsection

@section('content')

    @include('admin.includes.modalBtnAction')

    {!! myDataTable_button([
        __('layout.add slider') => route('admin.sliders.create'),
      ]) !!}

    {!! myDataTable_table([
        "id"          => 'id',
        "img"         => __('form.label.img'),
        "link"        => __('form.label.link'),
        "in_app"      =>__('form.label.link src'),
    ]) !!}

@endsection


@section('css')
    <link rel="stylesheet" href="{{asset("assets/myDataTable/data.css")}}">
@endsection

@section('js')
    <script src="{{asset("assets/myDataTable/data.js")}}"></script>
    <script>

        let in_app = {'0':'@lang('form.label.out_app')', '1':'@lang('form.label.in_app')'}

        myDataTableColumns({
            name   :  ['id', 'img',  'link', 'in_app'],
            class  : {'updated_at': 'notEdit' , 'created_at': 'notEdit'},
            file   : {'img':'{{asset('assets/images/sliders/{img}')}}'},
            alias  : {in_app},
            select : {in_app},
            btn    :  {

                @can('role' , 'slider.update')
                'edit'         : '{{route('admin.sliders.update' , '')}}'+'/{id}',
                @endcan

                @can('role' , 'slider.destroy')
                'delete'       : '{{route('admin.sliders.destroy' , '')}}'+'/{id}',
                @endcan

                'print'        : '#',
            }
        })
    </script>
@endsection
