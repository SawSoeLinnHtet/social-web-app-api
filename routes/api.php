<?php

use App\Http\Controllers\API\AuthenticationController;
use App\Http\Controllers\API\PostController;
use Illuminate\Support\Facades\Route;

// Route::post('/register', [AuthenticationController::class, 'register']);
Route::post('/login', [AuthenticationController::class, 'login']);
// Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthenticationController::class, 'logout']);

    Route::get('/posts', [PostController::class, 'index']);
    Route::post('/post/{post}/reaction', [PostController::class, 'reaction']);
    Route::post('/post/{post}/comment', [PostController::class, 'comment']);
});
