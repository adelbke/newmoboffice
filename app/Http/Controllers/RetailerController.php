<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RetailerController extends Controller
{
    //

    public function index(){
        
        return view('retailers.index');
    }

    public function create(){
        return view('retailers.create');
    }
}
