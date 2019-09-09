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

    public function store(Request $request){
        // dd(request()->all());
        $data = request()->validate([
            'Name'=>['required','String'],
            'Category'=>['required','String','in:Meuble de Bureau,Mobilier de Réunion,Mobilier Accueil,Mobilier de Conférence,Bibliothèque & mobilier pour écoles et crèches,Environnement & Accéssoires']
        ]);
        // Data validated
        // dd($data);

        $type = new Type($data);
        $type->save();

        return redirect()->back()->with('status','La Sous Catégorie '.$type->Name.' Enregistré avec Succès');
    }

    public function destroy (Type $type) {
        $name = $type->Name;

        if($type->products()->exists()){
            return redirect()->back()->with('statusError','La Sous Catégorie '.$type->Name.' Ne peut pas être supprimé car il existe des produits de ce type');;
        }else{
            $type->delete();
        }
        return redirect()->back()->with('status','La Sous Catégorie '.$type->Name.' Supprimé avec Succès');

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
