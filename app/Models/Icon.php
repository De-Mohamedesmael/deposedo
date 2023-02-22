<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Icon extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $appends = ['src','full_src'];

    public function getSrcAttribute(){

        return asset('assets/images/icons');
    }
    public function getFullSrcAttribute(){

        return asset('assets/images/icons/'.$this->img);
    }
}
