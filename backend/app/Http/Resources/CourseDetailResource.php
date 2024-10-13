<?php

namespace App\Http\Resources;

use App\Models\Set;
use Illuminate\Http\Request;
use App\Http\Resources\SetResource;
use Illuminate\Http\Resources\Json\JsonResource;

class CourseDetailResource extends JsonResource
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
            "slug" => $this->slug,
            "description" => $this->description,
            "is_published" => $this->is_published,
            "created_at" => $this->created_at,
            "updated_at" => $this->updated_at,
            "sets" => SetResource::collection($this->whenLoaded('sets'))
        ];
    }
}
