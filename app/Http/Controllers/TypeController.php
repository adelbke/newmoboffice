<?php

namespace App\Http\Controllers;

use App\Type;
use Illuminate\Http\Request;

class TypeController extends Controller
{
    //
    public function index(){
        $types = Type::all();
        return view('types.index',compact('types'));
    }

    public function create(){
        return view('types.create');
    }

    public function getCategory(){
        $data = request()->validate([
            'category'=>['required'],
            'adminId'=>['required','exists:admins,id','numeric']
        ]);
        try {
            $types = Type::all()->where('Category','=',$data['category']);
        } catch (\Throwable $th) {
            return null;
        }
        
        return json_encode($types);
    }
}
