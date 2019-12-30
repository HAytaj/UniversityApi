<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
// use App\Http\Resources\EmployeeRelationshipResource;

class EmployeeResource extends JsonResource
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
            "type"=>"Employee",
            "id" => $this->id,
            "attributes"=>[
                "Name"=>$this->name,
                "Surname"=>$this->surname,
                "Patronymic"=>$this->patronymic,
                "Email_Address"=>$this->email,
                "Birth_Date"=>$this->date_of_birth,
                "Title"=>$this->title
            ],
            "relationships"=>$this->when($this->department_id != null && $this->manager_id != null,new EmployeeRelationshipsResource($this)),
            "links"=>[
                "self" =>  route("employees.show",['id'=>$this->id])
            ]
        ];
    }
}
