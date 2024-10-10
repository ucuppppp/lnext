<?php

namespace App\Http\Resources;

use App\Models\Option;
use Illuminate\Http\Request;
use App\Http\Resources\OptionResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ContentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $data = [
            "id" => $this->id,
            "type" => $this->type,
            "content" => $this->content,
            "order" => $this->order,
            "options" => OptionResource::collection($this->options)
        ];

        if($this->type !== 'quiz'){
            unset($data['options']);
        }

        return $data;
    }
}


