<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Carbon;
use function PHPUnit\Framework\isNull;

class Product extends Model
{
    use HasFactory, SoftDeletes;

    protected $product_id;
    protected $fillable = [
        "id", "name_ar", "name_en", "slug", "description_ar", "description_en", "about_brand_ar", "about_brand_en", "brand_name", "seller_name", "discount_percentage",
        "regular_price", "sale_price","alt", "in_sale", 'is_clothes', "sort",
        "is_recommended", "has_options", "is_best", "end_sale", "start_sale",
        "is_brand", "is_clothes", "ratings", "quantity",
        "created_at", "updated_at", "deleted_at", "likes_count", "img", 'video', 'day_order', 'is_order', 'serial_number'
    ];

    protected $appends = ['img_src'];

    protected $casts = [
        'is_recommended' => 'boolean',
        'is_best' => 'boolean',
        'is_clothes' => 'boolean',
        'in_sale' => 'boolean',
        'has_options' => 'boolean',
        'day_order' => 'integer',
        'is_order' => 'integer',
    ];


    ////////////////// relationship /////////////////////
    ///                                              ////
    /////////////////////////////////////////////////////

    public function getNameAttribute()
    {
        return app()->getLocale() == 'ar' ? $this->name_ar : $this->name_en;
    }

    public function images()
    {

        return $this->hasMany(Image::class);
    }

    public function getIfSaleAttribute()
    {
        $now = strToTime(date('d-m-Y'));
        if ($this->in_sale == 1 && date(strToTime($this->start_sale)) <= $now && date(strToTime($this->end_sale)) > $now) {
            return true;
        } elseif ($this->in_sale == 1 && date(strToTime($this->start_sale)) <= $now && date(strToTime($this->end_sale)) == null) {
            return true;
        } else {
            return false;

        }
    }

    public function statements()
    {

        return $this->hasMany(Statement::class);
    }

    public function kurly()
    {

        return $this->hasMany(Kurly::class);
    }

    public function attributes()
    {
        return $this->belongsToMany(Attribute::class, 'product_attribute');
    }

    public function product_sizes()
    {
        return $this->hasMany('App\Models\ProdSize', 'product_id', 'id');
    }

    public function product_colors()
    {
        return $this->hasMany('App\Models\ProdColor', 'product_id', 'id');
    }

    public function attributesClothes()
    {
        // dd($this);
        return $this->hasMany(ProdSize::class)->with('size');
    }

    public function students()
    {

        return $this->belongsToMany(Student::class, 'product_student');
    }

    public function optionsValue()
    {

        return $this->hasMany(OptionValue::class);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'product_category');
    }

    public function subCategories()
    {
        return $this->belongsToMany(Category::class, 'product_category')->where('parent_id', '!=', 0);
    }

    public function ratings()
    {
        return $this->hasMany(Rating::class);
    }

    public function orders()
    {

        return $this->belongsToMany(Order::class);
    }

    public function likes()
    {

        return $this->hasMany(Like::class);
    }



    /////////////////// custom function //////////////////
    ///                                              ////
    ////////////////////////////////////////////////////

    public function getImgSrcAttribute()
    {

        return asset("assets/images/products/");
    }


    public function scopeInSale($q)
    {
        if ($this->end_sale == null) {
            return $q->where('start_sale', '<=', Carbon::now()->format('Y-m-d'));

        }
        return $q->where('end_sale', '>=', Carbon::now()->format('Y-m-d'))->where('start_sale', '<=', Carbon::now()->format('Y-m-d'));
    }


    public function getInSaleColAttribute()
    {

        if (is_null($this->end_sale)) {

            return 'active';
        }

        if ($this->end_sale >= Carbon::now()->format('Y-m-d')) {

            return 'unactive';
        }

        return 'unactive';
    }

    public function getInSaleAttribute($value)
    {

        if (is_null($this->end_sale) && $value === 1) {

            return true;
        }

        if ($this->end_sale >= Carbon::now()->format('Y-m-d') && $value === 1) {

            return true;
        }

        return false;

    }

    public function scopeInStock($q)
    {
        return $q->where('quantity', '>', 0);
    }

    public function scopeCustomSelect($q, $otherColumns = [])
    {

        $columns = ['id', 'name_ar', 'name_en', 'img', 'regular_price', 'sale_price', 'quantity', 'discount_percentage', 'in_sale', 'end_sale', 'is_order', 'day_order', 'created_at'];

        return $q->select(array_merge($columns, $otherColumns));
    }

    public function scopeAOV($q, $product_id)
    {
        $this->product_id = $product_id;

        return $q->with('attributes', function ($q) {

            return $q->select('attributes.id', 'name_ar', 'name_en')// select columns  attributes

            ->with('options', function ($q) {

                return $q->select('options.id', 'name_ar', 'name_en', 'attribute_id')
                    ->whereHas('values', function ($q) {

                        return $q->where('product_id', $this->product_id);

                    })->with('values', function ($q) {

                        $q->select('id', 'quantity', 'sale_price', 'regular_price', 'option_id', 'product_id', 'option_id', 'parent_id');

                    }); // end  RS options_values

            });  // end  RS options

        }); // end  RS Attribute
    }
}
