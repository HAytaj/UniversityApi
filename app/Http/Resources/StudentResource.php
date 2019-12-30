<?php

namespace App\Http\Resources;
use Auth;
use Illuminate\Http\Resources\Json\JsonResource;
// use App\Group;

class StudentResource extends JsonResource
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
            "type" => "Student",
            "id"   => $this->id,
            "attributes" => [

                'Name'=> $this->name,
                'Surname'=> $this->surname,
                'Patronymic'=> $this->patronymic,
                'Email_Address'=> $this->email,
                "Birth_Date"=>$this->date_of_birth,
            ],
            'relationships' =>[
                'Group_Information'=>new StudentRelationshipsResource($this),
                "data"=>[
                    "type"=>"Group",
                    "id"=>$this->group_id
                ]
                    
            ],
            "links"=>[
                "self" =>  route("students.show",['id'=>$this->id])
            ]
        ];
    }
}
