<?php

namespace App\Http\Controllers;

use App\Order;
use Illuminate\Http\Request;
use Laravel\Scout\Searchable;

class OrderController extends Controller
{
    //
    public function index()
    {
        // $orders = Order::with(['products.colors','client.user.client.retailer'])->get()->toJson();

        return view('orders.index.auth');
    }

    public function getListJson()
    {
        $data = request()->validate([
            'search' =>['String','Nullable']
        ]);
        if($data['search'] == null){
            $orders = Order::with(['products.colors','client.user.client.retailer'])->get();
        }else{
            $orders = Order::with(['products.colors','client.user.client.retailer'])
            ->where('products.name','like',$data['search'])
            ->where('products.description','like',$data['search'])
            ->where('products.note','like',$data['search'])->get();
        }

        $orders->toJson();

        return $orders;
    }

    public function update(){
        $data = request()->validate([
            'orderid'=>['Numeric','required','exists:orders,id'],
            'newstate'=>['String','required','in:requested,waiting,Ready,Sold']
        ]);
        Order::find($data['orderid'])->update(['state'=>$data['newstate']]);
        return 'true';
    }

    public function getUserOrders(){
        $orders = Order::with(['products','client.user'=> function ($query)
        {
            $query->where('user_id','=',auth()->user()->id);
        }])->where('state','<>','Sold')->get();
        // throw 'error';
        // dd($orders);
        return $orders->toJson(JSON_PRETTY_PRINT);
    }

    public function create(){
        
    }
}
