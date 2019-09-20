<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Type extends Model
{
    //
    protected $guarded = [];
    
    use Searchable;

    public function toSearchableArray()
    {
        $array = $this->toArray();
        // Customize array...


        return $array;
    }

    public function products(){
        return $this->hasMany(Product::class);
    }

    public function image(){
        return $this->hasOne(Image::class);
    }
}