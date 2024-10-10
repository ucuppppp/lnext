<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Course extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function sets(): HasMany
    {
        return $this->hasMany(Set::class);
    }

    public function enrollments(){
        return $this->hasMany(Enrollment::class);
    }

}
