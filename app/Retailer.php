<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Retailer extends Model
{
    //

    protected $guarded = [];

    public function client(){
        return $this->belongsTo(client::class);
    }
}
