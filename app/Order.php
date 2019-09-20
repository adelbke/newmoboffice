<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Order extends Model
{
    protected $guarded = [];
    use Searchable;

    public function toSearchableArray()
    {

        $a = $this->toArray();
        $products = $this->products()->get(['name'])->map( function ($product) {
                  return $product['name'];
         });
         $a['products'] = implode(' ', $products->toArray());
        return $a;

        // $array = $this->toArray();
        // // Customize array...

        // $array = $this->with('products.colors')->with('client.user.client.retailer')->toArray();

        // return $array;
    }

    public function products(){
        return $this->belongsToMany(Product::class)->withPivot('quantity','color_id');
    }


    public function client (){
        return $this->belongsTo(client::class);
    }
    //
}
