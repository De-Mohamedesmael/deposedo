<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $appends = ['imaget'];

    public function products()
    {

        return $this->belongsToMany(Product::class, 'product_order')
            ->select(['products.id', 'name_ar', 'name_en', 'slug', 'description_ar', 'description_en', 'is_recommended', 'is_best', 'in_sale', 'end_sale', 'ratings', 'likes_count', 'img', 'is_clothes'])
            ->withPivot(['product_name', 'quantity', 'sale_price', 'regular_price', 'attributes', 'end_price']);
    }

    public function getImagetAttribute()
    {
        $product_images = '<div class="row">';
        foreach ($this->products as $product) {
            $product_images .= "<div class='col-md-6'> <img class='img-item-one' src='" . asset('assets/images/products/min/' . $product->img) . "' ></div>";
        }
        $product_images .= '</div>';
        return $product_images;
    }

    public function user()
    {

        return $this->belongsTo(User::class);
    }

    public function shipping_address()
    {

        return $this->belongsTo(ShippingAddress::class, 'shipping_address_id', 'id')->with('area');
    }

    public function updated_order()
    {
        return $this->belongsTo(Admin::class, 'last_updated_by', 'id');
    }

    public function delivery_by()
    {
        return $this->belongsTo(Admin::class, 'deliveried_by', 'id');
    }
}
