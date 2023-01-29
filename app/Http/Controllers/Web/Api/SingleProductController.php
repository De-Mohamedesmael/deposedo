<?php

namespace App\Http\Controllers\Web\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\RatingRequest;
use App\Models\Category;
use App\Models\Option;
use App\Models\OptionValue;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\Rating;
use App\Models\ProdSize;
use App\Models\ProdColor;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use DB;
class SingleProductController extends Controller
{

    public function getProduct($product_id){

        $product = Product::where('id' , $product_id)
            ->first();
            if(!$product){
              return  response([
                  'status'      =>  Response_Fail,
                    'data'        => __('api.errors.pr_notfound'),
              ]);
            }elseif ($product->is_clothes) {
              $data['product'] = Product::with([
                  'categories' ,
                  'statements',
                  'images',
                  'kurly',
                  'attributesClothes'
              ])->where('id' , $product_id)
                      ->first();
            }else{
              $data['product'] = Product::with([
                  'categories' ,
                  'statements',
                  'images',
                  'kurly'
              ])
                  ->aov($product_id)->where('id' , $product_id)
                      ->first();
            }


            if($data['product']->is_brand==0){
              $category_ids=  ProductCategory::where('product_id',$product_id)->pluck('category_id');
              $data['r_products'] = Product::where('is_brand',0)->whereHas('categories' , function ($q) use ($category_ids){
                  $q->whereIn('categories.id' , $category_ids);
              })
              ->where('id','!=',$product_id)
              ->inStock()
              ->customSelect()
              ->latest()
              ->simplePaginate(10)->items();

            }else{
            $students_id=  $data['product']->students()->first()->id;
              $data['r_products'] = Product::where('is_brand',1)->whereHas('students' , function ($q) use ($students_id){
                  $q->where('students.id' , $students_id);
              })
              ->where('id','!=',$product_id)
              ->inStock()
              ->customSelect()
              ->latest()
              ->simplePaginate(10)->items();
            }


        return  response([
            'status'      => $data['product'] ? Response_Success : Response_Fail,
            'data'        => $data,
        ]);

    }
    public function getColorForSizeProduct(Request $request){
          $validator = \Validator::make($request->all(), [
              'product_id' => 'required|exists:products,id',
              'size_id' => 'required|integer|exists:options,id',
          ]);
          if ($validator->fails()) {
              return response()->json($validator->errors(), 422);
          }

          $product = Product::whereId($request->product_id)->first();
          if(!$product){
            return  response([
                'status'      => Response_Fail,
                'data'        => __('api.errors.pr_notfound'),
            ]);
          }

        $ids =  ProdColor::where('product_id' ,$product->id)
                            ->where('size_id',$request->size_id)->where('quantity','>',0)->pluck('color_id');

        $data=  Option::whereIn('id',$ids)->get();
                        // dd($ids);
        return  response([
            'status'      => $data->count() >= 1 ? Response_Success : Response_Fail,
            'data'        => $data,
        ]);
    }
    public function checkProduct(Request $request){
      $validator = \Validator::make($request->all(), [
          'product_id' => 'required',
          'quantity' => 'required|integer',
          'attributes' => 'nullable|array',
          'attributes.*' => 'required',
      ]);
      if ($validator->fails()) {
          return response()->json($validator->errors(), 422);
      }

      $product = Product::whereId($request->product_id)->first();
      if(!$product){
        return  response([
            'status'      => Response_Fail,
            'message'        => __('api.errors.pr_notfound'),
            'data'        => 0,
        ]);
      }

      if(!$request->has('attributes') || $request->attributes == null ){
        if($request->quantity > $product-> quantity ){
          return  response([
              'status'      => Response_Fail,
              'message'        => __('api.errors.quantity'),
              'data'        => $product-> quantity,
          ]);
        }else{
          return  response([
              'status'      => Response_Success,
              'message'        => __('api.success.quantity'),
              'data'        => $product-> quantity,
          ]);

        }

      }else{
        if($product->is_clothes){
            $attr=$request->get('attributes');
            $ProdColor=ProdColor::where('product_id',$product->id)->where('color_id',$attr[7])->where('size_id',$attr[6])->first();

            if($ProdColor){
              if( $request->quantity <= $ProdColor-> quantity ){
                return  response([
                    'status'      => Response_Success,
                    'message'        => __('api.success.quantity'),
                    'data'        => $ProdColor-> quantity,
                ]);
              }
              return  response([
                  'status'      => Response_Fail,
                  'message'        => __('api.errors.quantity'),
                  'data'        => $ProdColor-> quantity,
              ]);
            }
            return  response([
                'status'      => Response_Fail,
                'message'        => __('api.errors.quantity'),
                'data'        => 0,
            ]);

        }
        foreach ($request->get('attributes') as  $id => $option) {
            $opvalue=OptionValue::where('option_id',$option)->where('product_id',$request->product_id)->first();
            if(!$opvalue){
              return  response([
                  'status'      => Response_Fail,
                  'message'        => __('api.errors.quantity'),
                  'data'        => 0,
              ]);
            }elseif($request->quantity > $opvalue-> quantity ){
              return  response([
                  'status'      => Response_Fail,
                  'message'        => __('api.errors.quantity'),
                  'data'        => $opvalue-> quantity,
              ]);
            }

            return  response([
                'status'      => Response_Success,
                'message'        => __('api.success.quantity'),
                'data'        => $opvalue-> quantity,
            ]);

        }
      }

    }

    public function getRatings(Request $request){

        $ratings = Rating::where('product_id' , $request->product_id)
            ->where('status' , 1)
            ->latest()
            ->simplePaginate(10);

        $ratingsCount = $ratings->count();

        return  response([
            'status'      => $ratingsCount > 0 ? Response_Success : Response_Fail,
            'countItems'  => $ratingsCount ,
            'data'        =>  $ratings->items(),
        ]);
    }
}
