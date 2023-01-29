@include('student.includes.createOption')
@include('student.includes.alert_errors')
@if(session('error'))
    <div class="alert alert-danger">
        {{ session()->get('error') }}
    </div>
@endif
<form method="post" action="{{route('student.products.update'  , $product->id)}}" enctype="multipart/form-data">
    @csrf
    @method('put')
    <div class="form-row mb-4">


        @include('student.pages.products.form_update.checkboxes')
        @include('student.pages.products.form_update.top_section')

        @include('student.pages.products.form_update.price')

        @include('student.pages.products.form_update.new_size')


        @include('student.pages.products.form_update.statements')

        @include('student.pages.products.form_update.kurly')

        @include('student.pages.products.form_update.file_upload')

        @include('student.pages.products.form_update.description')

        {{-- @include('student.pages.products.form_update.categories') --}}
        @include('student.pages.products.form_update.attributes')


    </div>

    <button type="submit" class="btn btn-primary mt-3">@lang('form.label.update product')</button>
</form>
