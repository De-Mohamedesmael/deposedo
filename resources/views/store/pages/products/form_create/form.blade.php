

@include('admin.includes.createOption')
@if(session('error'))
    <div class="alert alert-danger">
        {{ session()->get('error') }}
    </div>
@endif
<form method="post" action="{{route('store.products.store')}}" enctype="multipart/form-data">
    @csrf
    <div class="form-row mb-4">


        @include('store.pages.products.form_create.checkboxes')
        @include('store.pages.products.form_create.top_section')

        @include('store.pages.products.form_create.price')


        @include('store.pages.products.form_create.new_size')

        @include('store.pages.products.form_create.kurly')
        @include('store.pages.products.form_create.statements')

        @include('store.pages.products.form_create.file_upload')

        @include('store.pages.products.form_create.description')



        @include('store.pages.products.form_create.categories')
        @include('store.pages.products.form_create.attributes')



    </div>

    <button type="submit" class="btn btn-primary mt-3">@lang('layout.add product')</button>
</form>
