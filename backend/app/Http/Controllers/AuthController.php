<?php

namespace App\Http\Controllers;

use App\Http\Resources\AuthResource; // Mengimpor resource dengan namespace
use App\Models\Administrator;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function login(Request $request){
        $validator = Validator::make($request->all(), [
            "username" => "required",
            "password" => "required",
        ]);

        if($validator->fails()){
            $errors = \implode('|', $validator->errors()->all());
            return \response()->json([
                "status" => "authentication_failed",
                "message" => $errors
            ], 400);
        }

        // Autentikasi User dan Admin
        $user = User::where('username', $request->username)->first();

        if ($user && Hash::check($request->password, $user->password)) {
            return response()->json([
                "status" => "success",
                "message" => "Login successful",
                "data" => new AuthResource($user)
            ]);
        }

        $admin = Administrator::where('username', $request->username)->first();

        if ($admin && Hash::check($request->password, $admin->password)) {
            return response()->json([
                "status" => "success",
                "message" => "Login successful",
                "data" => new AuthResource($admin)
            ]);
        }

        return response()->json([
            "status" => "authentication_failed",
            "message" => "The username or password you entered is incorrect"
        ], 401);
    }

    public function register(Request $request){
        $validator = Validator::make($request->all(), [
            "full_name" => "required",
            'username' => 'required|min:3|unique:users|unique:administrators,username|regex:/^[\w.]+$/',
            'password' => 'required|min:6'
        ]);

        if ($validator->fails()) {
            return \response()->json([
                "status" => "error",
                "message" => "Invalid field(s) in request",
                "errors" => $validator->errors()
            ], 400);
        }


        $request['password'] = Hash::make($request->password);

        $user = User::create($request->only(['password', 'full_name', 'username']));

        return \response()->json([
            "status" => "success",
            "message" => "User registration successful",
            "data" => new AuthResource($user)
        ], 201);
    }

    public function logout(Request $request){
        $user = $request->user();

        $token = $user->currentAccessToken()->delete();

        return \response()->json([
            "status" => "success",
            "message" => "Logout successful"
        ]);
    }



}
