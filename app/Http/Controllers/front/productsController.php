<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\Item;
use App\Models\Product;

use App\Models\SubCategory;
use App\Models\SubSubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class productsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */

    public function catProduct($cat_id)
    {
        $cats = SubCategory::all();

        $records = SubCategory::find($cat_id);
        //$populars = Item::where('subCategory_id', $cat_id)->paginate();
        $sub_sub_cat = SubSubCategory::where('subCategory_id', $cat_id)->get();
        $populars = $records->products()->paginate(15);
        return view('front.cat', compact('records', 'populars', 'sub_sub_cat', 'cats'));
    }

    public function subCatProduct($sub_cat_id)
    {
        $cats = SubCategory::all();
        $records_id = SubSubCategory::find($sub_cat_id)->subCategory_id;
      $records = SubCategory::find($records_id);

        $offers = $records->products()->paginate(15);
//        $sub_sub_cat = SubSubCategory::where('subCategory_id' , $cat_id)->get();
        return view('front.subcat', compact('records', 'offers', 'cats'));
    }


    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function searching(Request $request)
    {
      // dd(app()->getlocale());
        // dd($request->id);
        //        TODO :: MAKE SEARCH CAT = 1 OR SUB = 2  & NAME & ID (FOR SUB OR CAT)

        $id = intVal($request->id);
        $cat_or_sub = intVal($request->cat_or_sub);
        $search = $request->search;

        if($cat_or_sub){
            if ($cat_or_sub == 1) {

                $items = Product::where(function ($q) use ($request) {
                    if ($request->search) {
                        $q->where('name_ar', 'LIKE', '%' . $request->search . '%')->orWhere('name_en', 'LIKE', '%' . $request->search . '%');
                    }

                    if ($request->id) {
                      //  $q->where('category_id', $request->id);
                    }

                })->orderBy("id", "desc")->paginate();

            }

            if ($cat_or_sub == 2) {
                $items = Product::where(function ($q) use ($request) {
                    if ($request->search) {
                        $q->where('name_ar', 'LIKE', '%' . $request->search . '%')->orWhere('name_en', 'LIKE', '%' . $request->search . '%');
                    }
                    if ($request->id) {
                    //    $q->where('category_id', $request->id);
                    }
                })->orderBy("id", "desc")->paginate();

            }
        } else {
            $items = Product::where(function ($q) use ($request) {
                if ($request->search) {
                    $q->where('name_ar', 'LIKE', '%' . $request->search . '%')->orWhere('name_en', 'LIKE', '%' . $request->search . '%');
                }
                if ($request->id) {
                   // $q->where('category_id', $request->id);
                }
            })->orderBy("id", "desc")->paginate();
        }

        $value = '<div class="container border-main" >
<div class="row row5"style="
    padding: 10px;
" >';

        $value .= '<div class="row w-100" style="">';
   if($items->count() > 0){
       foreach ($items as $one) {

           $value.= ' <div class="card col-6 col-md-4 col-lg-3 pb-2" style="">'
               . '  <h6 class="bg-main abs">ref:' . $one->id . '</h6>'
               . '<a href="' . route("product", $one->id) . '">'
               . ' <img height="200" src="' . asset('assets/images/products/min/'.$one->img) . '" class="card-img-top  " alt="..."> </a>'
               . ' <div class="card-body">'
               . '     <a href="' . route("product", $one->id) . '" class="card-text ">' . Str::limit($one->name, 18,'...') . '</a> '
               . '<p class="card-title" href="">';
           $value.=$one->if_sale?'<b>'.get_price_helper($one->sale_price).'</b><span class="regular_price">'.get_price_helper($one->regular_price).'</span>':'<b>'.get_price_helper($one->regular_price).'</b></p>';

           $value.= '</div>'
               . '<div class="row mr-0">'
               . '<a href="' . route('add.cart', [$one->id, 1]) . '" class="btn btn-dark border col-9">add to
                                cart</a>'
               . '<div class="btn btn-light border col-3 heart text-center">'
               . '<i   class="fas fa-heart heart-none"></i></div>
'
               . '</div>' . '</div>'
           ;


       }

   } else {
       $value.= '<p style="text-align: center ;width: 100%;margin: 30px" >
'.__('site.notproductsearch').'
</p>';
   }

        $value .=  '</div>'
            . '</div>'
                . '</div>';

        return response()->json($value);

    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
