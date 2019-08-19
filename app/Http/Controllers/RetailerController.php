<?php

namespace App\Http\Controllers;

use App\client;
use App\Retailer;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class RetailerController extends Controller
{
    //

    public function index(){
        if(Auth::check()) {
            if(auth()->user()->admin == null){
                return view('retailers.index');
            }else{
                // $user = User::has('client');
                $retailers = DB::table('users')->join('clients','users.id','=','clients.user_id')
                    ->join('retailers','clients.id','=','retailers.client_id')->paginate(15);
                // dd($retailers);
                // Unfinished
                return view('retailers.list',compact('retailers'));
            }    
        }else{
            return view('retailers.index');
        }
    }

    public function create(){
        return view('retailers.create');
    }

    public function store(){
        // dd('Hello');
        $data = request()->validate([
            'name'=>['required','unique:retailers'],
            'email'=>['required','email','unique:users,email'],
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
        $user->save();

        $client = new client();
        $client->user_id = $user->id;
        $client->phone = $data['phone'];
        $client->save();

        $retailer = new Retailer();
        $retailer->registreCommerce = $data['registreCommerce'];
        $retailer->client_id = $client->id;

        $retailer->save();
        return redirect()->back()->with('status','Vôtre demande sera prise en charge et vous serez notifié par email dès l\'activation de vôtre compte');
    }
}
