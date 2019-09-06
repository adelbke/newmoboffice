<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
    //

    public function image(){
        return $this->belongsTo(Image::class);
    }

    public function Product(){
        return $this->belongsToMany(Product::class);
    }
}
