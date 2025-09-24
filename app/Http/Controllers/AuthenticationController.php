<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class AuthenticationController extends Controller
{
    public function login(Request $request)
    {
        return Inertia::render("Login", [
            "tab" => "login"
        ]);
    }

    public function register(Request $request)
    {
        return Inertia::render("Register");
    }

    // public function home(Request $request)
    // {
    //     return Inertia::render("Home");
    // }

    // public function profile(Request $request)
    // {
    //     return Inertia::render("Profile");
    // }
}
