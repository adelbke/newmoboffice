<?php

namespace App\Http\Controllers;

use App\Color;
use App\Image;
use App\Order;
use App\Product;
use Gloudemans\Shoppingcart\Facades\Cart as Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    //

    public function add(){
        $data = request()->validate([
            'productid'=>['required','Numeric','exists:products,id'],
            'reference'=>['required','String','exists:products,reference'],
            'quantity'=>['required','Numeric','Max:10','Min:1'],
            'isretailer'=>['required','boolean'],
            'color'=>['required','exists:colors,id'],
            'image'=>['required','exists:images,id']
        ]);
        
        $product = Product::find($data['productid'])->load('type');
        $image = Image::find($data['image']);
        $color = Color::find($data['color'])->load('image');
        // Cart::add($data['productid'],$product->name,$data['quantity'],$data['isretailer']? $product->retailerPrice:$product->clientPrice,0,['color'=>$data['color']]);

        $instance = Cart::add([
            'id'=>$data['productid'],
            'name'=>$product->name,
            'qty'=>$data['quantity'],
            'price'=> $data['isretailer']? $product->retailerPrice:$product->clientPrice,
            'options'=>['color'=>$color,
                'image'=>$image->path,
                'reference'=>$data['reference'],
                'type'=>$product->type,
                'description'=>$product->description
            ],
            'weight'=>0,
        ]);
        return $instance->rowId;
    }

    public function remove(Request $request){
        Cart::remove($request->input('rowid'));
        return 'true';
    }

    public function getContent(){
        $cart = Cart::content();
        $data = [];
        $i =0;
        foreach ($cart as $key => $value) {
            $data[$i]['id'] = $value->id;
            $data[$i]['name']= $value->name;
            $data[$i]['price']=$value->price;
            $data[$i]['quantity'] =$value->qty;
            $data[$i]['color'] = $value->options->color;
            $data[$i]['image']= $value->options->image;
            $data[$i]['reference']= $value->options->reference;
            $data[$i]['rowId'] = $value->rowId;
            $data[$i]['description']= $value->options->description;

            $i++;
        }
        return json_encode($data);
    }

    public function index(){
        return view('cart.index');
    }

    public function update(Request $request){
        
        try {
            Cart::update(
                $request->input('rowid'),
                $request->input('quantity')
            );
            return 'true';
        } catch (\Throwable $th) {
            return false;
        }
        

    }
    public function store(){
        if(Auth::check()){
            $content = Cart::content();
            $order = new Order();
            // $order->client_id = auth()->user()->client->id;
            try {
                $order->client_id = auth()->user()->client->id;
            } catch (\Throwable $th) {
                if(auth()->user()->Admin->exists()){
                    return redirect()->back()->with("AdminMessage","Vous êtes un admin, vous ne pouvez pas Commander des Produits");
                }
            }
            $order->state="requested";
            $order->price= Cart::total();
            $order->save();
            foreach ($content as $key => $value) {
                $order->products()->attach($value->id,['quantity'=>$value->qty,
                'color_id' =>$value->options->color->id]);
            }
            
            Cart::destroy();
            return redirect('/')->with('Message','Cart Saved Successfully');
        }else{
            return redirect('/login')->with('sendBackTo','cartIndex');
        }
    }
}
