<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Set extends Model
{
    use HasFactory;

    protected $guarded = ['id'];
    // protected $hidden = ['course];

    public function course(){
        return $this->belongsTo(Course::class, 'course_id', 'id');
    }

    public function lessons(){
        return $this->hasMany(Lesson::class);
    }

}
