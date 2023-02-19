<?php

namespace App\Http\Controllers\Store\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Student\StudentRequest;
use App\Models\Ad;
use App\Models\Category;
use App\Models\Product;
use App\Models\Student;
use App\Models\User;
use Carbon\Carbon;

use Illuminate\Http\Request;

class StudentController extends Controller
{
    const COUNT_ROWS = 10;

    public function homeStudents(){

        $students = Student::where('is_active' , 1)
            ->inRandomOrder()
            ->take(6)
            ->get();

        $ads = Ad::whereIn('position' , [9, 10])->get();

        return  response([
            'status'      => Response_Success,
            'data'        => [
                'students' => $students,
                'ads' => $ads,
            ],
        ]);

    }

    public function getStudents(){

        $students = Student::where('is_active' , 1)
            ->latest()
            ->simplePaginate(self::COUNT_ROWS);
 return  response([
            'status'      => Response_Success,
            'count_brands'=>$students->count(),
            'data'         => $students->items(),

        ]);
        // return $this->responseSuccess($students);
    }



    public function getProducts(){
         $student = Student::whereId(\request('student_id'))
            ->first();
        $products = Product::latest()
            ->inStock()
            ->where('in_sale' ,'!=', 1)
            ->customSelect(['is_recommended' , 'is_best'])
            ->whereRelation('students' , 'student_id' , '=' , \request('student_id'))
            ->simplePaginate(self::COUNT_ROWS);


        $offers = Product::latest()
            ->inStock()
            ->customSelect(['is_recommended' , 'is_best'])
            ->whereRelation('students' , 'student_id' , '=' , \request('student_id'))
            ->where('end_sale' , ">=" , Carbon::now()->format('Y-m-d'))
            ->where('in_sale' , 1)
            ->simplePaginate(self::COUNT_ROWS);
        return $this->responseSuccess(['brand'=>$student,'offers'=>$offers,'products'=>$products]);

    }


    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ............  Methods Clean Code ............ ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    private function responseSuccess($items){
        $productsCount = 0;
        $productsCount_offer = 0;
        $items_pr=[];
        $items_of=[];
    if($items['products'] != null){
              $productsCount = $items['products']->count();
             $items_pr= $items['products']->items();

    }
    if($items['offers'] != null){
              $productsCount_offer = $items['offers']->count();
                           $items_of= $items['offers']->items();


    }

        return  response([
            'status'      => $productsCount > 0 || $productsCount_offer > 0 ? Response_Success : Response_Fail,
            'countItems'  => $productsCount ,
            'countItems_offer'  => $productsCount_offer ,
            'data'        => [
              'brand'=>$items['brand'],
              'offers'=> $items_of,
              'products'=>$items_pr,
            ],
        ]);
    }

}
