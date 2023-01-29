<?php

namespace App\Http\Requests\Student;

use ArondeParon\RequestSanitizer\Sanitizers\RemoveNonNumeric;
use ArondeParon\RequestSanitizer\Sanitizers\Slug;
use ArondeParon\RequestSanitizer\Sanitizers\StripTags;
use ArondeParon\RequestSanitizer\Sanitizers\TrimDuplicateSpaces;
use ArondeParon\RequestSanitizer\Traits\SanitizesInputs;
use Illuminate\Foundation\Http\FormRequest;

class StudentRequest extends FormRequest
{

    use SanitizesInputs;

    protected $sanitizers = [
        'name' => [
            StripTags::class,
            TrimDuplicateSpaces::class,
        ],

        'email' => [
            StripTags::class,
            TrimDuplicateSpaces::class,
        ],

        'phone' => [
            StripTags::class,
            RemoveNonNumeric::class,
        ],

        'date' => [
            StripTags::class,
        ],

        'university' => [
            StripTags::class,
        ],

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
        $pagesUpdate =  request()->route()->methods[0] === 'POST';

        return [
            'name'         => ['required' , 'string'  , 'max:50'],
            'email'        => ['required' , 'string'  , 'max:100', "unique:students,email,$this->id"],
            'phone'        => ['required' , 'string'  , 'max:20'],

            'facebook'     => ['nullable' , 'string'  , 'max:255'],
            'instagram'    => ['nullable' , 'string'  , 'max:255'],
            'linkedin'     => ['nullable' , 'string'  , 'max:255'],
            'twitter'      => ['nullable' , 'string'  , 'max:255'],
            'img'          => ['nullable', 'file'  , 'mimes:jpeg,jpg,png,svg', 'max:20000'],
            'cover'        => ['nullable', 'image'  , 'mimes:jpeg,jpg,png', 'max:20000'],
            'password'     => [$pagesUpdate ? 'required' : 'nullable' , 'string'  , 'max:50'],

        ];
    }

}
