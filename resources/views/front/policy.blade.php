 @extends('layouts.front')
@section('title', "policy")

@section('content')

 

<header class="container  border-main">
<ul class="nav product" >
<li class="nav-item  ">  <a class="nav-link  "  href="{{url('/')}}" > Home </a>	
</li>
<li class="nav-item  ">  <a class="nav-link  "   >  <i class="fas fa-arrow-right " style="font-size: 20px"></i></a>	
</li>
<li class="nav-item ">  <a class="nav-link   "  href="" > policy </a>
</li>    
</ul>

</header>
<!--- --->
<div class="container "><br><br>
<div class="row">
       <ul>
    @foreach($pages_content as $page)
    
    @if($page->name == "policy")
    
    
   
        
        <li>
            <h5>
                {{$page->title_en}} 
            </h5>
            <p>
                 {{$page->content_en}}
            </p>
        </li>
        
  
   
    
    @endif
    
    @endforeach
      </ul>
    
</div>
</div>
 
 @stop