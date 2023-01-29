
<div class=" container pt-4 pb-4">
<div class="swiper mySwiper1" style="height:auto;">
  <div class="swiper-wrapper"style="height:auto;">
    @foreach($items as $one)
      <div class="swiper-slide @if($loop->first) active @endif" >
      <a class="w-100" href="{{$one -> in_app==0?$one ->link :($one ->type == 'product'?route("product",$one->link):route("vendor",$one->link))}}" target="_blank">
        <img class="d-block img-ads" style="
          width: 100%;display: block;
          margin-left: auto;
          height: 300px !important;
          margin-right: auto;" data-aos="fade-right"
                                data-aos-offset="300"
          src="{{asset('assets/images/ads/'.$one->img)}}" alt="">
        </a>
      </div>
    @endforeach
  </div>
</div>
</div>
