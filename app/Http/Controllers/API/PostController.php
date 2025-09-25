<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::with('User', 'Reaction', 'Comment')->orderBy('created_at', 'desc')->get();

        $posts = PostResource::collection($posts);

        return response()->json([
            "status" => Response::HTTP_OK,
            'data' => $posts
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'content' => 'required|string',
            'content_image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ]);

        $post = Post::create([
            'title' => substr($request->content, 0, 50) . (strlen($request->content) > 50 ? '...' : ''),
            'content' => $request->content,
            'user_id' => Auth::user()->id,
            // 'content_image' => $request->file('content_image')
        ]);

        $post = PostResource::make($post);

        return response()->json([
            "status" => Response::HTTP_OK,
            'message' => "Post created successfully",
            'data' => $post
        ]);
    }

    public function update(Post $post, Request $request)
    {        
        $request->validate([
            'content' => 'required|string',
            'content_image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ]);

        if ($post->user_id === Auth::user()->id) {

            $data = [
                'title' => $request->content,
                'content' => $request->content,
            ];

            dd($data);

            $post->update($data);

            $post = PostResource::make($post);

            return response()->json([
                "status" => Response::HTTP_OK,
                'message' => "Post updated successfully",
                'data' => $post
            ]);
        } 

        return response()->json([
            "status" => Response::HTTP_FORBIDDEN,
            'message' => "You are not authorized to update this post",
        ]);
    }

    public function delete(Post $post)
    {
        if ($post->user_id === Auth::user()->id) {
            $post->delete();

            return response()->json([
                "status" => Response::HTTP_OK,
                'message' => "Post deleted successfully",
            ]);
        }

        return response()->json([
            "status" => Response::HTTP_FORBIDDEN,
            'message' => "You are not authorized to delete this post",
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
            "status" => Response::HTTP_OK,
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
            "status" => Response::HTTP_OK,
            'message' => "Commented successfully",
            'data' => $post
        ]);
    }
}
