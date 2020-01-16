<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClientPro extends Model
{

    public function client(){
        return $this->belongsTo(client::class);
    }
    //
}
