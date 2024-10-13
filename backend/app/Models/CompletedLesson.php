<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompletedLesson extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function lesson(){
        return $this->belongsTo(Lesson::class);
    }

}
