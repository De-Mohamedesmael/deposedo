<?php

namespace App\Http\Requests\Admin;

use ArondeParon\RequestSanitizer\Sanitizers\Slug;
use ArondeParon\RequestSanitizer\Sanitizers\StripTags;
use ArondeParon\RequestSanitizer\Sanitizers\TrimDuplicateSpaces;
use ArondeParon\RequestSanitizer\Traits\SanitizesInputs;
use Illuminate\Foundation\Http\FormRequest;

class PackageRequest extends FormRequest
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
    public function rules()
    {
        return [

            'name_ar'   => ['required', 'string', 'max:50'],
            'name_en'   => ['required', 'string', 'max:50'],
            'count_product'   => ['required', 'numeric'],
            'slug'      => ['nullable', 'string', 'max:50'],
            // 'sort'      => ['nullable', 'integer', 'max:11'],
            'img'       => ['nullable', 'image', 'max:10000'],

        ];
    }
}
