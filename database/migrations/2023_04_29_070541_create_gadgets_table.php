<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGadgetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gadgets', function (Blueprint $table) {
            $table->unsignedBigInteger('gadgetId')->primary();
            $table->unsignedBigInteger('procId');
            $table->foreign('procId')->references('procId')->on('processors');
            $table->unsignedBigInteger('gadgetType');
            $table->foreign('gadgetType')->references('id')->on('gadget_types');
            $table->string('gDavName')->nullable();
            $table->string('gCustomerName')->nullable();
            $table->integer('lastValue')->default(0)->nullable();
            $table->string('status')->default('active')->nullable();
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
        Schema::dropIfExists('gadgets');
    }
}
