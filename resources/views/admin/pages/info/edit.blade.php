@extends('admin.master')

@section('breadcrumb')
    <li class="breadcrumb-item active" aria-current="page"><span>@lang('layout.edit info')</span></li>
@endsection

@section('content')
    <div class="account-settings-container layout-top-spacing">

        <div class="account-content">
            <div class="scrollspy-example" data-spy="scroll" data-target="#account-settings-scroll" data-offset="-100">
                <div class="row">

                    <div class="col-xl-12 col-lg-12 col-md-12 layout-spacing">
                        @include('admin.includes.alert_success')

                        <div class="widget-content widget-content-area">
                            @include('admin.pages.info.form_update')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('js')
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: 'textarea#description_en', // Replace this CSS selector to match the placeholder element for TinyMCE
            plugins: 'code table lists',
            toolbar: 'undo redo | formatselect| bold italic | alignleft aligncenter alignright | indent outdent | bullist numlist | code | table',
            min_height: 300,
            height: 900,
        });
        tinymce.init({
            selector: 'textarea#description_ar', // Replace this CSS selector to match the placeholder element for TinyMCE
            plugins: 'code table lists',
            toolbar: 'undo redo | formatselect| bold italic | alignleft aligncenter alignright | indent outdent | bullist numlist | code | table',
            min_height: 300,
            height: 900,
        });
    </script>
    <script src="{{ asset('assets/plugins/bootstrap-maxlength/bootstrap-maxlength.js') }}"></script>

    <script>
        $('input').maxlength({
            threshold: 40,
        });
    </script>
@endsection
