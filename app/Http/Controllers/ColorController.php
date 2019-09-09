<?php

namespace App\Http\Controllers;

use App\Color;
use Illuminate\Http\Request;

class ColorController extends Controller
{
    //

    public function index (){
        $colors = Color::with('image')->get();
        return view('colors.index',compact('colors'));
    }


    public function create(){
        return view('colors.create');
    }

    public function store(){
        $data= request()->validate([
            'reference'=>['required','String','unique:colors,reference'],
            'name'=>['required','String','unique:colors,name'],
            'image'=>['image','required']
        ]);

        // Saving the image
    }

    public function destroy(Color $color){
        $name = $color->Name;

        if($color->products()->exists()){
            return redirect()->back()->with('statusError','La Couleur '.$color->Name.' Ne peut pas être supprimé car il existe des produits de cette couleur');;
        }else{
            $color->delete();
        }
        return redirect()->back()->with('status','La Couleur '.$color->Name.' Supprimé avec Succès');
    }
}
