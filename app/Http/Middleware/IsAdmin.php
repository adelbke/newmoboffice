<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(auth()->user() == null){
            return redirect()->back();
            
        }else{
            if(count(auth()->user()->admin()) == 0){
                return redirect()->back();                
            }
        }
        return $next($request);
    }
}
