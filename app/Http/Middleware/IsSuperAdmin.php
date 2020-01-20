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
        // We check if it's logged in
        if(Auth::check()){
            // we check if it's actually an admin
            if(auth()->user()->admin()->exists()){
                // if it is an admin we have to check if it's a super admin or not
                if(auth()->user()->admin->role === "SuperAdmin"){
                    return $next($request);
                }
                else{
                    // if it's not a superadmin he cannot go in
                    return redirect()->back();
                }

            }else{
                // if it's not an admin it cannot go in
                return redirect()->back();
            }
            // not logged in, can't go in
        }else{
            return redirect()->back();
        }
    
    }
}
