<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\CommentResource;

class PostResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'post_info' => $this->only('id', 'title', 'content', 'content_image', 'created_at'),
            'author_info' => $this->User,
            'reaction_count' => $this->ReactionCount,
            'comment_count' => $this->CommentCount,
            'user_liked' => $this->UserLiked,
            'comments' => CommentResource::collection($this->Comment),
        ];
    }
}
