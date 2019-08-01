<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Retailer extends Model
{
    //

    public function client(){
        return $this->belongsTo(client::class);
    }
}
