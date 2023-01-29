@extends('admin.masterAuth')

@section('content')
    <div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">@lang('form.label.login')</h1>
                        <p class="">@lang('form.label.login admin')</p>

                        @include('admin.auth.form_login')
                        <div class="division mt-2">
                        </div>
                        <a  rel="alternate" hreflang="{{ 'ar' }}" href="{{ LaravelLocalization::getLocalizedURL('ar', null, [], true) }}" class="dropdown-item d-flex" >
                            <img src="{{asset('assets/images/flags/ar.png')}}" width="25" class="flag-width" alt="flag">
                            <span class="align-self-center">&nbsp;Arabic</span>
                        </a>
                        <a  rel="alternate" hreflang="{{ 'en' }}" href="{{ LaravelLocalization::getLocalizedURL('en', null, [], true) }}" class="dropdown-item d-flex" >
                            <img src="{{asset('assets/images/flags/en.png')}}" width="25" class="flag-width" alt="flag">
                            <span class="align-self-center">&nbsp;English</span>
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
