<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Color extends Model
{
    //
    use Searchable;

    public function toSearchableArray()
    {
        $array = $this->toArray();

        return $array;
    }

    public function image(){
        return $this->belongsTo(Image::class);
    }

    public function products(){
        return $this->belongsToMany(Product::class);
    }

}
