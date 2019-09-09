<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Type extends Model
{
    //
    protected $guarded = [];
    
    public function products(){
        return $this->hasMany(Product::class);
    }

    public function image(){
        return $this->hasOne(Image::class);
    }
}