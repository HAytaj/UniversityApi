<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\EmployeeResource;
use App\Employee;
use Validator;

class EmployeesController extends Controller
{

    public function __construct(){
        $this->middleware("auth:api")->except("index","show");
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return EmployeeResource::collection(Employee::paginate(5));
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
            'title' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(["message"=>$validator->errors()]);
        }
        $emp = new Employee();
        $emp->name = $request["name"];
        $emp->surname = $request["surname"];
        $emp->patronymic = $request["patronymic"];
        $emp->email = $request["email"];
        $emp->phone = $request["phone"];
        $emp->date_of_birth = $request["date_of_birth"];
        $emp->title = $request["title"];
        $emp->dean_of = $request["dean_of"];
        $emp->manager_id = $request["manager_id"];
        $emp->department_id = $request["department_id"];

        if($emp->save())
            return new EmployeeResource($emp);
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
        $emp = Employee::find($id);
        if(is_null($emp)){
            return response()->json(["message"=>"Not Found"],404);
        }
        return new EmployeeResource($emp);
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
        $emp = Employee::find($id);
        if(is_null($emp)){
            return response()->json(["message"=>"Not Found"],404);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required|max:50',
            'surname' => 'required|max:50',
            'patronymic' => 'required|max:50',
            'email' => 'required',
            'phone' => 'required',
            'date_of_birth' => 'required',
            'title' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(["message"=>$validator->errors()]);
        }
        $emp->name = $request["name"];
        $emp->surname = $request["surname"];
        $emp->patronymic = $request["patronymic"];
        $emp->email = $request["email"];
        $emp->phone = $request["phone"];
        $emp->date_of_birth = $request["date_of_birth"];
        $emp->title = $request["title"];
        $emp->dean_of = $request["dean_of"];
        $emp->manager_id = $request["manager_id"];
        $emp->department_id = $request["department_id"];

        if($emp->save())
            return new EmployeeResource($emp);
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
        
        $emp = Employee::find($id);
        if(is_null($emp)){
            return response()->json(["message"=>"Not Found"],404);
        }
        if($emp->delete())
            return new EmployeeResource($emp);
        else 
            return response()->json(["message"=>"Problem occured."]);
    }
}
