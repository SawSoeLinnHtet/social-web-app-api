<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResource;
use App\Http\Resources\ProfileResource;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function profile()
    {
        $user = Auth::user();

        $user = ProfileResource::make($user);

        return response()->json([
            "status" => Response::HTTP_OK,
            'message' => "Profile fetched successfully",
            'data' => $user
        ]);
    }

    public function getMyPosts()
    {
        $user = Auth::user();

        $posts = Post::where('user_id', $user->id)->orderBy('created_at', 'desc')->get();

        $posts = PostResource::collection($posts);

        return response()->json([
            "status" => Response::HTTP_OK,
            'message' => "My posts fetched successfully",
            'data' => $posts
        ]);
    }
}
