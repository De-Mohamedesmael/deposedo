<?php

namespace App\Http\Requests\Admin;

use ArondeParon\RequestSanitizer\Sanitizers\Slug;
use ArondeParon\RequestSanitizer\Sanitizers\StripTags;
use ArondeParon\RequestSanitizer\Sanitizers\TrimDuplicateSpaces;
use ArondeParon\RequestSanitizer\Traits\SanitizesInputs;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Route;

class PackagePeriodRequest extends FormRequest
{

    use SanitizesInputs;

    protected $sanitizers = [
        // 'name_ar' => [
        //
        //     TrimDuplicateSpaces::class,
        // ],

        // 'name_en' => [
        //
        //     TrimDuplicateSpaces::class,
        // ],

        // 'slug' => [
        //     Slug::class,
        // ],

        // 'parent_id' => [
        //
        // ],



    ];
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(){
        return [

            'period'   => ['required', 'numeric'],
            'price'   => ['required',  'numeric'],
            'package_id'      => ['required' , 'exists:packages,id'],

        ];
    }
}
