<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\StudentResource;
use App\Student;
use Validator;

class StudentsController extends Controller
{
    public function __construct(){
        $this->middleware("auth:api")->except("index","show","group");
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id = null)
    {
        return StudentResource::collection(Student::paginate(5));
    }
/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function group($id)
    {
        $students = Student::where("group_id","=",$id)->get();

        if(is_null($students)){
            return response()->json(["message"=>"Not Found"],404);
        }

        return StudentResource::collection($students);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|max:50',
            'surname' => 'required|max:50',
            'patronymic' => 'required|max:50',
            'email' => 'required',
            'phone' => 'required',
            'date_of_birth' => 'required',
            'group_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(["message"=>$validator->errors()]);
        }
        $student = new Student();
        $student->name = $request["name"];
        $student->surname = $request["surname"];
        $student->patronymic = $request["patronymic"];
        $student->email = $request["email"];
        $student->phone = $request["phone"];
        $student->date_of_birth = $request["date_of_birth"];
        $student->group_id = $request["group_id"];

        if($student->save())
            return new StudentResource($student);
        else 
            return response()->json(["message"=>"Problem occured."]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $student = Student::find($id);

        if(is_null($student)){
            return response()->json(["message"=>"Not Found"],404);
        }

        return new StudentResource($student);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $student = Student::find($id);

        if(is_null($student)){
            return response()->json(["message"=>"Not Found"],404);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:50',
            'surname' => 'required|max:50',
            'patronymic' => 'required|max:50',
            'email' => 'required',
            'phone' => 'required',
            'date_of_birth' => 'required',
            'group_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(["message"=>$validator->errors()]);
        }
        $student->name = $request["name"];
        $student->surname = $request["surname"];
        $student->patronymic = $request["patronymic"];
        $student->email = $request["email"];
        $student->phone = $request["phone"];
        $student->date_of_birth = $request["date_of_birth"];
        $student->group_id = $request["group_id"];

        if($student->save())
            return new StudentResource($student);
        else 
            return response()->json(["message"=>"Problem occured."]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $student = Student::find($id);

        if(is_null($student)){
            return response()->json(["message"=>"Not Found"],404);
        }
        if($student->delete())
            return new StudentResource($student);
        else 
            return response()->json(["message"=>"Problem occured."]);
    }
}
