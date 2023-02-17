<form method="post" action="{{route('admin.periods.update')}}" enctype="multipart/form-data" novalidate>
    @csrf

        <input type="hidden" value="{{request()->country_id}}" name="country_id">
        @if($periods->count() <= 0)
            @foreach($packages as $package)
                all_notfound<br>
            @endforeach
        @else
            @foreach($packages as $package_key => $package)
                <div class="row">
                    <h2 class="alert-heading header-package"> {{$package->name}} </h2>

                @php
                    $package_periods= $periods->where('package_id',$package->id);
                @endphp
                @if($package_periods)
                    <div class="col-md-12 row">
                        @foreach($package_periods as $period_key=>$period)

                            <div class="form-group col-md-6">
                                <label for="period">@lang('form.label.period in month')</label>
                                <input name="period[{{$package_key}}][{{$period_key}}]" type="number"
                                       class="form-control @error('period') is-invalid @enderror" id="period" value="{{$period->period}}"
                                       required>
                                @error('period')<span class="invalid-feedback" role="alert"><strong>{{ $message
                                    }}</strong></span>@enderror
                            </div>
                            <div class="col-md-6">

                            </div>
                            {{$period->id}}<br>
                        @endforeach
                    </div>
                @else
                    <div class="col-md-12 row">
                        notfound<br>
                    </div>
                @endif
                </div>
            @endforeach
        @endif
         {{-- <div class="form-group col-md-12">
            <label for="title_ar">@lang('form.label.news name ar')</label>
            <input name="title_ar" type="text" maxlength="50"
                class="form-control @error('title_ar') is-invalid @enderror" id="title_ar" value="{{$news->title_ar}}"
                required>
            @error('title_ar')<span class="invalid-feedback" role="alert"><strong>{{ $message
                    }}</strong></span>@enderror
        </div>

        <div class="form-group col-md-12">
            <label for="description_ar">@lang('form.label.news description ar')</label>
            <textarea name="description_ar" type="text"
                class="form-control @error('description_ar') is-invalid @enderror" id="description_ar" required
                rows="6">{{$news->description_ar}}</textarea>
            @error('description_ar')<span class="invalid-feedback" role="alert"><strong>{{ $message
                    }}</strong></span>@enderror
        </div>

        <div class="form-group col-md-12">
            <label for="title_en">@lang('form.label.news name en')</label>
            <input name="title_en" type="text" maxlength="50"
                class="form-control @error('title_en') is-invalid @enderror" id="title_en" value="{{$news->title_en}}"
                required>
            @error('title_en')<span class="invalid-feedback" role="alert"><strong>{{ $message
                    }}</strong></span>@enderror
        </div>

        <div class="form-group col-md-12">
            <label for="description_en">@lang('form.label.news description en')</label>
            <textarea name="description_en" type="text"
                class="form-control @error('description_en') is-invalid @enderror" id="description_en" required
                rows="6">{{$news->description_en}}</textarea>
            @error('description_en')<span class="invalid-feedback" role="alert"><strong>{{ $message
                    }}</strong></span>@enderror
        </div>


        <div class="form-group col-md-12">
            <label for="img">@lang('form.label.img')<span> (800 x 800 ) </span></label>
            <input maxlength="255" name="img" type="file" class="form-control @error('img') is-invalid @enderror"
                id="img" value="{{old('img')}}">
            @error('img')<span class="invalid-feedback" role="alert"><strong>{{ $message
                    }}</strong></span>@enderror
        </div>
    </div> --}}
    <button type="submit" class="btn btn-primary mt-3">@lang('layout.edit periods')</button>
</form>
