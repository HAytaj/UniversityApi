<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Department;
use App\Http\Resources\DepartmentResource;

class DepartmentsController extends Controller
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
        return DepartmentResource::collection(Department::paginate(5));
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),
        [
            "name:required",
            "about:required"
        ]
        
        );
        if($validator->fails()){
            return response()->json(["message"=>$validator->errors()]);
        }

        $dep = new Department();
        $dep->name = $request["name"];
        $dep->about = $request["about"];

        if($dep->save()){
            return new DepartmentResource($dep);
        }else{
            return response()->json(["message"=>"Problem occured."]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $dep = Department::find($id);

        if(is_null($dep)){
            return response()->json(["message"=>"Not Found"],404);
        }

        return new DepartmentResource($dep);
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
        $dep = Department::find($id);

        if(is_null($dep)){
            return response()->json(["message"=>"Not Found"],404);
        }
        $validator = Validator::make($request->all(),
        [
            "name:required",
            "about:required"
        ]
        
        );
        if($validator->fails()){
            return response()->json(["message"=>$validator->errors()]);
        }

        $dep->name = $request["name"];
        $dep->about = $request["about"];

        if($dep->save()){
            return new DepartmentResource($dep);
        }else{
            return response()->json(["message"=>"Problem occured."]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dep = Department::find($id);

        if(is_null($dep)){
            return response()->json(["message"=>"Not Found"],404);
        }

        if($dep->delete()){
            return new DepartmentResource($dep);
        }else{
            return response()->json(["message"=>"Problem occured."]);
        }
    }
}
