<?php

use App\Http\Controllers\API\AuthenticationController;
use App\Http\Controllers\API\PostController;
use App\Http\Controllers\API\ProfileController;
use Illuminate\Support\Facades\Route;

Route::post('/login', [AuthenticationController::class, 'login']);
Route::post('/register', [AuthenticationController::class, 'register']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthenticationController::class, 'logout']);

    Route::get('/posts', [PostController::class, 'index']);
    Route::post('/posts', [PostController::class, 'store']);
    Route::put('/posts/{post}', [PostController::class, 'update']);
    Route::delete('/posts/{post}', [PostController::class, 'delete']);
    Route::post('/posts/{post}/reaction', [PostController::class, 'reaction']);
    Route::post('/posts/{post}/comment', [PostController::class, 'comment']);

    Route::get('/profile', [ProfileController::class, 'profile']);
    Route::get('/my-posts', [ProfileController::class, 'getMyPosts']);
});
