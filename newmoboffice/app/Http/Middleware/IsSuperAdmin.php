<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use App\Admin;

class IsSuperAdmin
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
        if(Auth::check()){
            if(count(auth()->user()->admin())==0){
                return redirect()->back();
            }else{

                if(auth()->user()->admin->role != "SuperAdmin")
                {
                    return redirect()->back();
                }else{
                    return $next($request);
                }
            }
            return $next($request);
        }else{
            return redirect()->back();
        }
    
    }
}
