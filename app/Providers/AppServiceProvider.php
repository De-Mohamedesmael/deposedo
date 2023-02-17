<?php

namespace App\Providers;

use App\Models\Currency;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\ServiceProvider;
use App\Models\Country;
use App\Models\Category;
use App\Models\Icon;
use App\Models\Ad;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Paginator::useBootstrap();
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

         $lang =  'ar';
        $kokart_country = Country::get();
        $icons = Icon::where('type' , 'icon')->get(['title' , 'img' , 'link']);

        $blue_zone_cats =  Category::where('parent_id',0)->get();
        $currencies_home=  Currency::get();
         $ads_h= Ad::where('position' , 3)->inRandomOrder()->get();

        app()->setLocale($lang);

               view()->share(compact('currencies_home',"kokart_country",'blue_zone_cats','icons','ads_h'));

    }
}
