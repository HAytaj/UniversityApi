<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\GroupResource;
use App\Group;
use Validator;

class GroupsController extends Controller
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
         return GroupResource::collection(Group::paginate(5));
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
            'name' => 'required|max:50'
        ]);

        if ($validator->fails()) {
            return response()->json(["message"=>$validator->errors()]);
        }

        $group = new Group();
        $group->name = $request["name"];
        if($group->save())
            return new GroupResource($group);
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
        $group = Group::find($id);
        if(is_null($group)){
            return response()->json(["message"=>"Not Found"]);
        }
        return new GroupResource($group);
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
        $group = Group::find($id);

        if(is_null($group)){
            return response()->json(["message"=>"Not Found"]);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:50'
        ]);

        if ($validator->fails()) {
            return response()->json(["message"=>$validator->errors()]);
        }

        $group->name = $request["name"];
        if($group->save())
            return new GroupResource($group);
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
        $group = Group::find($id);
        if(is_null($group)){
            return response()->json(["message"=>"Not Found"]);
        }
        if($group->delete())
            return new GroupResource($group);
        else 
            return response()->json(["message"=>"Problem occured."]);
    }
}
