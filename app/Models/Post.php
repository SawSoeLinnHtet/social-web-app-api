<?php

namespace App\Models;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    
    protected $guarded = [];

    protected $casts = [
        'created_at' => 'datetime:diffForHumans',
        'updated_at' => 'datetime:diffForHumans',
    ];

    protected $appends = ['created_ago', 'updated_ago'];

    public function getCreatedAgoAttribute() {
        return $this->created_at->diffForHumans();
    }
    
    public function getUpdatedAgoAttribute() {
        return $this->updated_at->diffForHumans();
    }

    public function getReactionCountAttribute()
    {
        return $this->Reaction()->count();
    }

    public function getCommentCountAttribute()
    {
        return $this->Comment()->count();
    }

    public function User()
    {
        return $this->belongsTo(User::class);
    }

    public function Reaction()
    {
        return $this->hasMany(Reaction::class);
    }

    public function Comment()
    {
        return $this->hasMany(Comment::class);
    }
}
