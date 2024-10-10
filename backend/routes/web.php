<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return response()->json([
        "data" => "add the /api in url, /api/courses"
    ]);
});

Route::get('/{whatever}', function () {
    return response()->json([
        "data" => "i think this is not the page that you want!"
    ]);
});

Route::get('/{whatever}/{whatever2}', function () {
    return response()->json([
        "data" => "are you stupid or what?"
    ]);
});

Route::get('/{whatever}/{whatever2}/{asdfasd}', function () {
    return response()->json([
        "data" => "where the fuck are you goin on bitch?"
    ]);
});
