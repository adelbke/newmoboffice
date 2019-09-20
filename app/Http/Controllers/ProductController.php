<?php

namespace App\Http\Controllers;

use App\client;
use App\Color;
use Illuminate\Http\Request;
use App\Product;
use App\Image;
use App\Retailer;
use App\Type;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image as InterventionImage;

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

        $products = Product::with(['colors.image','type'])->paginate(15);
        $colors = DB::table('colors')->join('color_product','colors.id','=','color_product.color_id')->get();
        // dd($colors);
        return view('products.index',compact('products','colors'));
    }

    public function show (Product $product){
        $product->load(['images' => function ($query){
            $query->where('image_type','=','product_image');
        },'colors.image','type']);
        foreach ($product->images as $index => $image) {
            $smallimage = InterventionImage::make(public_path($image->path))->resize(410, 480);
            $smallimage->save(public_path('storage/temp/'.$image->id.'.jpg'));
            // $image['small'] = $smallimage;
            $product->images[$index]['small'] = '/storage/temp/'.$image->id.'.jpg';
        }
        $product->price = $product->clientPrice;
        unset($product->clientPrice);
        if(Auth::check()){
            if(Auth::user()->client()->exists()){
                $retailer = Retailer::with('client.user')->where('user_id','=',auth()->user()->id);
                if(count($retailer)){
                    unset($product->retailerPrice);                    
                }
            }else{
            }
        }else{
            unset($product->retailerPrice);            
        }
        // dd($product->images);


        return view ('products.show',compact('product'));
    }

    public function destroy(Product $product){
        $name = $product->name;
        $product->images()->delete();
        $product->delete();

        return redirect()->back()->with('status','Produit '.$product->name.' supprimé avec Succès');;
    }

    public function update(Product $product){
        // Form Validation
        $data = request()->validate([
            'reference'=>['required','unique:products,'.$product->id],
            'category'=>['in:Informatique,Ameublement,Electronique'],
            'clientPrice'=>['required','Numeric','min:0','max:999999','gte:retailerPrice'],
            'retailerPrice'=>['required','Numeric','min:0','max:999999','lte:clientPrice'],
            'category'=>['required','in:Meuble de Bureau,Mobilier de Réunion,Mobilier Accueil,Mobilier de Conférence,Bibliothèque & mobilier pour écoles et crèches,Environnement & Accéssoires'],
            'type'=>['required','exists:types,Name'],
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
        $typeList = Type::all();
        $colorList = Color::all();
        return view('products.create',compact('typeList','colorList'));
    }
    public function store(Request $request){

        // dd($request->all());
        // Form Validation
        $data = request()->validate([
            'clientPrice'=>['required','Numeric','min:2','max:100000','gte:retailerPrice'],
            'retailerPrice'=>['required','Numeric','min:1','max:100000','lte:clientPrice'],
            'category'=>['required','in:Meuble de Bureau,Mobilier de Réunion,Mobilier Accueil,Mobilier de Conférence,Bibliothèque & mobilier pour écoles et crèches,Environnement & Accéssoires'],
            'Type'=>['required','exists:types,id'],
            'colors'=>['required','array'],
            'colors.*'=>['required','integer','exists:colors,id'],
            'name'=>['required'],
            'note'=>['required','String'],
            'description'=>['required'],
            'imageCard'=>['image','required'],
            'imageSlider'=>['image','required'],
            'productImage'=>['required','array'],
            'productImage.*'=>['image','required']
        ]);

        // Multi image submission Handling

        
        // dd($data);


        $data['reference']='NM'.sprintf("%02d",$data['Type']).sprintf("%02d",$data['colors']);
        $tempreference = $data['reference'];
        $count =-1;

        while(Product::where('reference','=',$tempreference)->exists()){
            $count++;
            $tempreference = $data['reference'].sprintf("%02d",$count);
        }

        $data['reference']=$tempreference;


        unset($data['imageCard']);
        unset($data['productImage']);
        unset($data['imageSlider']);
        unset($data['category']);
        $data['type_id']= intval($data['Type']);
        unset($data['Type']);
        $colors = $data['colors'];
        unset($data['colors']);

        // dd($data);

        $product = new Product($data);


        // save the product
        $product->save();

        $product->colors()->sync($colors);

        // save each product image
        foreach (request('productImage') as  $image) {
            $path = '/storage/'. $image->store('productImages','public');
            $object = new Image();
            $object->path=$path;
            // $object->image_type = "product_image";
            $object->save();
            $product->images()->attach($object,['image_type'=>'product_image']);
        }

        // Saving the Card Image
        $path = '/storage/'.request('imageCard')->store('productCardImages','public');
        $object = new Image();
        $object->path=$path;
        // $object->image_type = "card";
        $object->save();
        $product->images()->attach($object,['image_type'=>'card']);


        // save slider Image
        $path = '/storage/'.request('imageSlider')->store('productSliderImages','public');
        $object = new Image();
        $object->path=$path;
        // $object->image_type = "slider";
        $object->save();
        $product->images()->attach($object,['image_type'=>'slider']);



        
        return redirect()->back()->with('status','Produit'.$product->name.' Enregistré avec Succès');
        // $currentProduct = new Product();

        // dd($paths);
        // dd(request('images'));

    }
}
