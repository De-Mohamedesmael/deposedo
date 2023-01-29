<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductOrder extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $table = 'product_order';

    public function product(){

        return $this->belongsTo(Product::class);
    }

}
