<form class="mt-5" action="{{route('store.profile.updateInfo')}}" method="post">
    @csrf
    @method('put')

    <input name="id" type="hidden" value="{{$auth->id}}">

    <h6 class="heading-small text-primary mb-4">@lang('form.label.info account')</h6>
    <div class="pl-lg-4">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group focused">
                    <label class="form-control-label text-black" for="input-username">@lang('form.label.name')</label>
                    <input name="name" type="text" id="input-username" class="form-control form-control-alternative @error('name') is-invalid @enderror" value="{{$auth->name}}" required>
                    @error('name')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label class="form-control-label text-black" for="input-email">@lang('form.label.email')</label>
                    <input name="email" type="email" id="input-email" class="form-control form-control-alternative @error('email') is-invalid @enderror" value="{{$auth->email}}" required>
                    @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label class="form-control-label text-black" for="phone">@lang('form.label.phone')</label>
                    <input name="phone" type="tel" id="phone" class="form-control form-control-alternative @error('phone') is-invalid @enderror" value="{{$auth->phone}}" required>
                    @error('phone')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>



            

            <div class="col-lg-6">
                <div class="form-group">
                    <label class="form-control-label text-black" for="facebook">@lang('form.label.link facebook')</label>
                    <input name="facebook" type="text" id="facebook" class="form-control form-control-alternative @error('facebook') is-invalid @enderror" value="{{$auth->facebook}}">
                    @error('facebook')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-group">
                    <label class="form-control-label text-black" for="instagram">@lang('form.label.link Instagram')</label>
                    <input name="instagram" type="text" id="instagram" class="form-control form-control-alternative @error('instagram') is-invalid @enderror" value="{{$auth->instagram}}">
                    @error('instagram')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-group">
                    <label class="form-control-label text-black" for="linkedin">@lang('form.label.link linkedin')</label>
                    <input name="linkedin" type="text" id="linkedin" class="form-control form-control-alternative @error('linkedin') is-invalid @enderror" value="{{$auth->linkedin}}">
                    @error('linkedin')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-group">
                    <label class="form-control-label text-black" for="twitter">@lang('form.label.link twitter')</label>
                    <input name="twitter" type="text" id="twitter" class="form-control form-control-alternative @error('twitter') is-invalid @enderror" value="{{$auth->twitter}}">
                    @error('twitter')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>

        </div>
    </div>
    <button type="submit" class="btn btn-primary btn-block ">@lang('form.label.update info')</button>
</form>
