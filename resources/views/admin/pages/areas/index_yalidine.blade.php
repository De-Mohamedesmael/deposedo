@extends('admin.master')


@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{route('admin.areas.index')}}">@lang('layout.areas')</a>
    </li>
    <li class="breadcrumb-item active" aria-current="page">
        <span>@lang('layout.trash')</span>
    </li>
@endsection

@section('content')

    <div class='example-div'>
        <table id='example' class='example-table'>
            <thead class='thead-light'>
            <tr>
                <th>{{ __('form.label.id')}}</th>
                <th>{{ __('form.label.name')}}</th>
                <th>{{ __('form.label.is_deliverable')}}</th>
                <th>{{ __('form.label.shipping price')}}</th>
                <th>{{ __('form.label.shipping price desk_fee')}}</th>
            </tr>
            </thead>
            <tbody>
            @isset($areas)
                @foreach($areas as $area )
                    <tr>
                        <td>{{$area['id']}}</td>
                        <td>{{$area['name']}}</td>
                        <td>{{$area['is_deliverable']}}</td>
                        <!--<td>{{getCityPrice($area['id'])['home_fee']}}</td>-->
                        <!--<td>{{getCityPrice($area['id'])['home_fee']}}</td>-->

                    </tr>
                @endforeach
            @endisset
            </tbody>

        </table>
    </div>



@endsection


@section('css')
    <link rel="stylesheet" href="{{asset("assets/myDataTable/data.css")}}">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">

@endsection

@section('js')
    <script src="{{asset("assets/myDataTable/data.js")}}"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#example').DataTable({
                scrollX: true,
            });
        });
    </script>
@endsection
