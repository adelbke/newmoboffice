<?php

namespace App\Http\Controllers;

use App\client;
use App\Color;
use Illuminate\Http\Request;
use App\Product;
use App\Image;
use App\Retailer;
use App\Type;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\File;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
// use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image as InterventionImage;

class ProductController extends Controller
{
    //

    public function edit(Product $product)
    {
        // $this->authorize('update',$product);

        $colorList = Color::all();
        $product->load('colors');
        // $card->$product->images
        // $product->colors()->first()
        // dd($images);
        return view('products.edit', compact('product', 'colorList'));
    }

    public function index()
    {

        $products = Product::with(['colors.image', 'type'])->get()->each(function ($item, $key) {
            // Price Formatting
            // $item['Price']= 'Prix Client: ' . $item['clientPrice']. '<br>Prix Revendeur: '.$item['retailerPrice'];
            // unset($item['retailerPrice']);
            // unset($item['clientPrice']);

            // Type formatting
            if ($item['type'] != null) {
                $item['type'] = $item['type']['Category'] . ': ' . $item['type']['Name'];
            }
            // Name
            // $item['name'] = $item['name'] . '<br>' . $item['note'];
            // unset($item['note']);

            $item->load(['images' => function ($query) {
                $query->where('image_type', '=', 'card');
            }, 'colors.image', 'type']);

            $item['description'] = str_replace(['\n', '\r'], '', $item['description']);
        })->toJson();
        // dd($products);
        return view('products.index', compact('products'));
    }

    public function show(Product $product)
    {

        // Increment Visitors Number
        $product->visitors = $product->visitors + 1;
        $product->save();

        // Treating product display

        $product->load(['images' => function ($query) {
            $query->where('image_type', '=', 'product_image');
        }, 'colors.image', 'type']);
        foreach ($product->images as $index => $image) {
            $smallimage = InterventionImage::make(public_path($image->path))->resize(410, null, function ($constraint) {
                $constraint->aspectRatio();
            });
            // $smallimage = InterventionImage::make(public_path($image->path))->resize(410, 480);
            $smallimage->save(public_path('storage/temp/' . $image->id . '.jpg'));
            // $image['small'] = $smallimage;
            $product->images[$index]['small'] = '/storage/temp/' . $image->id . '.jpg';
        }

        $product->price = $product->clientPrice;
        unset($product->clientPrice);
        if (Auth::check()) {
            if (Auth::user()->client()->exists()) {
                $retailer = Retailer::with('client.user')->where('user_id', '=', auth()->user()->id);
                if (count($retailer)) {
                    unset($product->retailerPrice);
                }
            } else {
            }
        } else {
            unset($product->retailerPrice);
        }

        // dd($product->images);

        // Similar products creation

        // $similar = Product::orderBy('visitors','desc')->where('type_id','=',$product->type->id)->where('id','!=',$product->id)->take(4)->get();
        $similar = Product::with(['images' => function ($query) {
            $query->where('image_type', '=', 'card')->select('path');
        }])->where('type_id', '=', $product->type->id)->where('id', '!=', $product->id)->take(4)->get()->sortBydesc('visitors');

        // $similar = new Collection([]);

        return view('products.show', compact('product', 'similar'));
    }

    public function destroy(Product $product)
    {
        $name = $product->name;
        $product->images()->delete();
        $product->delete();

        return redirect()->back()->with('status', 'Produit ' . $name . ' supprimé avec Succès');;
    }

    public function update(Product $product)
    {
        // Form Validation
        $data = request()->validate([
            'clientPrice' => ['Numeric', 'min:2', 'max:100000', 'gte:retailerPrice'],
            'retailerPrice' => ['Numeric', 'min:1', 'max:100000', 'lte:clientPrice'],
            'category' => ['in:Meuble de Bureau,Mobilier de Réunion,Mobilier Accueil,Mobilier de Conférence,Bibliothèque & mobilier pour écoles et crèches,Environnement & Accéssoires,Chaises'],
            'Type' => ['required', 'exists:types,id'],
            'new' => ['String'],
            'colors' => ['array'],
            'colors.*' => ['integer', 'exists:colors,id'],
            'name' => ['String'],
            'note' => ['String'],
            'description' => ['String'],
            'imageCard' => ['image'],
            'imageSlider' => ['image'],
            'productImage' => ['array'],
            'productImage.*' => ['image']
        ]);

        // $data['description'] = nl2br($data['description']);
        // $data['name'] = ucfirst($data['name']);
        // dd($data);


        $data['reference'] = $product->reference;

        if (isset($data['imageCard'])) {
            $product->images()->wherePivot('image_type', '=', 'card')->delete();
            $product->images()->wherePivot('image_type', '=', 'card')->detach();

            // Saving the Card Image
            $path = '/storage/' . request('imageCard')->store('productCardImages', 'public');
            $object = new Image();
            $object->path = $path;
            // $object->image_type = "card";
            $object->save();
            $product->images()->attach($object, ['image_type' => 'card']);
        }
        if (isset($data['imageSlider'])) {
            $product->images()->wherePivot('image_type', '=', 'slider')->delete();
            $product->images()->wherePivot('image_type', '=', 'slider')->detach();

            if (null !== request('imageSlider')) {
                $path = '/storage/' . request('imageSlider')->store('productSliderImages', 'public');
                $object = new Image();
                $object->path = $path;
                // $object->image_type = "slider";
                $object->save();
                $product->images()->attach($object, ['image_type' => 'slider']);
            }
        }
        if (isset($data['productImage'])) {
            $product->images()->wherePivot('image_type', '=', 'product_image')->delete();
            $product->images()->wherePivot('image_type', '=', 'product_image')->detach();
            foreach (request('productImage') as  $image) {
                $path = '/storage/' . $image->store('productImages', 'public');
                $object = new Image();
                $object->path = $path;
                // $object->image_type = "product_image";
                $object->save();
                $product->images()->attach($object, ['image_type' => 'product_image']);
            }
        }


        // Multi image submission Handling

        unset($data['imageCard']);
        unset($data['productImage']);
        unset($data['imageSlider']);
        unset($data['category']);
        $data['type_id'] = intval($data['Type']);
        unset($data['Type']);
        $colors = $data['colors'];
        unset($data['colors']);
        $data['new'] = (isset($data['new']) && 'on' == $data['new']) ? true : false;

        // dd($data);

        $product->update($data);

        // dd($product);
        // save the product
        // $product->save();

        $product->colors()->sync($colors);

        return redirect()->back()->with('status', 'Produit' . $product->name . ' Modifié avec Succès');
    }
    public function create()
    {
        $typeList = Type::all();
        $colorList = Color::all();
        return view('products.create', compact('typeList', 'colorList'));
    }
    public function store(Request $request)
    {

        // dd($request->all());
        // Form Validation
        $data = request()->validate([
            'clientPrice' => ['required', 'Numeric', 'min:2', 'max:100000', 'gte:retailerPrice'],
            'retailerPrice' => ['required', 'Numeric', 'min:1', 'max:100000', 'lte:clientPrice'],
            'category' => ['required', 'in:Meuble de Bureau,Mobilier de Réunion,Mobilier Accueil,Mobilier de Conférence,Bibliothèque & mobilier pour écoles et crèches,Environnement & Accéssoires,Chaises'],
            'Type' => ['required', 'exists:types,id'],
            'new' => ['required', 'String'],
            'colors' => ['required', 'array'],
            'colors.*' => ['required', 'integer', 'exists:colors,id'],
            'name' => ['required'],
            'note' => ['required', 'String'],
            'description' => ['required'],
            // 'imageCard'=>['image','required','dimensions:width=210'],
            'imageCard' => ['image', 'required'],
            'imageSlider' => ['image'],
            'productImage' => ['required', 'array'],
            // 'productImage.*'=>['image','required','dimensions:width:580']
            'productImage.*' => ['image', 'required']
        ]);

        // Text formatting
        $data['description'] = nl2br($data['description']);
        $data['name'] = ucfirst($data['name']);
        $data['new'] = 'true' == $data['new'] ? true : false;
        // dd($data);


        // Generating reference number
        $data['reference'] = 'NM' . sprintf("%02d", $data['Type']) . sprintf("%02d", $data['colors']);
        $tempreference = $data['reference'];
        $count = -1;

        while (Product::where('reference', '=', $tempreference)->exists()) {
            $count++;
            $tempreference = $data['reference'] . sprintf("%02d", $count);
        }

        $data['reference'] = $tempreference;

        // Multi image submission Handling

        unset($data['imageCard']);
        unset($data['productImage']);
        unset($data['imageSlider']);
        unset($data['category']);
        $data['type_id'] = intval($data['Type']);
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
            $path = '/storage/' . $image->store('productImages', 'public');
            $object = new Image();
            $object->path = $path;
            // $image['small'] = $smallimage;
            $product->images[$index]['small'] = '/storage/temp/' . $image->id . '.jpg';
            $object->save();
            $product->images()->attach($object, ['image_type' => 'product_image']);
        }

        // Saving the Card Image
        $path = '/storage/' . request('imageCard')->store('productCardImages', 'public');
        $object = new Image();
        $object->path = $path;
        // $object->image_type = "card";
        $object->save();
        $product->images()->attach($object, ['image_type' => 'card']);


        // save slider Image
        if (null !== request('imageSlider')) {
            $path = '/storage/' . request('imageSlider')->store('productSliderImages', 'public');
            $object = new Image();
            $object->path = $path;
            // $object->image_type = "slider";
            $object->save();
            $product->images()->attach($object, ['image_type' => 'slider']);
        }



        return redirect()->back()->with('status', 'Produit' . $product->name . ' Enregistré avec Succès');
        // $currentProduct = new Product();

        // dd($paths);
        // dd(request('images'));

    }
}
