<div class="form-group col-md-6">
    <label for="name_ar" class="req"> @lang('form.label.name ar')</label>
    <input name="name_ar" type="text" maxlength="50" class="form-control @error('name_ar') is-invalid @enderror"
           id="name_ar" placeholder="@lang('form.placeholder.product name ar')" value="{{old('name_ar')}}" required>
    @error('name_ar')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
</div>

<div class="form-group col-md-6">
    <label for="name_en" class="req">@lang('form.label.name en')</label>
    <input name="name_en" type="text" maxlength="50" class="form-control @error('name_en') is-invalid @enderror"
           id="name_en" placeholder="@lang('form.placeholder.product name en')" value="{{old('name_en')}}" required>
    @error('name_en')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
</div>
<div class="form-group col-md-6">
    <label for="brand_name" class="req">@lang('form.label.brand_name')</label>
    <input name="brand_name" type="text" maxlength="50" class="form-control @error('brand_name') is-invalid @enderror"
           id="name_en" value="{{old('brand_name')}}" required>
    @error('brand_name')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
</div>
<div class="form-group col-md-6">
    <label for="seller_name" class="req">@lang('form.label.seller_name')</label>
    <input name="seller_name" type="text" maxlength="50" class="form-control @error('seller_name') is-invalid @enderror"
           id="name_en" value="{{old('seller_name')}}" required>
    @error('seller_name')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
</div>

<div class="form-group col-md-6 d-none">
    <label for="slug" class="req">@lang('form.label.slug') @lang('form.label.optional')</label>
    <input name="slug" type="text" maxlength="50" class="form-control @error('slug') is-invalid @enderror" id="slug"
           value="{{old('slug')}}">
    @error('slug')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
</div>


<div class="form-group col-md-6">
    <label for="quantity" class="req">@lang('form.label.quantity')</label>
    <input name="quantity" type="number" class="form-control @error('quantity') is-invalid @enderror" id="quantity"
           value="{{old('quantity')}}" required>
    @error('quantity')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
</div>

<div class="form-group col-md-6">
    <label for="serial_number" class="req">@lang('form.label.serial_number')</label>
    <input name="serial_number" type="number" class="form-control @error('serial_number') is-invalid @enderror"
           id="serial_number"
           value="{{old('serial_number')}}" required>
    @error('serial_number')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
</div>
