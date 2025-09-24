<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::with('User', 'Reaction', 'Comment')->get();

        $posts = PostResource::collection($posts);

        return response()->json([
            'data' => $posts
        ]);
    }

    public function reaction(Post $post, Request $request)
    {
        $request->validate([
            'type' => 'required|string|in:like,dislike'
        ]);

        if ($request->type === 'like') {
            $exist_reaction = $post->Reaction()->where('user_id', Auth::user()->id)->first();

            if (!$exist_reaction) {
                $post->Reaction()->create([
                    'user_id' => Auth::user()->id
                ]);
                $message = "Liked successfully";
            } else {
                $post->Reaction()->where('user_id', Auth::user()->id)->delete();
                $message = "Disliked successfully";
            }
        } else {
            $post->Reaction()->where('user_id', Auth::user()->id)->delete();
            $message = "Disliked successfully";
        }

        $post = PostResource::make($post);

        return response()->json([
            'message' => "Reaction {$message}",
            'data' => $post
        ]);
    }

    public function comment(Post $post, Request $request)
    {
        $request->validate([
            'content' => 'required|string'
        ]);

        $post->Comment()->create([
            'user_id' => Auth::user()->id,
            'content' => $request->content
        ]);

        $post = PostResource::make($post);

        return response()->json([
            'message' => "Commented successfully",
            'data' => $post
        ]);
    }
}
