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
        Schema::create('proc_frim_wares', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pType')->constrained('proc_types');
            $table->string('version');
            $table->string('filePath');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('proc_frim_wares');
    }
};