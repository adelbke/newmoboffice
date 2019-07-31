<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Image;

class ProductController extends Controller
{
    //

    public function edit(Product $product){
        // $this->authorize('update',$product);

        $images = $product->images()->get();
        // dd($images);
        return view('products.edit',compact('product','images'));
    }

    public function index(){

        $products = Product::whereRaw('1 = 1')->orderBy('created_at','DESC')->paginate(10);

        return view('products.index',compact('products'));
    }

    public function show (){
        return view ('products.show');
    }

    public function destroy(Product $product){
        $name = $product->name;
        $product->images()->delete();
        $product->delete();

        return redirect()->back()->with('status','Produit'.$product->name.' supprimé avec Succès');;
    }

    public function update(Product $product){
        // Form Validation
        $data = request()->validate([
            'reference'=>['required','unique:products,'.$product->id],
            'category'=>['in:Informatique,Ameublement,Electronique'],
            'clientPrice'=>['required','Numeric','min:0','max:999999','gte:retailerPrice'],
            'retailerPrice'=>['required','Numeric','min:0','max:999999','lte:clientPrice'],
            // 'category'=>['required'],
            'name'=>['required','min:5'],
            'description'=>['required'],
            'images'=>['required','array'],
            'images.*' =>['image'],
        ]);
        unset($data['images']);
        $product->update($data);

        Image::where('product_id',[$product->id])->delete();

        // foreach (request('images') as  $image) {
        //     $path = 'storage/'. $image->store('productImages','public');
        //     $object = new Image();
        //     $object->path=$path;
        //     $object->product_id = $product->id;
        //     $object->save();
        // }
        

        return redirect()->back()->with('status','Produit'.$product->name.' Enregistré avec Succès');

    }
    public function create(){
        return view('products.create');
    }
    public function store(Request $request){

        // dd(request('images'));

        // Form Validation
        $data = request()->validate([
            'reference'=>['required','unique:products'],
            'category'=>['in:Informatique,Ameublement,Electronique'],
            'clientPrice'=>['required','Numeric','min:0','max:999999','gte:retailerPrice'],
            'retailerPrice'=>['required','Numeric','min:0','max:999999','lte:clientPrice'],
            // 'category'=>['required'],
            'name'=>['required','min:5'],
            'description'=>['required'],
            'images'=>['required','array'],
            'images.*' =>['image'],
        ]);

        // Multi image submission Handling

        
        // dd($data);
        unset($data['images']);
        $product = new Product($data);

        // save the product
        $product->save();

        // save each image
        foreach (request('images') as  $image) {
            $path = 'storage/'. $image->store('productImages','public');
            $object = new Image();
            $object->path=$path;
            $object->product_id = $product->id;
            $object->save();
        }

        return redirect()->back()->with('status','Produit'.$product->name.' Enregistré avec Succès');
        // $currentProduct = new Product();

        // dd($paths);
        // dd(request('images'));

    }
}
