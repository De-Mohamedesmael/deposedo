<?php

namespace App\Models;

use App\Notifications\Student\Auth\ResetPassword;
use App\Notifications\Student\Auth\VerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Cache;
use Laravel\Sanctum\HasApiTokens;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Student extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable , SoftDeletes;

    protected $appends = ['img_src' , 'end_points'];
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'phone', 'university', 'img', 'limit_products' , 'date', 'major', 'cover', 'university_id', 'facebook', 'instagram', 'linkedin', 'twitter',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Send the password reset notification.
     *
     * @param  string  $token
     * @return void
     */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPassword($token));
    }

    /**
     * Send the email verification notification.
     *
     * @return void
     */
    public function sendEmailVerificationNotification()
    {
        $this->notify(new VerifyEmail);
    }

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

    public function products(){

        return $this->belongsToMany(Product::class , 'product_student');
    }


    /////////////// custom function /////////////////////
    ///                                              ////
    ////////////////////////////////////////////////////

    public function getImgSrcAttribute(){

        return asset("assets/images/student/");
    }

    public function getEndPointsAttribute(){

        if (Cache::has('points_end')){

            $points_end = Cache::get('points_end');

        } else {

            $points_end =  Setting::where('name' , 'points_end')->first()->value;

            Cache::put('points_end', $points_end);
        }


        return floor($this->points/$points_end);
    }

}
