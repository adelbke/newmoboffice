<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Product extends Model
{
    protected $guarded = [];

    // use Searchable;

    // public function toSearchableArray()
    // {
    //     $array = $this->toArray();
    //     // Customize array...

    //     unset($array['reference']);

    //     return $array;
    // }

    protected $fillable = [
        'reference', 'clientPrice', 'retailerPrice', 'name', 'description', 'type_id', 'note', 'new'
    ];
    public function images()
    {
        return $this->belongsToMany(Image::class)->withPivot('image_type');
    }

    public function colors()
    {
        return $this->belongsToMany(Color::class);
    }

    public function type()
    {
        return $this->belongsTo(Type::class);
    }

    public function orders()
    {
        return $this->belongsToMany(Order::class)->withPivot('quantity', 'color_id');
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function collections()
    {
        return $this->belongsToMany(Product::class);
    }
}
