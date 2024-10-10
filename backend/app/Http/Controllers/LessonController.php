<?php

namespace App\Http\Controllers;

use App\Models\Lesson;
use Illuminate\Http\Request;
use App\Models\Administrator;
use App\Http\Requests\StoreLessonRequest;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\UpdateLessonRequest;
use App\Models\CompletedLesson;
use App\Models\Course;
use App\Models\Enrollment;
use App\Models\LessonContent;
use App\Models\Option;
use PhpParser\Node\Expr\Cast\Object_;
use Spatie\FlareClient\Http\Exceptions\NotFound;

class LessonController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!$request->user() instanceof Administrator) {
            return response()->json(['status' => 'insufficient_permissions', 'message' => 'Access forbidden'], 403);
        }

        // Validation
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'set_id' => 'required|exists:sets,id',
            'contents' => 'required|array',
            'contents.*.type' => 'required|in:learn,quiz',
            'contents.*.content' => 'required|string',
            'contents.*.options' => function ($attribute, $value, $fail) use ($request) {
                if ($request->input(str_replace('options', 'type', $attribute)) === 'quiz') {
                    if (empty($value)) return $fail('Options are required if type is quiz.');
                    foreach ($value as $option) {
                        if (empty($option['option_text']) || !isset($option['is_correct'])) return $fail('Option text and is_correct are required.');
                        if (!is_bool($option['is_correct'])) return $fail('Is correct must be a boolean.');
                    }
                }
            },
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => 'Invalid field(s) in request', 'errors' => $validator->errors()], 400);
        }

        // Create lesson
        $lesson = Lesson::create([
            'name' => $request->input('name'),
            'set_id' => $request->input('set_id'),
            'order' => Lesson::where('set_id', $request->input('set_id'))->count(),
        ]);

        // Create contents and options
        foreach ($request->input('contents') as $content) {
            $lessonContent = LessonContent::create([
                'type' => $content['type'],
                'content' => $content['content'],
                'lesson_id' => $lesson->id
            ]);

            // Only add options if type is quiz
            if ($content['type'] === 'quiz') {
                foreach ($content['options'] as $option) {
                    Option::create([
                        'lesson_content_id' => $lessonContent->id, // Ensure relation with lesson content
                        'option_text' => $option['option_text'],
                        'is_correct' => $option['is_correct']
                    ]);
                }
            }
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Lesson successfully added',
            'data' => $lesson->only(['name', 'order', 'id'])
        ], 201);
    }



    /**
     * Display the specified resource.d
     */
    public function check(Request $request, $ls_id, $content_id)
    {

        if (!$request->user() instanceof Administrator) {
            return response()->json([
                "status" => "insufficient_permissions",
                "message" => "Access forbidden"
            ], 403);
        }

        $validator = Validator::make($request->all(), [
            "option_id" => "required"
        ]);

        if ($validator->fails()) {
            return response()->json([
                "status" => "error",
                "message" => "Invalid field(s) in request",
                "errors" => $validator->errors()
            ], 400);
        }

        $lesson_content = LessonContent::find($ls_id)->first();
        $option = Option::where('id', $request['option_id'])->first();

        if (!$lesson_content) {
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        if (!$option) {
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }
    }

    public function checkquiz(Request $request, $ls_id)
    {
        $validator = Validator::make($request->all(), [
            "option_id" => "required"
        ]);

        if ($validator->fails()) {
            return response()->json([
                "status" => "error",
                "message" => "Invalid field(s) in request",
                "errors" => $validator->errors()
            ], 400);
        }

        $lesson_content = LessonContent::where('id', $ls_id)->first();

        if ($lesson_content->type !== 'quiz') {
            return \response()->json([
                "status" => "error",
                "message" => "Only for quiz content"
            ], 400);
        }

        $option = Option::where('id', $request['option_id'])->where('lesson_content_id', $lesson_content->id)->first();


        if (!$lesson_content) {
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        if (!$option) {
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        return \response()->json([
            "status" => "success",
            "message" => "Check answer success",
            "data" => [
                "question" => $lesson_content->content,
                "user_answer" => $option->option_text,
                "is_correct" => $option->is_correct
            ]
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Lesson $lesson) {}

    /**
     * Update the specified resource in storage.
     */
    public function complete(Request $request, $id)
    {
        $user = $request->user();

        // Cari pelajaran berdasarkan ID dan ambil juga relasi Set dan Course
        $lesson = Lesson::with('set.course')->find($id);

        if (!$lesson) {
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        // Dapatkan course_id dari relasi pelajaran dengan set dan kursus
        $courseId = $lesson->set->course->id;


        // Cek apakah user terdaftar di kursus yang berhubungan dengan pelajaran ini
        $enrollment = Enrollment::where('user_id', $user->id)
            ->where('course_id', $courseId)
            ->first();

        if (!$enrollment) {
            // return response()->json([
            //     "status" => "insufficient_permissions",
            //     "message" => "Access forbidden"
            // ], 403);
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        // Cek apakah pelajaran sudah diselesaikan oleh user
        $completedLesson = CompletedLesson::where('user_id', $user->id)
            ->where('lesson_id', $lesson->id)
            ->first();

        if ($completedLesson) {
            return response()->json([
                "status" => "success",
                "message" => "Lesson already completed"
            ]);
        }

        // Simpan pelajaran yang sudah diselesaikan
        CompletedLesson::create([
            "user_id" => $user->id,
            "lesson_id" => $lesson->id
        ]);

        return response()->json([
            "status" => "success",
            "message" => "Lesson successfully completed"
        ]);
    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, $id)
    {
        if (!$request->user() instanceof Administrator) {
            return response()->json(['status' => 'insufficient_permissions', 'message' => 'Access forbidden'], 403);
        }

        $lesson = Lesson::where('id', $id)->first();

        if (!$lesson) {
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        $lesson->delete();

        return \response()->json([
            "status" => "success",
            "message" => "Lesson successfully deleted"
        ]);
    }
}
