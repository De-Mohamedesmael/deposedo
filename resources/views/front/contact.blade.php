
  @extends('layouts.front')
@section('title', 'Contact')
@section('content')

<div class="container  border-main" ><br>
    <div class="row  bg-w">

        <div class="col-md-6 ">
        <h2> {{__('site.contact us')}}</h2>
        <p>{{__('site.We are happy to receive your inquiries and suggestions.')}}</p>
{{--        @if (Session::has('success'))--}}
{{--            <div class="alert alert-info">{{ Session::get('success') }}</div>--}}
{{--        @endif--}}
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
            <form  method="post" name="contact_form" class="" action="">
                @csrf
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">{{__('site.name')}}</label>
                    <div class="col-sm-9">
                        <input type="text" name="name"  class="form-control-plaintext"   placeholder="{{__('site.name')}}" >
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label"> {{__('site.phone number')}}</label>
                    <div class="col-sm-9">
                        <input type="tel" name="phone" class="form-control-plaintext"   placeholder="{{__('site.phone number')}}" >
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">{{__('site.email')}}</label>
                    <div class="col-sm-9">
                        <input type="email" name="email"   class="form-control-plaintext"   placeholder="example@domain.com" >
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">{{__('site.title')}}</label>
                    <div class="col-sm-9">
                        <input type="text" name="title"   class="form-control-plaintext"   placeholder="{{__('site.title')}}" >
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">{{__('site.message')}}</label>
                    <div class="col-sm-9">
                        <textarea  rows="3" name="message" class="form-control-plaintext"  ></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label"></label>
                    <div class="col-sm-9">
                        <button class="btn btn-dark" type="submit" >{{__('site.send')}}</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
 @stop
