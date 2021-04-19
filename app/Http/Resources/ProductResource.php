<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Auth;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $array = parent::toArray($request);
        $array['visitors'] = $this->when(Auth::user() && Auth::user()->isAdmin(),$this->visitors);
        $array['retailerPrice'] = $this->when(Auth::user() && Auth::user()->isAdmin(),$this->retailerPrice);
        $array['created_at'] = $this->when(Auth::user() && Auth::user()->isAdmin(),$this->created_at);
        $array['updated_at'] = $this->when(Auth::user() && Auth::user()->isAdmin(),$this->updated_at);
        $array['clientPrice'] = $this->when(Auth::user() && Auth::user()->isAdmin(),$this->clientPrice);
        $array['price'] = $this->when(!Auth::user() || !Auth::user()->isAdmin(),$this->clientPrice);

        $array['colors'] = $this->whenLoaded('colors');
        $array['type'] = $this->whenLoaded('type');
        $array['images'] = $this->whenLoaded('images');
        
        return $array;
    }
}
