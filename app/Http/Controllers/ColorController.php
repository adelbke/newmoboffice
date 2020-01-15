<?php

namespace App\Http\Controllers;

use App\Color;
use App\Image;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

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

        $path = '/storage/'.$data['image']->store('colorImages','public');
        $image = new Image();
        $image->path=$path;
        $image->save();


        $color = new Color();
        $color->name= $data['name'];
        $color->reference=$data['reference'];
        $color->image_id = $image->id;

        $color->save();

        return redirect()->back()->with('status','Couleur'.$color->name.' Ajoutée avec Succès');

        // Saving the image
    }
    
    public function edit(Color $color)
    {
        return view('colors.edit',compact('color'));
    }

    public function update(Color $color)
    {
        $data = request()->validate([
            'name'=>['required','String','unique:colors,name'],
            'reference'=>['required','String','unique:colors,reference'],
            'image'=>['image','nullable']
        ]);
        if(isset($data['image'])){
            $path = $color->image->path;
            $color->image->delete();
            Storage::delete($path);

            $path = '/storage/'.$data['image']->store('colorImages','public');
            $image = new Image();
            $image->path=$path;
            $image->save();
            $color->image_id = $image->id;
        }
        $color->name= $data['name'];
        $color->reference=$data['reference'];

        $color->save();

        return redirect()->back()->with('status','Couleur'.$color->name.' Modifié avec Succès');
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
