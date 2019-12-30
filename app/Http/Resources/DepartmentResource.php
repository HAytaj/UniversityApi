<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DepartmentResource extends JsonResource
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
            "type"=>"Department",
            "id"=>$this->id,
            "attributes"=>[
                "Title"=>$this->title,
                "About"=>$this->about
            ],
            "links"=>[
                "self" =>  route("departments.show",['id'=>$this->id])
            ]
        ];
    }
}
