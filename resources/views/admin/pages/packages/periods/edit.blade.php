@extends('admin.master')

@section('breadcrumb')
<li class="breadcrumb-item"><a href="{{route('admin.countries.index')}}">@lang('layout.countries')</a></li>
<li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.periods')</span></li>
@endsection
@section('css')

<style>
    input[type=checkbox],
    input[type=radio] {
        box-sizing: border-box;
        padding: 0;
        height: 25px;
        width: 25px;
        /* margin: auto; */
        margin: 0px 8px;
    }

    .add-att {
        border: 1px solid #ddd;
        border-radius: 5px;
        /* width: 78%; */
        margin: 5px 20px;
        margin-left: 10px !important;
    }
    .header-package {
        box-shadow: 0px 4px 0px 0px #0009;
        padding: 5px;
        font-weight: 600;
    }
</style>
@endsection
@section('content')

<div class="account-settings-container layout-top-spacing">

    <div class="account-content">
        <div class="scrollspy-example" data-spy="scroll" data-target="#account-settings-scroll" data-offset="-100">
            <div class="row">

                <div class="col-xl-12 col-lg-12 col-md-12 layout-spacing">
                    @include('admin.includes.alert_success')

                    <div class="widget-content widget-content-area">
                        @include('admin.pages.packages.periods.form_edit')
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('js')

<script src="{{asset('assets/admins/plugins/bootstrap-maxlength/bootstrap-maxlength.js')}}"></script>

<script>
    $('input').maxlength({
            threshold: 40,
        });
</script>

@endsection
