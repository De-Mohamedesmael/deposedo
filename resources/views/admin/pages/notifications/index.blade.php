@extends('admin.master')

@section('breadcrumb')
        <li class="breadcrumb-item active" aria-current="page"><span> __('site.notifications') </span></li>
 
@endsection

@section('content')

    @include('admin.includes.modalBtnAction')

    {!! myDataTable_button([
        __('site.createnotification') => route('admin.notification.create'),
      ]) !!}



    {!! myDataTable_table([
        "id"           => 'id',
        "title"        => __('site.title'),
        "image"        => __('site.image'),
        "created_at"   =>__('site.created_at'),
    ]) !!}

@endsection

@section('css')
    <link rel="stylesheet" href="{{asset("assets/myDataTable/data.css")}}">
@endsection

@section('js')
    <script src="{{asset("assets/myDataTable/data.js")}}"></script>
    <script>



        myDataTableColumns({
            name   :  ['id', 'title', 'image', 'created_at'],
            class  : {'updated_at': 'notEdit' , 'created_at': 'notEdit', 'image':'notEdit', 'title':'notEdit'},
            file   : {'image':'{{'{image}'}}'},

            btn    :  {

                'delete'       : '{{route('admin.notification.destroy' , '')}}'+'/{id}',
                'print'        : '#',

            }
        })
    </script>
@endsection
