<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use App\Http\Controllers\front\homeController;
use App\Http\Controllers\front\cartController;
use App\Http\Controllers\Auth\ClientAuthController;
use App\Http\Controllers\front\clientsLoginController;
use App\Http\Controllers\front\productsController;
use App\Http\Controllers\WishListController;
use App\Http\Controllers\front\InfoController;


Route::group(['prefix' => LaravelLocalization::setLocale(),
    'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]
], function()


{
     Route::get('/de', [ClientAuthController::class,"de"] )->name('de');
    //islam
     Route::get('/login/client', [ClientAuthController::class,"showClientLoginForm"])->name('login/client');//islam
    Route::post('/login/client', [ClientAuthController::class,"clientLogin"] )->name('login');//islam
    Route::get('/register/client', [ClientAuthController::class,"showClientRegisterForm"] )->name("register/client");//islam
    Route::post('/register/client', [ClientAuthController::class,"createClient"] )->name('register');//islam
    Route::get('/check',[clientsLoginController::class,"check"] )->middleware(['auth:clients']);//islam
     Route::get('/logout/client', [ClientAuthController::class,"logout"] )->name('logout.client');

    //wishList routes islam
    Route::get('/wishlist', [WishListController::class , 'store'])->name('wishlist.store');
    Route::get('/wishlist/products', [WishListController::class , 'index'])->name('wishlist.products.index');
    Route::delete('/wishlist', [WishListController::class , 'destroy'])->name('wishlist.destroy');
//wishList routes End islam
    //23 july Islam
    Route::get('/account', [ClientAuthController::class,'account'])->name('account.index');
    Route::get('/account/orders/{id}', [ClientAuthController::class,'orders'])->name('account.orders');

    Route::get('/address/client/{id}', [ClientAuthController::class,'address_index'])->name('address.index');
    Route::get('/address/create/', [ClientAuthController::class,'address_view'])->name('address.create');
    Route::post('/address/client', [ClientAuthController::class,'address_store'])->name('address.store');


    ///////islam 22 august/////

    Route::get('/client/verify/{token}', [ClientAuthController::class,'verifyUser']);
    Route::get('/forgot-password', [ClientAuthController::class,'showForgetPasswordForm'])->name('forget.password.get');
    Route::post('/forgot-password', [ClientAuthController::class,'submitForgetPasswordForm'])->name('forget.password.post');
    Route::get('/reseet-password/{token}', [ClientAuthController::class,'showResetPasswordForm'])->name('reset.password.get');
    Route::post('/reseet-password', [ClientAuthController::class,'submitResetPasswordForm'])->name('reset.password.post');

        Route::get('/order/view/{id}', [ClientAuthController::class,'order_view'])->name('order.view');


    /////////////End Islam////////////
    Route::delete('/address/delete/{id}', [ClientAuthController::class,'address_delete'])->name('address.destroy');
    Route::get('/address/edit/{id}', [ClientAuthController::class,'address_edit'])->name('address.edit');
    Route::put('/address/update/{id}', [ClientAuthController::class,'address_update'])->name('address.update');


    Route::get('/account/edit/{id}', [ClientAuthController::class,'account_edit'])->name('account.edit');
    Route::put('/account/update/{id}', [ClientAuthController::class,'account_update'])->name('account.update');


//23 july Islam
    //home controller
  Route::get('/', [homeController::class, 'home'] )->name("home");

  Route::get('/product/{id}', [homeController::class,"product"]  )->name("product");
 Route::get('/show/{type}/{sortby?}', [homeController::class,"productByType"]  )->name("productByType");

 Route::get('/vendor/{id}/{sortby?}', [homeController::class,"vendor"] )->name("vendor");
Route::get('/brand/{id}', [homeController::class,"brand"] )->name("brand");
    Route::post('/getCity',[cartController::class,'getCity'])->name('get.city');
    Route::post('/getDelivery',[cartController::class,'getDelivery'])->name('get.delivery');


//cart controller


        Route::get('/checkout', [cartController::class,"checkout"] )->name("checkout");

         Route::get('/payment/{id}', [cartController::class,"v2_payment"] )->name("v2_payment");


         Route::get('/success/payment/{order_id}', [cartController::class,'success_payment'])->name("success_payment");
          Route::get('/error/payment/{order_id}', [cartController::class,'error_payment'])->name("error_payment");

          Route::get('/msg', [cartController::class,'msg'])->name("msg");

        Route::post('/checkout/store', [cartController::class,"checkout_store"] )->name("checkout.store");

        Route::get('/cart/remove', [cartController::class,"remove_from_cart"] )->name("cart.remove");


    Route::get('/cart/{id}/{qut}', [cartController::class,"add_to_cart"] )->name("add.cart");


    Route::get('/cart/index', [cartController::class,"go_to_cart"] )->name("cart.show");

    Route::post('/cart/add', [cartController::class,"add_to_cart_post"] )->name("add.cart.post");

 Route::get('/update_cart/{id}/{qut}/{key}', [cartController::class,"update_cart"]  )->name("update_cart");


// //    TODO :: VIEW PRODUCTS OF CAT
//     Route::get('/cat/product/{cat_id}' ,[productsController::class , 'catProduct'] )->name('cat.products');
//
//
// //    TODO :: VIEW PRODUCTS OF SUB-CAT
//     Route::get('/sub/cat/product/{sub_cat_id}' ,[productsController::class , 'subCatProduct'] )->name('sub.cat.products');





Route::get('contact-us', function() {

      return view("front.contact");
  })->name("contact");
    Route::post('contact-us',[InfoController::class,"SaveContact"]);
Route::get('info/{type}', [InfoController::class,"index"] )->name("front.info");
Route::get('set-currency/{currency_id}', [homeController::class,"changeCurrency"] )->name("front.set-currency");






  //TODO :: SEARCH
      Route::get('/searching' ,[productsController::class , 'searching'])->name('searching');

      Route::get('/migrate', function() {
        $exitCode = Artisan::call('migrate');
        return '<h1>Cache facade value cleared</h1>';
    });


});
