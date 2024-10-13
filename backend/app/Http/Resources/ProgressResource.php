<?php

namespace App\Http\Resources;

use App\Models\Course;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProgressResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *U
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // Ambil semua course_id dari enrollments (kursus yang diikuti)
        $enrolledCourseIds = $this->enrollments->pluck('course_id')->toArray();

        // Ambil semua course sekaligus
        $courses = Course::with('sets.lessons')->whereIn('id', $enrolledCourseIds)->get()->keyBy('id');

        $data = [];

        // Loop untuk setiap course yang diikuti
        foreach ($enrolledCourseIds as $courseId) {
            // Pastikan kursus ada
            if(!$courses[$courseId]) continue; // Skip jika kursus tidak ditemukan

            $course = $courses[$courseId];

            // Ambil semua completed lessons yang terkait dengan course ini
            $completedLessons = $this->completedLessons->filter(function ($completedLesson) use ($course) {
                return $course->sets->pluck('lessons')->flatten()->contains('id', $completedLesson->lesson_id);
            });

            // Format completed lessons sesuai dengan yang diinginkan
            $completedLessonsData = $completedLessons->map(function ($completedLesson) {
                return $completedLesson->lesson->only('id', 'name', 'order');
            });

            // Masukkan course dan completed lessons ke dalam array data
            $data[] = [
                'course' => $course->only(['id', 'name', 'slug', 'description', 'is_published', 'created_at', 'updated_at']),
                'completed_lessons' => $completedLessonsData->toArray(),
            ];
        }

        return $data;
    }



}
