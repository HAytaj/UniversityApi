<?php

namespace App;
use App\Group;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $fillable = ["name","surname","patronymic","email","phone","date_of_birth","group_id"];

    public function group(){
        return $this->belongsTo(Group::class);
    }
}
