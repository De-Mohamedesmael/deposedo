<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable , SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */


    protected $fillable = [
        'name',
        'email',
        'phone',
        'img',
        'gender',
        'birth_day',
        'surname',
        'is_admin',
        'country_id',
        'password',
        'fcm_token',
         'activation_code',

    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Rest omitted for brevity

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }


     ////////////////// relationship /////////////////////
    ///                                              ////
   /////////////////////////////////////////////////////

   public function wishlist()
  {
      return $this->belongsToMany(Product::class,'wish_list')->withTimestamps();
  }

  public function country()
  {
        return $this->belongsTo(Country::class , 'country_id' , 'id');
  }

  public function wishlistsHas($itemId){


      return self::wishlist()->where('product_id',$itemId)->exists();


      }

    public function ratings()
    {
        return $this->hasMany(Rating::class);
    }
    public function texts_search()
    {
        return $this->hasMany(UserSearch::class);
    }
    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function shipping_addresses(){

        return $this->hasMany(ShippingAddress::class);
    }

    public function likes(){

        return $this->hasMany(Like::class)->select('id' , 'product_id' , 'user_id');
    }
}
