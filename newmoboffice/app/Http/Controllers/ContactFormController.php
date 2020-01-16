<?php

namespace App\Http\Controllers;

use App\Mail\ContactFormMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactFormController extends Controller
{
    //
    public function create()
    {
        return view('contact');
    }

    public function store()
    {
        // validate Email
        $data = request()->validate([
            'name'=>['required','String'],
            'Email'=>['required','email'],
            'message'=>['required','String']
        ]);
        
        // dd($data);
        // Send the Email
        Mail::to('test@test.com')->send(new ContactFormMail());
    }
}

