<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations;

class Image extends Model
{
    protected $guarded = [];
    public function product(){
        return $this->belongsToMany(Product::class);
    }

    public function type(){
        return $this->belongsTo(Type::class);
    }

    public function colors(){
        return $this->hasOne(Color::class);
    }
}