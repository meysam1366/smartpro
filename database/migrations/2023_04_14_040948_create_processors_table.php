<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProcessorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('processors', function (Blueprint $table) {
            $table->unsignedBigInteger('procId')->primary();
            $table->unsignedBigInteger('procType');
            $table->foreign('procType')->references('id')->on('proc_types');
            $table->string('procPassword');
            $table->string('pDavName');
            $table->string('pCustomerName')->nullable();
            $table->datetime('firstWorkDate');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('processors');
    }
}
