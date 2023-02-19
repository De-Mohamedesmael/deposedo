<?php

namespace App\Http\Requests\Admin;

use ArondeParon\RequestSanitizer\Sanitizers\RemoveNonNumeric;
use ArondeParon\RequestSanitizer\Sanitizers\Slug;
use ArondeParon\RequestSanitizer\Sanitizers\StripTags;
use ArondeParon\RequestSanitizer\Sanitizers\TrimDuplicateSpaces;
use Illuminate\Foundation\Http\FormRequest;

class ShippingAddressRequest extends FormRequest
{


    protected $sanitizers = [

        'name' => [

        ],

        'email' => [

        ],

        'phone' => [

        ],

        'phone2' => [

        ],

        'address' => [

            TrimDuplicateSpaces::class,
        ],

    ];

    public function authorize()
    {
        return true;
    }



    public function rules()
    {
        return [

            'area_id'       => ['required' , 'integer' , 'exists:areas,id'],
            'title'         => ['nullable' , 'string' , 'max:50'],
            'name'          => ['required' , 'string' , 'max:100'],
            'address_d'         => ['nullable' ,  'max:255'],
            'phone'         => ['required' , 'string' , 'max:20'],
            // 'phone2'        => ['nullable' , 'string' , 'max:20'],
            'address'       => ['required' , 'string' , 'max:255'],
            'lat_and_long' => ['required' , 'string' , 'max:255'],
            'note'        => ['nullable' ],
        ];
    }


}
