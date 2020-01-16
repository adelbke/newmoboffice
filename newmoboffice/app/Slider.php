<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Slider extends Model
{ 
    public function image(){
        return $this->BelongsTo(Image::class);
    }
}
