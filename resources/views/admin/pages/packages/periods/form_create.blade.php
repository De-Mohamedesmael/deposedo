<form method="post" action="{{route('admin.periods.store')}}" enctype="multipart/form-data" novalidate>
    @csrf
    <div class="form-row mb-4">

        <div class="form-group col-md-6">
            <label for="period">@lang('form.label.period in month')</label>
            <input name="period" type="number"
                   class="form-control @error('period') is-invalid @enderror"
                id="period" placeholder="" value="{{old('period')}}" required>
            @error('period')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>

        <div class="form-group col-md-6">
            <label for="price">@lang('form.label.price')</label>
            <input name="price" type="number"  class="form-control @error('price') is-invalid @enderror"
                id="price" placeholder="" value="{{old('price')}}" required>
            @error('price')<span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>@enderror
        </div>

        <div class="form-group col-md-6">
            <label for="package_id">@lang('form.label.package')</label>
            <select name="package_id" class="form-control @error('package_id') is-invalid @enderror" id="package_id">
                @foreach($packages as $package)
                    <option {{old('package_id')==$package->id ? 'selected' : ''}}
                            value="{{$package->id}}">{{$package->name}}
                    </option>
                @endforeach
            </select>
            @error('package_id')<span class="invalid-feedback" role="alert"><strong>{{ $message
                    }}</strong></span>@enderror
        </div>

    </div>

    <button type="submit" class="btn btn-primary mt-3">@lang('layout.add package_periods')</button>
</form>
