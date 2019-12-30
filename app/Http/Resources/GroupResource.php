<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GroupResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //return parent::toArray($request);
        return [
            "type"=>"Group",
            "id"=>$this->id,
            "attributes"=>[
                "Name"=>$this->name,
            ],
            "relationships"=>[
                "all_students" => route("students.group",['id'=>$this->id]),
                "data"=>["type"=>"Student"]
            ],
            "links"=>[
                "self"=>route("groups.show",['id'=>$this->id]),
            ]
        ];
    }
}
