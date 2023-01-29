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
        $country = session()->get("country");
        $currency = session()->get("currency");
        $currency_def=	Currency::first()->name;

        if($currency != [] || $currency != null) {
            $currency_def=$currency->name;

        }elseif($country !=[] || $country != null){
            $m_Country=	Currency::firstwhere('id',$country->currency_id);
            if($m_Country){
                $currency_def= $m_Country->name;
            }

        }elseif(Auth::guard('web')->check()){
            $m_Country=	Country::with('currency')
                ->firstwhere('id',Auth::guard('web')->user()->country_id);
            if($m_Country){
                $currency_def= $m_Country->currency->name;
            }
        }
        app()->setLocale($lang);

               view()->share(compact('currency_def','currencies_home',"kokart_country",'blue_zone_cats','icons','ads_h'));

    }
}
