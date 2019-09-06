<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $guarded = [];
    //
    protected $fillable = [
        'reference', 'clientPrice','retailerPrice','name','description','type_id','note'
    ];
    public function images(){
        return $this->belongsToMany(Image::class);
    }

    public function colors(){
        return $this->belongsToMany(Color::class);
    }

    public function type(){
        return $this->belongsTo(Type::class);
    }

    public function products(){
        return $this->hasMany(Product::class);
    }

    public function collections(){
        return $this->belongsToMany(Product::class);
    }
}
