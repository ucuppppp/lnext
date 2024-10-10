<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SetController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\LessonController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware(['auth:sanctum'])->group(function () {
    // AUTH
    Route::post('/logout', [AuthController::class, 'logout']);

    // ------ COURSES START ------
    Route::get('/courses', [CourseController::class, 'index']);
    Route::post('/courses', [CourseController::class, 'store']);
    Route::get('/courses/{slug}', [CourseController::class, 'show']);
    Route::put('/courses/{slug}', [CourseController::class, 'edit']);
    Route::delete('/courses/{slug}', [CourseController::class, 'destroy']);
    // ------ COURSES END ------

    // ------ SET START ------
    Route::post('/courses/{slug}/sets', [SetController::class, 'store']);
    Route::delete('/courses/{slug}/sets/{order}', [SetController::class, 'destroy']);
    // ------ SET END ------

    // ------ LESSON START ------
    Route::post('/lessons', [LessonController::class, 'store']);
    Route::delete('/lessons/{id}', [LessonController::class, 'destroy']);
    // LEARN
    Route::post('/lessons/{ls_id}/contents/{content_id}/check', [LessonController::class, 'check']);
    // QUIZ
    Route::post('/lesson-contents/{ls_id}/check', [LessonController::class, 'checkquiz']);
    Route::put('/lessons/{id}/complete', [LessonController::class, 'complete']);
    // ------ LESSON END ------

    // ------ USER START ------
    Route::post('/courses/{slug}/register', [CourseController::class, 'register']);
    Route::get('/users/progress', [UserController::class, 'progress']);
    // ------ USER END ------

});

// Auth
Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
