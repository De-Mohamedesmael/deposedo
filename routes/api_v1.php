<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\Api\AuthController;
use App\Http\Controllers\Web\Api\HomeProductsController;
use App\Http\Controllers\Web\Api\CategoryController;
use App\Http\Controllers\Web\Api\TapProductController;
use App\Http\Controllers\Web\Api\SingleProductController;
use App\Http\Controllers\Web\Api\ProductInCategoriesController;
use App\Http\Controllers\Web\Api\DesignController;
use App\Http\Controllers\Web\Api\RatingProductController;
use App\Http\Controllers\Web\Api\LikeController;
use App\Http\Controllers\Web\Api\CartController;
use App\Http\Controllers\Web\Api\OrderController;
use App\Http\Controllers\Web\Api\CouponController;
use App\Http\Controllers\Web\Api\ShippingAddressController;
use App\Http\Controllers\Web\Api\AreaController;
use App\Http\Controllers\Web\Api\CountryController;
use App\Http\Controllers\Web\Api\ContactController;
use App\Http\Controllers\Web\Api\InfoController;
use App\Http\Controllers\Web\Api\SearchProductController;
use App\Http\Controllers\Web\Api\IconController;
use App\Http\Controllers\Store\Api\StudentController;

use App\Http\Controllers\Web\Api\NotificationController;
use App\Http\Controllers\Store\Api\AuthController as AuthStudentController;

const Response_Success = 1;
const Response_Fail = 0;

//////////////////////////////// start  auth /////////////////////////////////////////////

Route::post('login', [AuthController::class , 'login']);
Route::post('register', [AuthController::class , 'register']);
Route::post('logout', [AuthController::class , 'logout']);
Route::post('refresh', [AuthController::class , 'refresh']);
Route::get('profile', [AuthController::class , 'userProfile']);
Route::post('edit-profile', [AuthController::class , 'editProfile']);
Route::post('update-image', [AuthController::class , 'updateImage']);
Route::post('change-password', [AuthController::class , 'changePassword']);
Route::post('check-email', [AuthController::class , 'checkEmail']);
Route::post('check-code', [AuthController::class , 'checkCode']);

Route::post('forgot-password', [AuthController::class , 'forgotPassword']);
Route::post('remove-account', [AuthController::class , 'removeAccount']);
Route::post('custom-remove-account', [AuthController::class , 'customRemoveAccount']);

//////////////////////////////// end  auth /////////////////////////////////////////////


///////////////////////////////// start Home /////////////////////////////////////

Route::get('get-home-products' , [HomeProductsController::class , 'index']);

Route::get('get-ids-product-like' ,  [HomeProductsController::class , 'idsProductLike']);
Route::get('get-order-payment/' , [HomeProductsController::class , 'get_order'])->name('get-order-payment');

///////////////////////////////// end Home /////////////////////////////////////


///////////////////////////////// start categories /////////////////////////////////////

Route::get('get-parent-categories' , [CategoryController::class , 'parentCategories']);

Route::get('get-sub-categories' , [CategoryController::class , 'subCategories']);

///////////////////////////////// end categories ///////////////////////////////////////


/////////////////////////////////// start products in categories //////////////////////////

Route::get('get-products-in-parentCategory/{category_id}' , [ProductInCategoriesController::class , 'productsInParentCategory']);

Route::get('get-new-products/{category_id}' , [ProductInCategoriesController::class , 'newProducts']);

Route::get('get-best-products/{category_id}' , [ProductInCategoriesController::class , 'bestProducts']);

Route::get('get-offer-products/{category_id}' , [ProductInCategoriesController::class , 'offerProducts']);

Route::get('get-recommended-products/{category_id}' , [ProductInCategoriesController::class , 'recommendedProducts']);

/////////////////////////////////// end products in categories //////////////////////////////


///////////////////////////////// start tabs //////////////////////////////////////////
Route::get('save-lang/{lang}', [\App\Http\Controllers\LangController::class, 'index'])->name('lang.change');

Route::get('get-new-products' , [TapProductController::class , 'newProducts']);

Route::get('get-best-products' , [TapProductController::class , 'bestProducts']);

Route::get('get-offer-products' , [TapProductController::class , 'offerProducts']);

Route::get('get-recommended-products' , [TapProductController::class , 'recommendedProducts']);

Route::get('get-topLikes-products' , [TapProductController::class , 'topLikesProducts']);

Route::get('get-topRating-products' , [TapProductController::class , 'topRatingProducts']);

///////////////////////////////// end tabs ///////////////////////////////////////////////


/////////////////////////////////// start single products///////////////////////////////////

Route::get('get-product/{product_id}' , [SingleProductController::class , 'getProduct'])->name('product');
Route::post('check-product' , [SingleProductController::class , 'checkProduct'])->name('checkProduct');
Route::post('get-colors' , [SingleProductController::class , 'getColorForSizeProduct'])->name('getColorForSizeProduct');

Route::get('product/get-ratings' , [SingleProductController::class , 'getRatings']);

/////////////////////////////////// end single product ///////////////////////////////////////


///////////////////////////////////////// start rating ///////////////////////////////////////////////

Route::post('get-my-ratings' , [RatingProductController::class , 'getMyRating']);

Route::post('save-rating' , [RatingProductController::class , 'saveRating']);

///////////////////////////////////////// end rating ////////////////////////////////////////////////
Route::post('get-my-search' , [SearchProductController::class , 'get_my_search']);
Route::post('search' , [SearchProductController::class , 'search']);
///////////////////////////////////////// end designs ////////////////////////////////////////////////
Route::post('designs/request' , [DesignController::class , 'request']);
Route::get('designs' , [DesignController::class , 'index']);
Route::get('designs/get-ratings/{id}' , [DesignController::class , 'getRatings']);
Route::post('designs/save-rating' , [DesignController::class , 'saveRating']);
Route::post('designs/edit-rating' , [DesignController::class , 'editRating']);
Route::post('designs/delete-rating' , [DesignController::class , 'deleteRating']);

Route::get('designs/{id}' , [DesignController::class , 'show']);


///////////////////////////////////////// start like ///////////////////////////////////////////////

Route::post('product/like' , [LikeController::class , 'saveOrRemove']);

Route::post('get-myProducts-likes' , [LikeController::class , 'getMyProductsLikes']);

///////////////////////////////////////// end like /////////////////////////////////////////////////

///////////////////////////////////////// start carts ///////////////////////////////////////////////

Route::post('all-cart' , [CartController::class , 'index']);
Route::post('add-to-cart' , [CartController::class , 'store']);
Route::post('remove-to-cart' , [CartController::class , 'remove']);
Route::post('remove-all-to-cart' , [CartController::class , 'removeAll']);


///////////////////////////////////////// end carts /////////////////////////////////////////////////


///////////////////////////////////////// start order /////////////////////////////////////////

Route::get('get-currencies' , [ CountryController::class , 'currencies']);
Route::get('get-countries' , [CountryController::class , 'index']);

Route::get('get-areas' , [AreaController::class , 'index']);

Route::post('get-order' , [OrderController::class , 'getOrder']);
Route::post('shipping_time' , [OrderController::class , 'shippingTime']);
Route::post('get-orders' , [OrderController::class , 'getOrders']);
Route::post('save-order' , [OrderController::class , 'save']);
Route::post('update-order' , [OrderController::class , 'updateOrder']);

Route::post('check-coupon' , [CouponController::class , 'checkCoupon']);

///////////////////////////////////////// end order /////////////////////////////////////////////////
///////////////////////////////// start notifications //////////////////////////////////////////
Route::post('notifications', [NotificationController::class, 'index']);
Route::post('notifications/save_token' , [NotificationController::class , 'save_token']);
Route::post('notifications/count' , [NotificationController::class , 'count']);
Route::post('notifications/show' , [NotificationController::class , 'show']);

///////////////////////////////// end notifications ///////////////////////////////////////////////


Route::post('get-myShipping-address' , [ShippingAddressController::class , 'index']);

Route::post('save-myShipping-address' , [ShippingAddressController::class , 'save']);

Route::post('update-myShipping-address' , [ShippingAddressController::class , 'update']);

Route::post('delete-myShipping-address' , [ShippingAddressController::class , 'delete']);

///////////////////////////////////////// start student ///////////////////////////////////////////////

Route::post('register-students' , [AuthStudentController::class , 'register']);

Route::get('home-students' , [StudentController::class , 'homeStudents']);

Route::get('get-students' , [StudentController::class , 'getStudents']);

Route::get('get-products-student' , [StudentController::class , 'getProducts']);

///////////////////////////////////////// end student /////////////////////////////////////////////////


///////////////////////////////////////// start info ///////////////////////////////////////////////

Route::get('infos' , [InfoController::class , 'index']);

///////////////////////////////////////// end info /////////////////////////////////////////////////




///////////////////////////////////////// start icon ///////////////////////////////////////////////

Route::get('icons' , [IconController::class , 'index']);

///////////////////////////////////////// end info /////////////////////////////////////////////////


///////////////////////////////////////// start contact ///////////////////////////////////////////////

Route::post('contact' , [ContactController::class , 'save']);

///////////////////////////////////////// end contact /////////////////////////////////////////////////
