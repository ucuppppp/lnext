<?php

namespace App\Http\Controllers;

use App\Models\Course;
use Illuminate\Http\Request;
use App\Http\Requests\StoreCourseRequest;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\UpdateCourseRequest;
use App\Http\Resources\CourseDetailResource;
use App\Models\Administrator;
use App\Models\Enrollment;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return \response()->json([
            "status" => "success",
            "message" => "Courses retrieved successfully",
            "data" => [
                "courses" => Course::all()
            ]
        ], 200);
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
            return \response()->json([
                "status" => "insufficient_permissions",
                "message" => "Access forbidden"
            ], 403);
        }

        $validator = Validator::make($request->all(), [
            "name" => "required",
            "description" => "nullable",
            "slug" => "required|unique:courses",
        ]);

        if ($validator->fails()) {
            return \response()->json([
                "status" => "error",
                "message" => "Invalid field(s) in request",
                "errors" => $validator->errors()
            ], 400);
        }

        return \response()->json([
            "status" => "success",
            "message" => "Course successfully added",
            "data" => Course::create($request->all())
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($slug)
    {
        $course = Course::with('sets.lessons.contents')->where('slug', $slug)->first();

        if (!$course) {
            return \response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        return response()->json([
            "status" => "success",
            "message" => "Course details retrieved successfully",
            "data" => new CourseDetailResource($course)
        ]);
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, $slug)
    {

        $validator = Validator::make($request->all(), [
            "name" => "required",
            "description" => "nullable",
            "is_published" => "nullable|boolean",
        ]);

        if ($validator->fails()) {
            return \response()->json([
                "status" => "error",
                "message" => "Invalid field(s) in request",
                "errors" => $validator->errors()
            ], 400);
        }

        if (!$request->user() instanceof Administrator) {
            return \response()->json([
                "status" => "insufficient_permissions",
                "message" => "Access forbidden"
            ], 403);
        }

        $course = Course::where('slug', $slug)->first();

        if (!$course) {
            return \response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        $course->update($request->all());

        return response()->json([
            "status" => "success",
            "message" => "Course successfully updated",
            "data" => $course
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function register(Request $request, $slug)
    {
        // Dapatkan pengguna yang sedang login
        $user = $request->user();

        // Cari course berdasarkan slug
        $course = Course::where('slug', $slug)->first();

        // Jika course tidak ditemukan, return response 404
        if (!$course) {
            return \response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        // Cek apakah user sudah terdaftar di kursus
        $enrollment = Enrollment::where('user_id', $user->id)
            ->where('course_id', $course->id)
            ->first();

        // Jika sudah terdaftar, return response error
        if ($enrollment) {
            return response()->json([
                "status" => "error",
                "message" => "The user is already registered for this course"
            ], 400);
        }

        // Jika belum terdaftar, daftarkan user ke kursus
        Enrollment::create([
            "user_id" => $user->id,
            "course_id" => $course->id
        ]);

        // Return response sukses
        return response()->json([
            "status" => "success",
            "message" => "User registered successful"
        ], 201);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, $slug)
    {

        if (!$request->user() instanceof Administrator) {
            return \response()->json([
                "status" => "insufficient_permissions",
                "message" => "Access forbidden"
            ], 403);
        }

        $course = Course::where('slug', $slug)->first();

        if (!$course) {
            return \response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        $course->delete();

        return \response()->json([
            "status" => "success",
            "message" => "Course successfully deleted"
        ]);
    }
}
