<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    use HasFactory;
    protected $fillable = [
        'name_en',
        'name_ar',
        'is_free',
        'image',
        'sort',
        'status',
        'count_product',
    ];
    protected $appends=[
        'name',
        'full_path_image'
    ];
    public function scopeActive($query)
    {
        return $query->where('status',  1);
    }
    public function getNameAttribute()
    {

        return app()->getLocale()== 'ar' ? $this->name_ar : $this->name_en;

    }
    public function getFullPathImageAttribute()
    {

        return asset('assets/front/images/'. $this->image) ;

    }
    public function scopeNotfree($q){
        $q-> where('is_free',0);
    }
    public function features()
    {
        return $this->hasMany(PackageFeature::class,'package_id','id');
    }
    public function periods()
    {
        return $this->hasMany(PackagePeriod::class,'package_id','id');
    }
    public function package_users()
    {
        return $this->belongsToMany(User::class,'package_users');
    }
    public function advs()
    {
        return $this->hasMany(UserAdvertisement::class,'package_id','id');
    }
}
