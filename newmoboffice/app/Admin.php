<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User;

class Admin extends Model
{
    //
    protected $guarded = [];
    
    protected $fillable = [
        'role'
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
}
