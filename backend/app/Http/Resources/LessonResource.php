<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use App\Http\Resources\ContentResource;
use Illuminate\Http\Resources\Json\JsonResource;

class LessonResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "order" => $this->order,
            // "created_at" => $this->created_at,
            // "updated_at" => $this->updated_at,
            "contents" => ContentResource::collection($this->contents),
        ];
    }
}
