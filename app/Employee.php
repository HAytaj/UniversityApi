<?php

namespace App;
use App\Department;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $fillable = ["name","surname","patronymic","email","phone","date_of_birth","dean_of","title","department_id","manager_id"];

    public function department(){
        return $this->belongsTo(Department::class);
    }
    public function manager(){
        return $this->belongsTo(Employee::class,"manager_id");
    }
}
