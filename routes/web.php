<?php

use App\Http\Controllers\AuthenticationController;
use Illuminate\Support\Facades\Route;



Route::get('/login', [AuthenticationController::class,'login'])->name('get.login');
Route::get('/register', [AuthenticationController::class,'register'])->name('get.register');
Route::get('/home', [AuthenticationController::class,'home'])->name('get.home');
Route::get('/profile', [AuthenticationController::class,'profile'])->name('get.profile');
