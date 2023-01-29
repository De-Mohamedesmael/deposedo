<form method="post" action="{{route('admin.sliders.store')}}" enctype="multipart/form-data">

    @csrf


    <div class="form-row mb-4">


        <div class="form-group col-md-12">
            <label for="img">@lang('form.label.img')</label>
            <span class="text-danger">@lang('form.label.optimal_size') 1070 × 500 px</span>
            <input maxlength="255" name="img" type="file" class="form-control @error('img') is-invalid @enderror" id="img" value="{{old('img')}}" required>
            @error('img')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>

        <div class="form-group col-md-12">
            <label for="in_app">@lang('form.label.type link')</label>
            <select name="in_app" type="text" class="form-control @error('in_app') is-invalid @enderror" id="in_app">
                <option value="0">@lang('form.label.normal link')</option>
                <option value="0">@lang('form.label.app link')</option>
            </select>
            @error('in_app')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>

{{--
        <div class="form-group col-md-12">
            <label for="description">@lang('form.label.description') @lang('form.label.optional')</label>
            <input maxlength="100" name="description" type="text" class="form-control @error('description') is-invalid @enderror" id="description" placeholder="@lang('form.placeholder.slider description')" value="{{old('description')}}" required>
            @error('description')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>
--}}
        <div class="form-group col-md-12">
            <label for="link">@lang('form.label.link')</label>
            <input maxlength="10000" name="link" type="text" class="form-control @error('link') is-invalid @enderror" id="link" placeholder="@lang('form.placeholder.link')" value="{{old('link')}}" required>
            <div id="cover-result"></div>
            @error('link')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
            <input type="hidden" name="type" value="">
        </div>

    </div>

    <button type="submit" class="btn btn-primary mt-3">@lang('layout.add slider')</button>

</form>
