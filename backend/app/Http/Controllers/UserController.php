<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\ProgressResource;

class UserController extends Controller
{

    public function progress(Request $request){

        $user = $request->user();


        return \response()->json([
            "status" => "success",
            "message" => "User progress retrieved successfully",
            "data" => [
                "progress" => new ProgressResource($user)
            ]
        ]);

    }

}
