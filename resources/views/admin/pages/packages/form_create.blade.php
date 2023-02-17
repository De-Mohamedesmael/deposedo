<form method="post" action="{{route('admin.packages.store')}}" enctype="multipart/form-data" novalidate>
    @csrf
    <div class="form-row mb-4">

        <div class="form-group col-md-6">
            <label for="name_ar">@lang('form.label.name ar')</label>
            <input name="name_ar" type="text" maxlength="50" class="form-control @error('name_ar') is-invalid @enderror"
                id="name_ar" placeholder="" value="{{old('name_ar')}}" required>
            @error('name_ar')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>

        <div class="form-group col-md-6">
            <label for="name_en">@lang('form.label.name en')</label>
            <input name="name_en" type="text" maxlength="50" class="form-control @error('name_en') is-invalid @enderror"
                id="name_en" placeholder="" value="{{old('name_en')}}" required>
            @error('name_en')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>
        <div class="form-group col-md-6">
            <label for="count_product">@lang('form.label.count_product')</label>
            <input name="count_product" type="number"  class="form-control @error('count_product') is-invalid @enderror"
                id="count_product" placeholder="" value="{{old('count_product')}}" required>
            @error('count_product')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>
        <div class="form-group col-md-6">
            <label for="img">@lang('form.label.img') @lang('form.label.optional')</label>
            <input name="img" type="file" maxlength="255" class="form-control @error('img') is-invalid @enderror"
                id="img" value="{{old('img')}}" accept="image">
            @error('img')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>


    </div>

    <button type="submit" class="btn btn-primary mt-3">@lang('layout.add package')</button>
</form>
