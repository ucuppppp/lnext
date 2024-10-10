<?php

namespace App\Http\Controllers;

use App\Models\Set;
use App\Models\Course;
use Illuminate\Http\Request;
use App\Models\Administrator;
use App\Http\Requests\StoreSetRequest;
use App\Http\Requests\UpdateSetRequest;
use Illuminate\Support\Facades\Validator;

class SetController extends Controller
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
public function store(Request $request, $slug)
{
    // Validate request
    $validator = Validator::make($request->all(), [
        "name" => "required"
    ]);

    if ($validator->fails()) {
        return response()->json([
            "status" => "error",
            "message" => "Invalid field(s) in request",
            "errors" => $validator->errors()
        ], 400);
    }

    // Check user permissions
    if (!$request->user() instanceof Administrator) {
        return response()->json([
            "status" => "insufficient_permissions",
            "message" => "Access forbidden"
        ], 403);
    }

    // Find course by slug
    $course = Course::where('slug', $slug)->first();

    if (!$course) {
        return response()->json([
            "status" => "not_found",
            "message" => "Resource not found"
        ], 404);
    }

    // Determine order
    $request["order"] = Set::where('course_id', $course->id)->count();

    // Add course_id to request
    $request['course_id'] = $course->id;

    // Create new set
    $set = Set::create($request->all());

    return response()->json([
        "status" => "success",
        "message" => "Set successfully added",
        "data" => $set->only(['name', 'order', 'id'])
    ], 201);
}


    /**
     * Display the specified resource.
     */
    public function show(Set $set)
    {
        //web-security-essentials
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Set $set)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSetRequest $request, Set $set)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, $slug, $order)
    {


        if (!$request->user() instanceof Administrator) {
            return response()->json([
                "status" => "insufficient_permissions",
                "message" => "Access forbidden"
            ], 403);
        }

        $order = htmlspecialchars($order, ENT_QUOTES, 'UTF-8');

        // Find course by slug
        $course = Course::where('slug', $slug)->first();

        if (!$course) {
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        $set = Set::where('course_id', $course->id)->where('order', $order)->first();

        if (!$set) {
            return response()->json([
                "status" => "not_found",
                "message" => "Resource not found"
            ], 404);
        }

        $set->delete();

        return \response()->json([
            "status" => "success",
            "message" => "Set successfully deleted"
        ]);
    }
}
