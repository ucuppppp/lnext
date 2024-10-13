<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Set;
use App\Models\LessonContent;

class Lesson extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function set(){
        return $this->belongsTo(Set::class, 'set_id', 'id');
    }

    public function contents(){
        return $this->hasMany(LessonContent::class);
    }



}
