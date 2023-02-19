@include('admin.includes.createOption')
@include('admin.includes.alert_errors')
@if(session('error'))
    <div class="alert alert-danger">
        {{ session()->get('error') }}
    </div>
@endif

<form method="post" action="{{route('store.products.update'  , $product->id)}}" enctype="multipart/form-data">
    @csrf
    @method('put')
    <div class="form-row mb-4">

        @include('store.pages.products.form_update.checkboxes')

        @include('store.pages.products.form_update.top_section')

        @include('store.pages.products.form_update.price')

        @include('store.pages.products.form_update.new_size')


        @include('store.pages.products.form_update.statements')

        @include('store.pages.products.form_update.kurly')

        @include('store.pages.products.form_update.file_upload')

        @include('store.pages.products.form_update.description')

        @include('store.pages.products.form_update.categories')

        @include('store.pages.products.form_update.attributes')



    </div>

    <button type="submit" class="btn btn-primary mt-3">@lang('form.label.update product')</button>
</form>
