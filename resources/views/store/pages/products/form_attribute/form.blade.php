<form method="post" action="{{route('store.products.store')}}" enctype="multipart/form-data">
    @csrf
    <div class="form-row mb-4">

        @include('admin.pages.products.form_attribute.attributes')

    </div>

</form>
