<?php

namespace App\Http\Controllers\Web\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class TapProductController extends Controller
{
    const COUNT_ROWS = 10;


    public function newProducts(){

        $products = Product::customSelect()
            ->inStock();
            $products=$this->ProductSort($products);
        return $this->responseSuccess($products);
    }


    public function bestProducts(){

        $products = Product::customSelect(['is_best'])
            ->inStock()
            ->where('is_best' , 1);
            $products=$this->ProductSort($products);

        return $this->responseSuccess($products);
    }


    public function offerProducts(){

        $products = Product::customSelect()
            ->inStock()
            ->where('in_sale' , 1);
            $products=$this->ProductSort($products);

        return $this->responseSuccess($products);
    }


    public function recommendedProducts(){

        $products = Product::customSelect(['is_recommended'])
            ->inStock()
            ->where('is_recommended' , 1);
            $products=$this->ProductSort($products);

        return $this->responseSuccess($products);

    }

    public function topLikesProducts(){

        $products = Product::customSelect(['likes_count'])
            ->inStock()
            ->orderBy('likes_count', 'desc');
            $products=$this->ProductSort($products);

        return $this->responseSuccess($products);

    }

    public function topRatingProducts(){

        $products = Product::customSelect(['ratings'])
            ->inStock()
            ->orderBy('ratings', 'desc');
        $products=$this->ProductSort($products);
        return $this->responseSuccess($products);

    }

    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ............  Methods Clean Code ............ ////
    ////                                               ////
    ///////////////////////////////////////////////////////


      private function ProductSort($products){
          $sort=request()->sort ? :'random';//highestPrice,lowestPrice,bestSeller
          switch ($sort) {
            case 'highestPrice':
            $products=$products
                  ->where('is_brand',0)->orderBy('regular_price','DESC')->simplePaginate(self::COUNT_ROWS);

              break;
            case 'lowestPrice':
                  $products=$products
                        ->where('is_brand',0)->orderBy('regular_price','asc')->simplePaginate(self::COUNT_ROWS);

              break;
            case 'bestSeller':
                $products=$products
                            ->where('is_brand',0)->orderBy('likes_count')->simplePaginate(self::COUNT_ROWS);

              break;
            default:
            $products=$products    ->where('is_brand',0)
              ->simplePaginate(self::COUNT_ROWS);
              break;
          }
          return $products;
        }

    private function responseSuccess($products){

        $productsCount = $products->count();

        return  response([
            'status'      => $productsCount > 0 ? Response_Success : Response_Fail,
            'countItems'  => $productsCount ,
            'data'        => $products->items() ,
        ]);
    }

}
