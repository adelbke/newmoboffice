<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
        // Change Permissions
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'clientPrice' => ['required', 'Numeric', 'min:2', 'max:100000', 'gte:retailerPrice'],
            'retailerPrice' => ['required', 'Numeric', 'min:1', 'max:100000', 'lte:clientPrice'],
            'Type' => ['required', 'exists:types,id'],
            'new' => ['required', 'Boolean'],
            'colors' => ['required', 'array'],
            'colors.*' => ['required', 'integer', 'exists:colors,id'],
            'name' => ['required'],
            'note' => ['required', 'String'],
            'description' => ['required'],
            // 'images' => ['array', 'required',
            // function($attribute, $value, $fail){
            //     if(!in_array('imageCard',$value) || !in_array('productImage',$value)){
            //         $fail($attribute.' doit au moins contenir un imageCard et un productImage');
            //     }
            // }],
            // 'images.*' => ['String', 'in:imageCard,imageSlider,productImage,smallProductImage'],
            'imageCard' => ['image', 'required'],
            'imageSlider' => ['image'],
            'productImage' => ['required', 'array'],
            'productImage.*' => ['image', 'required']
        ];
    }
}
