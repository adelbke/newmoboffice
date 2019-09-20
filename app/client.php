<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class client extends Model
{
    //
    protected $guarded= [];
    use Searchable;

    public function toSearchableArray()
    {
        $array = $this->toArray();

        return $array;
    }



    public function user(){
        return $this->belongsTo(User::class);
    }

    public function retailer(){
        return $this->hasOne(Retailer::class);
    }

    public function clientpro(){
        return $this->hasOne(ClientPro::class);
    }

    public function orders(){
        return $this->hasMany(Order::class);
    }
}
