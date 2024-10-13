<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Administrator;
use App\Models\User;

class AuthResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // Membuat array hasil
        $data = [
            // Tambahkan full_name hanya jika resource adalah instance dari User
            'id' => $this->id,
            'full_name' => $this->resource instanceof User ? $this->full_name : null, // Default null jika bukan User
            'username' => $this->username,
            'updated_at' => $this->updated_at,
            'created_at' => $this->created_at,
            'token' => $this->createToken('auth_token')->plainTextToken,
            'role' => $this->resource instanceof Administrator ? 'admin' : 'user',
        ];

        // Hapus full_name jika bukan instance dari User
        if (!($this->resource instanceof User)) {
            unset($data['full_name']);
        }

        return $data;
    }
}
