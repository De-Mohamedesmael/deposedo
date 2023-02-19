<?php

use Illuminate\Support\Facades\Route;

use \App\Http\Controllers\Store\Auth\LoginController;
use \App\Http\Controllers\Store\Auth\RegisterController;
use \App\Http\Controllers\Store\Auth\ForgotPasswordController;
use \App\Http\Controllers\Store\Auth\ResetPasswordController;
use \App\Http\Controllers\Store\Auth\ConfirmPasswordController;

use \App\Http\Controllers\Store\DashboardController;
use \App\Http\Controllers\Store\ProfileController;
use \App\Http\Controllers\Store\OrderController;
use \App\Http\Controllers\Store\ProductController as ProductControllerBrand;

// Login

Route::get('save-lang/{lang}', [\App\Http\Controllers\LangController::class, 'index'])->name('lang.change');
Route::group(['prefix' => LaravelLocalization::setLocale(),
    'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]
], function() {
    Route::get('store/login', [LoginController::class , 'showLoginForm'])->name('login');
    Route::post('store/login',  [LoginController::class , 'login']);
    Route::any('store/logout',  [LoginController::class , 'logout'])->name('logout');

// Register
    Route::get('store/register', [RegisterController::class,'showRegistrationForm'])->name('register');
    Route::post('store/register', [RegisterController::class,'register']);


// Reset Password
    Route::get('store/password/reset', [ForgotPasswordController::class , 'showLinkRequestForm'])->name('password.request');
    Route::post('store/password/email', [ForgotPasswordController::class , 'sendResetLinkEmail'])->name('password.email');
    Route::get('store/password/reset/{token}', [ResetPasswordController::class , 'showResetForm'])->name('password.reset');
    Route::post('store/store/password/reset',  [ResetPasswordController::class , 'reset'])->name('password.update');

// Confirm Password
    Route::get('store/password/confirm', [ConfirmPasswordController::class,'showConfirmForm'])->name('password.confirm');
    Route::post('store/password/confirm', [ConfirmPasswordController::class,'confirm']);


// Verify Email
// Route::get('email/verify', 'Auth\VerificationController@show')->name('verification.notice');
// Route::get('email/verify/{id}/{hash}', 'Auth\VerificationController@verify')->name('verification.verify');
// Route::post('email/resend', 'Auth\VerificationController@resend')->name('verification.resend');

    Route::view('store/notActive' , 'student.pages.notActive.index')->name('notActive');

    Route::middleware('student.auth')->prefix('store')->group(function () {

        Route::get('/', [DashboardController::class, 'index'])->name('home');


        Route::get('profile', [ProfileController::class, 'show'])->name('profile.show');
        Route::post('profile/img', [ProfileController::class, 'updateImg'])->name('profile.updateImg');
        Route::put('profile', [ProfileController::class, 'updateInfo'])->name('profile.updateInfo');
        Route::post('profile', [ProfileController::class, 'updatePassword'])->name('profile.updatePassword');
        //
        // Route::get('products/showCategories' , [ProductController::class,  'showCategories'])->name('showCategories');
        //
        // Route::get('products/myProducts' , [ProductController::class,  'myProducts'])->name('myProducts');
        //
        // Route::get('products/showProducts/{cat_id}' , [ProductController::class,  'showProducts'])->name('showProducts');
        //
        // Route::post('products/saveProduct/{id}' , [ProductController::class,  'saveProduct'])->name('saveProduct');
        //
        // Route::post('products/removeProduct/{id}' , [ProductController::class,  'removeProduct'])->name('removeProduct');

        Route::resource('products', ProductController::class);
        Route::post('import/products', [ProductControllerBrand::class, 'import'])->name('products.import');
        Route::get('products/{id}/edit/', [ProductControllerBrand::class, 'edit'])->name('products.edit2');
        Route::get('trash/products/{id?}', [ProductControllerBrand::class, 'index'])->name('products.trash');
        Route::post('trash/products/{id}', [ProductControllerBrand::class, 'restore'])->name('products.restore');
        Route::delete('trash/products/{id}', [ProductControllerBrand::class, 'finalDelete'])->name('products.finalDelete');
        Route::get('attributes/products/{id}', [ProductControllerBrand::class, 'attribute'])->name('products.attributes');
        Route::get('orders', [OrderController::class, 'index'])->name('orders');

        // Route::resource('orders' , OrderController::class );
        // Route::get('orders/inpaid/' , [OrderController::class , 'index_inpaid'])->name('orders_inpaid.index');
        Route::get('orders/inpaid/', [OrderController::class, 'index_inpaid'])->name('index_inpaid.index');
        Route::get('orders/cach/', [OrderController::class, 'index_cach'])->name('index_cach.index');
        Route::PUT('orders/update/{id}', [OrderController::class, 'update'])->name('orders.update');
        Route::get('orders/{id}', [OrderController::class, 'show'])->name('orders.show');


    });
});
