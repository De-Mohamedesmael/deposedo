<?php

namespace App\Http\Requests\Student;

use ArondeParon\RequestSanitizer\Sanitizers\RemoveNonNumeric;
use ArondeParon\RequestSanitizer\Sanitizers\Slug;
use ArondeParon\RequestSanitizer\Sanitizers\StripTags;
use ArondeParon\RequestSanitizer\Sanitizers\Trim;
use ArondeParon\RequestSanitizer\Sanitizers\TrimDuplicateSpaces;
use ArondeParon\RequestSanitizer\Traits\SanitizesInputs;
use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
{

    use SanitizesInputs;

    protected $sanitizers = [
        'name_ar' => [

            TrimDuplicateSpaces::class,
        ],

        'name_en' => [

            TrimDuplicateSpaces::class,
        ],

        'description_ar' => [

            Trim::class,
        ],

        'description_en' => [

            Trim::class,
        ],

//        'slug' => [
//            Slug::class,
//        ],

        'quantity' => [
            RemoveNonNumeric::class,

        ],
        'serial_number' => [
            RemoveNonNumeric::class,

        ],

        'regular_price' => [

        ],

        'sale_price' => [

        ],

        'start_sale' => [

        ],
        'end_sale' => [

        ],

        'alt' => [

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


        return [
            'img' => [request()->segment(2) ? 'nullable' : 'required', 'image', 'mimes:jpg,png,jpeg', 'max:2048'],
            'video' => [ 'nullable','mimes:mp4,mov,ogg | max:20000'],
            'name_ar' => ['required', 'string', 'max:50'],
            'name_en' => ['required', 'string', 'max:50'],
            'description_ar' => ['nullable', 'string'],
            'description_en' => ['nullable', 'string'],
            'slug' => ['nullable', 'string', 'max:50'],
            'quantity' => ['required', 'integer', 'min:0', 'digits_between:1,11'],
            'serial_number' => ['required', 'min:0', 'unique:products,serial_number, ' . request()->segment(4)],
            'regular_price' => ['required', 'numeric', 'min:0'],
            'sale_price' => ['required_with:in_sale', 'numeric', 'lt:regular_price', 'min:0'],
            'start_sale' => ['required_with:in_sale', 'date_format:Y-m-d'],
            'end_sale' => ['nullable', 'date_format:Y-m-d', 'after_or_equal:start_sale', 'after_or_equal:today'],
            'categories' => ['required', 'array'],
            'categories.*' => ['integer'],
            'images' => ['nullable', 'array'],
            'images.*' => ['image', 'mimes:jpg,png,jpeg'],

            'statements' => ['nullable', 'array'],
            'statements.*' => ['required_with:statements', 'array'],
            'statements.*.name_ar' => ['required', 'string', 'max:50'],
            // 'statements.*.value_ar'               => ['required', 'string' , 'max:50'],
            'statements.*.name_en' => ['required', 'string', 'max:50'],
            // 'statements.*.value_en'               => ['required', 'string' , 'max:50'],

            'kurly' => ['nullable', 'array'],
            'kurly.*' => ['required_with:kurly', 'array'],
            'kurly.*.name_ar' => ['required', 'string', 'max:50'],
            // 'kurly.*.value_ar'               => ['required', 'string' , 'max:50'],
            'kurly.*.name_en' => ['required', 'string', 'max:50'],
            // 'kurly.*.value_en'               => ['required', 'string' , 'max:50'],

            'attributes' => ['required_with:has_options', 'array'],
            'attributes.*.id' => ['required', 'integer', 'exists:attributes,id'],
            'attributes.*.option' => ['required', 'array'],
            'attributes.*.option.*.id' => ['required', 'integer', 'exists:options,id'],
            // 'attributes.*.option.*.regular_price' => ['required', 'numeric' , 'min:0'],
            // 'attributes.*.option.*.sale_price'    => ['nullable', 'numeric' , 'min:0' , 'lt:attributes.*.option.*.regular_price'],
            'attributes.*.option.*.quantity' => ['required', 'integer', 'digits_between:1,11'],
            'attributes.*.option.*.parent_id' => ['nullable', 'string', 'digits_between:1,11'],
        ];
    }

    public function messages()
    {

        return [

            'categories.required' => __('form.label.categories_required'),
            'attributes.*.id.exists' =>  __('form.label.attributes_exists'),
            'attributes.*.id.required' => __('form.label.attributes_required'),
            'attributes.required_with' => __('form.label.attributes_required_with'),
            'attributes.*.option.required' => __('form.label.attributes_option_required'),
        ];
    }
}
