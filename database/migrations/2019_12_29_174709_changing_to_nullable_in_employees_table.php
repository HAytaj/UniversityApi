<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangingToNullableInEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('employees', function (Blueprint $table) {
            $table->boolean('dean_of')->nullable()->change();
            $table->string('title')->nullable()->change();
            $table->integer('department_id')->nullable()->change();
            $table->integer('manager_id')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('employees', function (Blueprint $table) {
            $table->boolean('dean_of');
            $table->string('title');
            $table->integer('department_id');
            $table->integer('manager_id');
        });
    }
}
