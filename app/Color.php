<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
    //

    public function image(){
        return $this->belongsTo(Image::class);
    }

    public function products(){
        return $this->belongsToMany(Product::class);
    }
}
