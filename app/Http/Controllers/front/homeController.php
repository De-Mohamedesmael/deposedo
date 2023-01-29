<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use Illuminate\Http\Request;
use  App\Models\Item;
use  App\Models\Category;
use  App\Models\Slider;
use  App\Models\Product;

use  App\Models\Country;
use Carbon\Carbon;

use App\Models\Order;
use App\Models\Ad;
use App\Models\Icon;
use App\Models\ProductCategory;

use App\Models\Student;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Str;

class homeController extends Controller
{
  //  public function checkout(){
   //     return view("front.cart.checkout_en");
 //   }


 const COUNT_ROWS = 10;



    public function product($id,Request $request){



          // $result = Product::with("images",'attributes')->findOrFail($id);
          // // dd($result);
          //
          // if($result->is_brand != 0){
          //     $brand_id = $result->students->first() != null? $result->students->first()->id : 0;
          //   $list = Product::wherehas("students",function($q) use($brand_id){
          //     $q->where('students.id',$brand_id);
          //   })->inRandomOrder()->limit(10)->get();
          //   // dd($list);
          // }else{
          //   $name_ar=Str::limit($result->name_ar, 8,'');
          //   $name_en=Str::limit($result->name_en, 8,'');
          //
          //   $list = Product::where("name_ar",'like', '%' .$result->name_ar .'%')
          //   ->orWhere("name_en",'like', '%' .$result->name_en .'%')
          //   ->orWhere("name_ar",'like', '%' .$name_ar .'%')
          //   ->orWhere("name_en",'like', '%' .$name_en .'%')
          //   ->inRandomOrder()->limit(11)->get()->where('id','!=',$result->id);
          //   if($list -> count() > 0){
          //     $list = Product::customSelect()
          //         ->latest('id')->where('is_brand',0)
          //         ->take(self::COUNT_ROWS)
          //         ->get();
          //   }
          // }
          $subCategory=null;
          $mainCategory=null;
          if(isset($request->sub)){
            $Category1=Category::select('id','parent_id','name_'.app()->getLocale())->firstWhere('id',$request->sub);
            if ($Category1->parent_id==0) {
              $mainCategory= $Category1;
            }
            else{
              $subCategory=$Category1;
              $mainCategory=Category::select('id','name_'.app()->getLocale())->firstWhere('id',$Category1->parent_id);
            }
          }

        //   dd($subCategory,$mainCategory);
          $product = Product::where('id' , $id)
              ->first();
              if(!$product){
                return  response([
                    'status'      =>  Response_Fail,
                      'data'        => __('api.errors.pr_notfound'),
                ]);
              }elseif ($product->is_clothes) {
                $result = Product::with([
                    'categories' ,
                    'statements',
                    'images',
                    'kurly',
                    'attributesClothes'
                ])->where('id' , $id)
                        ->first();
              }else{
                $result = Product::with([
                    'categories' ,
                    'statements',
                    'images',
                    'kurly'
                ])
                    ->aov($id)->where('id' , $id)
                        ->first();
              }


              if($result->is_brand==0){
                $category_ids=  ProductCategory::where('product_id',$id)->pluck('category_id');
                $list = Product::where('is_brand',0)->whereHas('categories' , function ($q) use ($category_ids){
                    $q->whereIn('categories.id' , $category_ids);
                })
                ->where('id','!=',$id)
                ->inStock()
                ->customSelect()
                ->latest()
                ->simplePaginate(10)->items();

              }else{
              $students_id=  $product->students()->first()->id;
                $list = Product::where('is_brand',1)->whereHas('students' , function ($q) use ($students_id){
                    $q->where('students.id' , $students_id);
                })
                ->where('id','!=',$id)
                ->inStock()
                ->customSelect()
                ->latest()
                ->simplePaginate(10)->items();
              }
              // dd($result);
        return view("front.product_show",compact("result","id","list",'subCategory','mainCategory'));
    }

    public function home(Request $request)
      {



          //   $app="المحن";
        //   $m="سموعليكواااا";
        // self::send_notf('c9FHNN5rQlyaM07Didfkl_:APA91bH_OC2-rosOjc94CN2FpkvWuUO4hnPTV_gV2ARBBCMTSeulb70t9Q27iUIcQtMGMB0cEYFHg99Yh69YcYAxxGf4KQxBX3mVst-I3adSQGtzSw3E-M5Q_G7Wwfc-q47fQwY6FrLE',$m,$app);

        // $offerEndingSoon = Product::customSelect(['end_sale'])
        //     ->orderBy('end_sale' , 'asc')
        //     ->inStock()
        //     ->where('end_sale' , ">=" , Carbon::now()->format('Y-m-d'))
        //     ->where('in_sale' , 1)->where('is_brand',0)
        //     ->take(self::COUNT_ROWS)
        //     ->get();
            $vendors = Category::with('subCategories')
                ->where('parent_id' , 0)
                ->inRandomOrder()->take(10)
                ->get();
        $newProducts = Product::customSelect()
            ->inRandomOrder()->where('is_brand',0)
            ->take(self::COUNT_ROWS)
            ->get();
            $brands = Student::latest()->where('is_active',1)->simplePaginate(self::COUNT_ROWS);


        $recommendedProducts = Product::customSelect(['is_recommended'])
            ->where('is_recommended' , 1)
            ->inStock()->where('is_brand',0)
            ->inRandomOrder()
            ->take(self::COUNT_ROWS)
            ->get();

        $bestDiscount = Product::customSelect()
            ->where('in_sale' , 1)
            ->inStock()->inSale()->where('is_brand',0)
                ->inRandomOrder()
                ->take(self::COUNT_ROWS)
            ->get();


            // تسوق حسب الفئه
            // منتجات حديثة الوصول
            // تسوق حسب المتجر
            // عروض وخصومات
            // منتجات موصي بها

        $informations = Icon::where('type' , 'information')->get(['title', 'link']);

        $sliders = Slider::all();
        // $popup= Ad::where('position' , 11)->inRandomOrder()->first();
        $ads = Ad::where('position','!=',11)->get();
        // dd($ads);

        // "id" => 1
        // "img" => "163750250563464.jpeg"
        // "link" => "http://127.0.0.1:8000/admin/ads/create"
        // "type" => "product"
        // "in_app" => 0
        // "created_at" => "2021-10-22 05:11:53"
        // "updated_at" => "2021-11-21 13:48:25"
        // "position" => 2
      return view("front.index")->with([
      'newProducts'         => $newProducts,
      // 'bestProducts'        => $bestProducts,
      'recommendedProducts' => $recommendedProducts,
      'offers'        => $bestDiscount,
      // 'bestPrice'           => $bestPrice,
      // 'topLikes'            => $topLikes,
      // 'topRating'           => $topRating,
      'informations'        => $informations,
      'sliders'             => $sliders,
      'ads'                 => $ads,
      'vendors'           => $vendors,
    //   'popup'              =>$popup,
      'brands'          => $brands]);

    }

    public function productByType($type)
      {

        switch ($type) {
          case 'topRating':
          $topRating = Product::customSelect(['ratings'])
              ->orderBy('ratings' , 'desc')
              ->inStock()->where('is_brand',0)
              ->paginate(15);
            break;

          case 'bestProducts':
              $data = Product::customSelect(['is_best'])
                  ->where('is_best' , 1)
                  ->inStock()->where('is_brand',0)
                  ->inRandomOrder()
                  ->paginate(15);
              break;
          case 'recommendedProducts':
          $data = Product::customSelect(['is_recommended'])
              ->where('is_recommended' , 1)
              ->inStock()->where('is_brand',0)
              ->inRandomOrder()
              ->paginate(15);
            break;
          case 'offers':
          $data = Product::customSelect()
              ->where('in_sale' , 1)
              ->inStock()->inSale()->where('is_brand',0)
              ->paginate(15);
            break;
          case 'bestPrice':
          $data = Product::customSelect()
              ->orderBy('regular_price' , 'asc')
              ->inStock()->where('is_brand',0)
              ->paginate(15);
            break;
          case 'topLikes':
          $data = Product::customSelect(['likes_count'])
              ->orderBy('likes_count' , 'desc')
              ->inStock()->where('is_brand',0)
              ->paginate(15);
            break;
          default:
          $data = Product::customSelect()
              ->latest('id')->where('is_brand',0)
              ->paginate(15);
            break;
        }


      return view("front.template")->with([
      'populars'         => $data,
      'name'         => __('site.'.$type)]);

    }




    public function vendor(Request $request,$id)
    {
      $records = Category::findOrFail($id);
       $ParentCategory=null;
      // dd(  $records);
    //  $offers = Item::where("over",1)->where("activity",1)->where("category_id",$id)->paginate(15);
      //$populars = Item::where("category_id",$id)->where("activity",1)->paginate(15);
      if($records->parent_id == 0){
      $subCategories_header = Category::where('parent_id',$id)->get();

        $subCategories = $records->subCategories->map->id->all();

        $allCategories = array_merge($subCategories , [$id]); // merge parent categories with sub categories
        //  dd(  $allCategories);SELECT * FROM `products` WHERE id in ( 149, 150, 151, 171, 179, 186, 207, 220, 221, 222, 223, 237, 248, 248, 249, 249, 249, 207)

        $populars = Product::whereHas('categories' , function ($q) use ($allCategories){
            $q->whereIn('categories.id' , $allCategories);
          })->paginate(15);
        // $offers =  Product::whereHas('categories' , function ($q) use ($allCategories){
        //     $q->whereIn('categories.id' , $allCategories);
        // })->where("in_sale",1)->inSale()->paginate(15);

      }else{
        $subCategories_header = Category::where('parent_id',$records->parent_id)->get();
        $ParentCategory=Category::select('id','name_'.app()->getlocale())->where('id',$records->parent_id)->first();

        // $offers = $records->products()->where("in_sale",1)->inSale()->paginate(15);
         $populars = $records->products()->paginate(15);
      }

                                // dd( $subCategories_header);
      return view("front.vendor",compact("records","id","populars",'subCategories_header','ParentCategory'));

    }
    public function brand (Request $request,$id)
    {
      $records = Student::findOrFail($id);
      $ads = Ad::wherein('position',[9,10])->get();
    //  $offers = Item::where("over",1)->where("activity",1)->where("category_id",$id)->paginate(15);
      //$populars = Item::where("category_id",$id)->where("activity",1)->paginate(15);
       $offers = $records->products()->where("in_sale",1)->inSale()->paginate(15);
        $populars = $records->products()->paginate(15);
                                // dd(  $populars);
      return view("front.brands",compact("records","id",'ads',"offers","populars"));

    }

    public function changeCurrency($currency_id){
        $currency=Currency::findOrFail($currency_id);
        session()->put('currency',$currency);
        $currency_def= $currency->name;
        return redirect()->back()->with('currency_def',$currency_def);
    }


}
