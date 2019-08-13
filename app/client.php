<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class client extends Model
{
    //
    protected $guarded= [];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function retailer(){
        return $this->hasOne(Retailer::class);
    }

    public function client(){
        return $this->hasOne(ClientPro::class);
    }
}
