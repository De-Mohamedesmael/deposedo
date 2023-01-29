<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ProductRequest;
use App\Imports\ProductsImport;
use App\Models\Attribute;
use App\Models\Category;
use App\Models\Option;
use App\Models\OptionValue;
use App\Models\ProdColor;
use App\Models\ProdSize;
use App\Models\Product;
use App\Models\Setting;
use App\MyDataTable\MDT_Method_Action;
use App\MyDataTable\MDT_Query;
use App\MyDataTable\MDT_UploadImag;
use DB;
use Maatwebsite\Excel\Facades\Excel;

class ProductController extends Controller
{

    use MDT_Query, MDT_Method_Action, MDT_UploadImag;

    protected $lang;
    protected $slug;
    protected $productUpdate_id;

    public function __construct()
    {
        $this->lang = app()->getLocale();

        $this->middleware('haveRole:product.index')->only('index');
        $this->middleware('haveRole:product.create')->only(['create', 'store']);
        $this->middleware('haveRole:product.update')->only('update');
        $this->middleware('haveRole:product.destroy')->only('destroy');
        $this->middleware('haveRole:product.restore')->only('restore');
        $this->middleware('haveRole:product.finalDelete')->only('finalDelete');
    }


    public function index()
    {
        $is_trash = \request()->segment(2) === 'trash';

        // return Product::first()->in_sale_col;
        return $this->MDT_Query_method( // Start Query
            Product::class,
            'admin/pages/products/index',
            $is_trash, // Soft Delete
            [ // Other Options
                'with' => ['is_trash' => $is_trash, 'lang' => $this->lang],
                'select' => ['id', 'img', 'serial_number', "name_ar", 'regular_price', 'sale_price', 'in_sale', 'created_at', 'quantity'],
            ]

        ); // end query

    }


    public function create()
    {

        $sections = Category::with("subCategories:id,parent_id,name_$this->lang")
            ->parentCategories()
            ->get(['id', "name_$this->lang"]);

        $attributes = Attribute::where('is_required', 0)->with('options')->get(['id', 'name_ar', 'name_en']);
        $colors = Option::where('attribute_id', 7)->get(['id', 'name_ar', 'name_en']);
        $sizes = Option::where('attribute_id', 6)->get(['id', 'name_ar', 'name_en']);

        $options = Option::all();
        $shipping_not_order = Setting::where('name', 'shipping_not_order')->first();
        $shipping_order = Setting::where('name', 'shipping_order_dev')->first();
        return view('admin.pages.products.create')->with([
            'sections' => $sections,
            'attributes' => $attributes,
            'colors' => $colors,
            'sizes' => $sizes,
            'options' => $options,
            'lang' => $this->lang,
            'day_not_order' => $shipping_not_order != null ? $shipping_not_order->value : 0,
            'day_order' => $shipping_order != null ? $shipping_order->value : 5
        ]);
    }

    public function import()
    {
        Excel::import(new ProductsImport, request()->file('file'));

        return back()->with('success', __('form.response.create product'));
    }

    public function store(ProductRequest $request)
    {

        DB::beginTransaction();
        try {
            if ($request->has('size')) {
                if (count($request->size) > 0) {
                    $total_quantity = 0;
                    foreach ($request->size as $size) {
                        if ($size) {
                            if (!isset($request[$size . '-color'])) {
                                return back()->withInput($request->input())->with('error', __('form.label.size qut'));
                            }
                            for ($i = 0; $i <= count($request[$size . '-color']); $i++) {
                                if (!empty($request[$size . '-color'][$i])) {
                                    $total_quantity += $request[$size . '-' . $request[$size . '-color'][$i] . '-quantity'];
                                }
                            }
                        }
                    }
                    // dd($total_quantity);
                    if ($total_quantity != $request['quantity']) {
                        // dd($total_quantity,(int)$request['quantity']);
                        return back()->withInput($request->input())->with('error', __('form.label.color qut'));
                    }
                }
            }
            // dd($request->all());
            $total_qut = 0;
            if (is_array($request->get('attributes'))) {
                foreach ($request['attributes'] as $attribute) {
                    foreach ($attribute['option'] as $option) {
                        $total_qut += $option['quantity'];
                    }
                    if ($total_qut != $request['quantity']) {
                        return back()->withInput($request->input())->with('error', __('form.label.att qut'));
                    }
                    $total_qut = 0;
                }
            }

            // start save product
            $product = Product::create($this->columnsDB($request));
            //end save product

            //start save images gallery
            if (is_array($request->images)) {

                $images = $this->MDT_saveMultiImage($request->images, $this->slug, ['product_id', $product->id]);

                $product->images()->insert($images);
            }
            //end save images gallery

            //start save statements
            if (is_array($request->get('statements'))) {

                $product->statements()->insert(
                    $this->statementsProcessing($request->get('statements'), $product->id)
                );
            }
            //end save statements



            //start save kurly
            if (is_array($request->get('kurly'))) {

                $product->kurly()->insert(
                    $this->kurlyProcessing($request->get('kurly'), $product->id)
                );
            }
            //end save kurly

            //start save attributes

            if (is_array($request->get('attributes'))) {


                $data = $this->optionValueProcessing($request->get('attributes'), $product->id);

                $product->attributes()->attach($data['attributes']);

                OptionValue::insert($data['options']);
            }

            //end save attributes


            //save the sizes and colors in database
            if ($request->has('size')) {
                if (count($request->size) > 0) {

                    foreach ($request->size as $size) {

                        if ($size) {

                            ProdSize::create([
                                "product_id" => $product->id,
                                "size_id" => $size,
                            ]);

                            for ($i = 0; $i <= count($request[$size . '-color']); $i++) {
                                if (!empty($request[$size . '-color'][$i])) {
                                    ProdColor::create([
                                        "product_id" => $product->id,
                                        "size_id" => $size,
                                        'color_id' => $request[$size . '-color'][$i],
                                        'quantity' => $request[$size . '-' . $request[$size . '-color'][$i] . '-quantity'] ?: 0,
                                    ]);
                                }
                            }
                        }
                    }
                }
            }



            //start save attributes

            if (is_array($request->get('categories'))) {

                $product->categories()->attach($request->categories);
            }


            //end save attributes
            if ($request->send_notifi_pro) {
                self::save_notf(null, true, 'Product', $product->id, 1, $product);
            }

            DB::commit();
            return back()->with('success', __('form.response.create product'));


        } catch (\Exception $e) {

            DB::rollback();
            // return $e;
            return back()->with('error', 'something went wrong');
        }
    }


    public function show($id)
    {
        //
    }


    public function edit($id)
    {
        $this->productUpdate_id = $id;


        $product = Product::with(['categories', 'statements'])
            ->aov($id)
            ->findOrFail($id);

        $sections = Category::with("subCategories:id,parent_id,name_$this->lang")
            ->parentCategories()
            ->get(['id', "name_$this->lang"]);

        $attributes = Attribute::where('is_required', 0)->with('options:id,name_ar,name_en,attribute_id')->get(['id', 'name_ar', 'name_en']);

        $options = $attributes->map->options->collapse();

        //sizes colors
        $colors = Option::where('attribute_id', 7)->get(['id', 'name_ar', 'name_en']);
        $sizes = Option::where('attribute_id', 6)->get(['id', 'name_ar', 'name_en']);

        $size_products = ProdSize::where('product_id', $id)->pluck('size_id')->all();
        // dd($size_products);
        $color_products_array = array();
        foreach ($size_products as $size_product) {

            $color_products = ProdColor::where('product_id', $id)->where('size_id', $size_product)
                ->get();
            array_push($color_products_array, $color_products);
        }

        if (empty($color_products)) {

            $color_products = 0;
        }

        $shipping_not_order = Setting::where('name', 'shipping_not_order')->first();
        $shipping_order = Setting::where('name', 'shipping_order_dev')->first();
        $count_color_products = ProdColor::where('product_id', $id)->count();
        //sizes colors
        return view('admin.pages.products.update')->with([

            'product' => $product,
            'sections' => $sections,
            'attributes' => $attributes,
            'options' => $options,
            'colors' => $colors,
            'sizes' => $sizes,
            'color_products' => $color_products,
            'color_products_array' => $color_products_array,
            'size_products' => $size_products,
            'count_color_products' => $count_color_products,
            'lang' => $this->lang,
            'day_not_order' => $shipping_not_order != null ? $shipping_not_order->value : 0,
            'day_order' => $shipping_order != null ? $shipping_order->value : 5
        ]);
    }


    public function update(ProductRequest $request, $id)
    {
        $total_qut = 0;
        if (is_array($request->get('attributes'))) {
            foreach ($request['attributes'] as $attribute) {
                foreach ($attribute['option'] as $option) {
                    $total_qut += $option['quantity'];
                }
                if ($total_qut != $request['quantity']) {
                    return back()->with('error', __('form.label.att qut'));
                }
                $total_qut = 0;
            }
        }
        if ($request->has('size')) {
            if (count($request->size) > 0) {
                $total_quantity = 0;
                foreach ($request->size as $size) {
                    if ($size) {
                        if (!isset($request[$size . '-color'])) {
                            return back()->with('error', __('form.label.size qut'));
                        }
                        for ($i = 0; $i <= count($request[$size . '-color']); $i++) {
                            if (!empty($request[$size . '-color'][$i])) {
                                $total_quantity += $request[$size . '-' . $request[$size . '-' . 'color'][$i] . '-quantity'];
                                // dd($total_quantity);
                            }
                        }
                    }
                }
                // dd($total_quantity);
                if ($total_quantity != $request['quantity']) {
                    return back()->with('error', __('form.label.color qut'));
                }
            }
        }
        $product = Product::findOrFail($id); // check and get product

        // start update product
        $product->update($this->columnsDB($request, $product->img));
        //end update product

        //size colors

        if ($request->has('size')) {
            ProdSize::where('product_id', $id)->delete();
            ProdColor::where('product_id', $id)->delete();
            if (count($request->size) > 0) {

                foreach ($request->size as $size) {

                    if ($size) {

                        ProdSize::create([
                            "product_id" => $id,
                            "size_id" => $size,
                        ]);

                        for ($i = 0; $i <= count($request[$size . '-color']); $i++) {
                            if (!empty($request[$size . '-color'][$i])) {
                                ProdColor::create([
                                    "product_id" => $id,
                                    "size_id" => $size,
                                    'color_id' => $request[$size . '-color'][$i],
                                    'quantity' => $request[$size . '-' . $request[$size . '-' . 'color'][$i] . '-quantity'] ?: 0,
                                ]);
                            }
                        }
                    }
                }
            }
        }
        //size colors
        //start save images gallery

        $oldImages = is_array($request->oldImages) ? $request->oldImages : [];

        $oldImages = $product->images()->whereNotIn('id', $oldImages);
        $oldImages->delete();

        if (is_array($request->images)) {

            $this->MDT_deleteMultiImage($oldImages);

            $images = $this->MDT_saveMultiImage($request->images, $this->slug, ['product_id', $product->id]);

            $product->images()->insert($images);
        }

        //end save images gallery

        //start save statements
        $product->statements()->delete();

        if (is_array($request->get('statements'))) {

            $product->statements()->insert(
                $this->statementsProcessing($request->get('statements'), $product->id)
            );
        }

        //end save statements


        //start save kurly
        $product->kurly()->delete();

        if (is_array($request->get('kurly'))) {

            $product->kurly()->insert(
                $this->kurlyProcessing($request->get('kurly'), $product->id)
            );
        }

        //start save attributes

        if (is_array($request->get('attributes'))) {


            $data = $this->optionValueProcessing($request->get('attributes'), $product->id);

            $product->attributes()->sync($data['attributes']);

            $product->optionsValue()->delete();

            OptionValue::insert($data['options']);
        } else {

            $product->attributes()->detach();
        }

        //end save attributes


        //start save categories

        if (is_array($request->get('categories'))) {

            $product->categories()->sync($request->categories);
        }
        //end save categories

        return back()->with('success', __('form.response.update product'));
    }

    public function destroy($id)
    {

        return $this->MDT_delete(Product::class, $id);
    }

    public function restore($id)
    {

        return $this->MDT_restore(Product::class, $id);
    }

    public function finalDelete($id)
    {
        $size = ProdSize::where("product_id", $id)->get();
        $height = ProdColor::where("product_id", $id)->get();
        $product_attribute = DB::table('product_attribute')->where("product_id", $id);
        $product_orders = DB::table('product_order')->where("product_id", $id);

        if ($size) {
            foreach ($size as $one) {
                $one->delete();
            }
        }
        if ($height) {
            foreach ($height as $one) {
                $one->delete();
            }
        }


        if ($product_attribute->get()) {
            $product_attribute->delete();
        }

        if ($product_orders->get()) {
            $ids_order = $product_orders->pluck('order_id')->toarray();
            DB::table('product_order')->wherein("order_id", $ids_order)->delete();
            DB::table('orders')->wherein("id", $ids_order)->delete();

        }

        return $this->MDT_finalDelete(Product::class, $id);
    }





    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ..........  Methods Clean Code .............. ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    public function columnsDB($request, $oldImag = null)
    {

        $this->slug = strlen($request->slug) > 0 ? \Str::slug($request->slug) : \Str::slug($request->name_en);


        $img = $request->file('img') ? $this->MDT_saveImage($request->img, $this->slug) : $oldImag;

        $regular_price = (float)$request->regular_price;
        $sale_price = (float)$request->sale_price;
        $difference = $regular_price - $sale_price;

        return [

            'img' => $img,
            'name_ar' => $request->name_ar,
            'name_en' => $request->name_en,

            'seller_name' => $request->seller_name,
            'brand_name' => $request->brand_name,
            'day_order' => $request->day_order,
            'is_order' => $request->has('is_order') ? 1 : 0,


            'description_ar' => $request->description_ar,
            'description_en' => $request->description_en,
            'about_brand_ar' => $request->about_brand_ar,
            'about_brand_en' => $request->about_brand_en,
            'serial_number' => $request->serial_number,
            'regular_price' => $regular_price,
            'sale_price' => $sale_price,
            'discount_percentage' => $sale_price <= 0 ? 0 : round(($difference / $regular_price) * 100, 2),
            'in_sale' => $request->has('in_sale') ? 1 : 0,
            'is_best' => $request->has('is_best') ? 1 : 0,
            'is_recommended' => $request->has('is_recommended') ? 1 : 0,
            'is_clothes' => $request->has('is_clothes') ? 1 : 0,
            'has_options' => $request->has('has_options') ? 1 : 0,
            'start_sale' => $request->start_sale,
            'end_sale' => $request->end_sale ?: null,
            'quantity' => $request->quantity,
            'alt' => $request->alt,
            'slug' => $this->slug,
            'is_brand' => 0
        ];
    }


    private function optionValueProcessing($attributes, $product_id)
    {

        $newOptions = [];
        $newAttributes = [];

        foreach ($attributes as $attribute) {

            $options = $attribute['option'];

            foreach ($options as $option) {

                $newOptions[] = [
                    "regular_price" => array_key_exists('regular_price', $option) ? $option['regular_price'] : null,
                    "sale_price" => array_key_exists('sale_price', $option) ? $option['sale_price'] : null,
                    "quantity" => array_key_exists('quantity', $option) ? $option['quantity'] : null,
                    "parent_id" => 0,
                    "option_id" => $option['id'],
                    "product_id" => $product_id,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }
            $newAttributes[] = $attribute['id'];
        }

        return ['options' => $newOptions, 'attributes' => $newAttributes];
    }

    private function statementsProcessing($statements, $product_id)
    {

        foreach ($statements as $key => $statement) {

            $statements[$key]['product_id'] = $product_id;
        }

        return $statements;
    }

    private function kurlyProcessing($kurly, $product_id)
    {

        foreach ($kurly as $key => $statement) {

            $kurly[$key]['product_id'] = $product_id;
        }

        return $kurly;
    }


    private function optionsProcessing($options, $attribute_id, $product_id)
    {

        foreach ($options as $key => $option) {

            $options[$key]['attribute_id'] = $attribute_id;
            $options[$key]['product_id'] = $product_id;
        }

        return [$options];
    }
}
