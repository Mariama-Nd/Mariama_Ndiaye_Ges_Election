<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('votes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('etudiant_id')->constrained()->onDelete('cascade');
            $table->foreignId('candidat_id')->constrained()->onDelete('cascade');
            $table->date('date');
            $table->time('temps');
            $table->timestamps();

            $table->unique('etudiant_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('votes');
    }
};
