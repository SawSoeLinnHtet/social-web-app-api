<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function Posts()
    {
        return $this->hasMany(Post::class);
    }

    public function Reactions()
    {
        return $this->hasMany(Reaction::class);
    }

    public function Comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function getPostCountAttribute()
    {
        return $this->Posts()->count();
    }

    public function reactionsOnMyPosts()
    {
        return Reaction::whereIn('post_id', $this->posts()->pluck('id'));
    }

    public function commentsOnMyPosts()
    {
        return Comment::whereIn('post_id', $this->posts()->pluck('id'));
    }

    public function getReactionCountAttribute()
    {
        return $this->reactionsOnMyPosts()->count();
    }

    public function getCommentCountAttribute()
    {
        return $this->commentsOnMyPosts()->count();
    }
}
