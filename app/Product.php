<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $guarded = [];
    //
    protected $fillable = [
        'reference', 'category', 'clientPrice','retailerPrice','name','description'
    ];
    public function images(){
        return $this->hasMany(Image::class);
    }

    public function type(){
        return $this->hasOne(Type::class);
    }

    public function products(){
        return $this->hasMany(Product::class);
    }

    public function collections(){
        return $this->belongsToMany(Product::class);
    }
}
