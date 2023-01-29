<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class NotificationRequest extends FormRequest
{


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

            'title_ar'   => ['required' , 'string'  , 'max:50'],
            'title_en'   => ['required' , 'string'  , 'max:50'],
            'note_ar'   => ['required' , 'string'  , 'max:500'],
            'note_en'   => ['required' , 'string'  , 'max:500'],
            'img'       => ['nullable' , 'image', 'max:10000'],

        ];
    }
}
