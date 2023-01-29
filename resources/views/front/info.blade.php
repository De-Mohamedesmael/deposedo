 @extends('layouts.front')
@section('title', __('site.'.$pages->first()->type))

@section('content')



<header class="container  border-main">
<ul class="nav product" >
<li class="nav-item  ">  <a class="nav-link  "  href="{{url('/')}}" > {{__('site.index')}} </a>
</li>
<li class="nav-item  ">  <a class="nav-link  "   >  <i class="fas fa-arrow-left " style="font-size: 20px"></i></a>
</li>
<li class="nav-item ">  <a class="nav-link   "  href="" > {{__('site.'.$pages->first()->type)}} </a>
</li>
</ul>

</header>
<!--- --->
<div class="container ">
    <br><br>
    <h1 class="text-center">{{__('site.'.$pages->first()->type)}}</h1>
    <br><br>
      <div class="p-3 ">
        @foreach($pages as $page)
          <div class="row">
              {!! app()->getLocale()=='ar'? $page->description_ar : $page->description_en !!}
          </div>
        @endforeach

      </div>
</div>

 @stop
