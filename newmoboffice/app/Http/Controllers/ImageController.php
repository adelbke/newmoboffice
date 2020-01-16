<?php

namespace App\Http\Controllers;

use App\Image;
use Illuminate\Http\Request;

class ImageController extends Controller
{
    public function index(){
        $images = Image::paginate(12);
        return view ('images.index',compact('images'));
    }
}
