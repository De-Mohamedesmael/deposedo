@extends('admin.master')


@section('breadcrumb')
    @if(!$is_trash)
        <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.areas')</span></li>
    @else
        <li class="breadcrumb-item"><a href="{{route('admin.areas.index')}}">@lang('layout.areas')</a></li>
        <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.trash')</span></li>
    @endif

@endsection

@section('content')

    @include('admin.includes.modalBtnAction')

    {!! myDataTable_button([
        __('layout.update area price') => route('admin.areas.create'),
      ]) !!}


    <div class='table-responsive myDataTable-table-cover'>
        <table id='example' class=' data-table myDataTable-table '>
            <thead class='thead-light'>
                <tr>
                    <th>{{ __('form.label.id')}}</th>
                    <th>{{ __('form.label.name')}}</th>
                    <th>{{ __('form.label.is_deliverable')}}</th>
                    <th>{{ __('form.label.shipping price')}}</th>
                </tr>
            </thead>
            <tbody>
                @isset($areas)
                    @foreach($areas as $area )
                        <tr>
                            <td>{{$area['id']}}</td>
                            <td>{{$area['name']}}</td>
                            <td>{{$area['is_deliverable']}}</td>
                            <td>{{getCityPrice($area['id'])}}</td>
                        </tr>
                    @endforeach
                @endisset
            </tbody>

        </table>
    </div>



@endsection


@section('css')
    <link rel="stylesheet" href="{{asset("assets/myDataTable/data.css")}}">
@endsection

@section('js')
    <script src="{{asset("assets/myDataTable/data.js")}}"></script>

@endsection
