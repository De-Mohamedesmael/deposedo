<?php

namespace App\Http\Controllers\Web\Api;

use App\Http\Controllers\Controller;
use App\Models\Info;
use Illuminate\Http\Request;

class InfoController extends Controller
{

    public function index(){

        $infos = Info::where('type' , \request('type'))
            ->orderBy('sort', 'desc')
            ->get(['id' ,'name' , 'description_ar' , 'description_en']);


        return response([
            'status' => $infos->count() > 0 ? Response_Success : Response_Fail,
            'data'  => $infos,
        ]);
    }
}
