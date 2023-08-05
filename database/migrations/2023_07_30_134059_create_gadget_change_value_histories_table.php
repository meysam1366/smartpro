<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('gadget_change_value_histories', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('gadget_id');
            $table->foreign('gadget_id')->references('gadgetId')->on('gadgets');
            $table->string('value');
            $table->datetime('timeOfChange');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('gadget_change_value_histories');
    }
};
