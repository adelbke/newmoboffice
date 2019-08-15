<?php

namespace App\Http\Controllers;

use App\Retailer;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RetailerController extends Controller
{
    //

    public function index(){
        
        return view('retailers.index');
    }

    public function create(){
        return view('retailers.create');
    }

    public function store(){
        // dd('Hello');
        $data = request()->validate([
            'name'=>['required','unique:retailers'],
            'email'=>['required','email'],
            'password'=>['required','confirmed'],
            'password_confirmation'=>['required'],
            'phone'=>['required','alpha_num'],
            'registreCommerce'=>['required','alpha_num'],
        ]);

        $data['valide'] = false;

        $user = new User();
        $user->name = $data['name'];
        $user->email = $data['email'];
        $user->password = Hash::make($data['password']);


        $retailer = new Retailer($data);
        $retailer->save();
        return redirect()->back()->with('status','Vôtre demande sera prise en charge et vous serez notifié par email dès l\'activation de vôtre compte');
    }
}
