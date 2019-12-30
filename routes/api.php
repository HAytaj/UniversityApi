<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Group
Route::get("/groups","GroupsController@index");
Route::post("/groups","GroupsController@store");
Route::get("/groups/{id}","GroupsController@show")->name("groups.show");
Route::put("/groups/{id}","GroupsController@update");
Route::delete("/groups/{id}","GroupsController@destroy");


// Group
Route::get("/students","StudentsController@index");
Route::get("/students/group/{id}","StudentsController@group")->name("students.group");
Route::post("/students","StudentsController@store");
Route::get("/students/{id}","StudentsController@show")->name("students.show");
Route::put("/students/{id}","StudentsController@update");
Route::delete("/students/{id}","StudentsController@destroy");

// Employee
Route::get("/employees","EmployeesController@index");
Route::post("/employees","EmployeesController@store");
Route::get("/employees/{id}","EmployeesController@show")->name("employees.show");
Route::put("/employees/{id}","EmployeesController@update");
Route::delete("/employees/{id}","EmployeesController@destroy");

// Department
Route::get("/departments","DepartmentsController@index");
Route::post("/departments","DepartmentsController@store");
Route::get("/departments/{id}","DepartmentsController@show")->name("departments.show");
Route::put("/departments/{id}","DepartmentsController@update");
Route::delete("/departments/{id}","DepartmentsController@destroy");

