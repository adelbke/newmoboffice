<?php

namespace App\Http\Controllers;

use App\Color;
use App\Product;
use App\Type;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
            'Category'=>['required','String','in:Meuble de Bureau,Mobilier de Réunion,Mobilier Accueil,Mobilier de Conférence,Bibliotheque Mobilier ecoles creches,Environnement & Accéssoires,Chaises']
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
    public function edit(Type $type)
    {
        return view('types.edit',compact('type'));
    }

    public function update (Type $type){
        $data = request()->validate([
            'Name'=>['required','String'],
            'Category'=>['required','String','in:Meuble de Bureau,Mobilier de Réunion,Mobilier Accueil,Mobilier de Conférence,Bibliotheque Mobilier ecoles creches,Environnement & Accéssoires,Chaises']
        ]);

        // dd($type);
        $type->update([
            'Name'=>$data['Name'],
            'Category'=>$data['Category'],
        ]);

        return redirect()->back()->with('status','La Sous Catégorie '.$type->Name.' Modifié avec Succès');
        
    }

    public function getCategory(){
        $data = request()->validate([
            'category'=>['required','String'],
            'adminId'=>['required','exists:admins,id','numeric']
        ]);
        try {
            $types = Type::all()->where('Category','=',$data['category']);
        } catch (\Throwable $th) {
            dd($th);
            return null;
        }
        
        return $types->toJson();
    }

    public function show(Type $type){
        
        $products = Product::with(['colors.image','images'=> function ($query) {
            $query->where('image_type','=','card');
        }])->where('type_id','=',$type->id)->paginate(15);

        // $productsList = $products->toJson(JSON_PRETTY_PRINT);
        
        $colors = DB::table('colors')->join('color_product','colors.id','=','color_product.color_id')
            ->join('products','color_product.product_id',"=","products.id")
            ->join('images','colors.image_id','=','images.id')
            ->where('type_id','=',$type->id)
            ->select('colors.name','path','colors.reference')->get();

        // dd($products);
        
        // $colors = Color::with('image')->where('');

	//dd($products);


        return view('types.show',compact('products','type','colors'));
    }
}
