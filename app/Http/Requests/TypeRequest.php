<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TypeRequest extends FormRequest
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
            //
            // 'Category' => ['required', 'String', 'in:Meuble de Bureau,Mobilier de Réunion,Mobilier Accueil,Mobilier de Conférence,Bibliotheque Mobilier ecoles creches,Environnement & Accéssoires,Chaises'],
            'Name' => 'required|String',
            'parent_type' => 'required|exists:types,id' 
        ];
    }

    // public function messages(){
    //     return [
    //         ''
    //     ]
    // }
}
