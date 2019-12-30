<?php

namespace App\Http\Resources;
use App\Employee;
use Illuminate\Http\Resources\Json\JsonResource;

class EmployeeRelationshipsResource extends JsonResource
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
            "department"=>[
                "Dean"=>$this->when(!is_null($this->dean_of),"True"),

                "Department"=>$this->when(!is_null($this->department_id),function(){return $this->department->name;}),

                "Details" => $this->when(!is_null($this->department_id),function(){return route("departments.show",["id"=>$this->department_id]);}),

                "data"=> [
                    "type" => "Department",
                    "id" =>$this->when(!is_null($this->department_id),function(){return $this->department_id;})
                ]
                ],
            "manager"=>[
                "Manager"=>$this->when(!is_null($this->manager_id),function(){return $this->fullName($this);}),

                "Details"=>$this->when(!is_null($this->manager_id),function(){return route("employees.show",["id"=>$this->manager_id]);}),

                "data"=> [
                    "type" => "Employee",
                    "id" => $this->when(!is_null($this->manager_id),function(){return $this->manager_id;})
                ]
            ]
            
        ];
        
    }

    function fullName($request)
    {
        return $this->manager->name." ".$this->manager->surname." ".$this->manager->patronymic;
    }
}
