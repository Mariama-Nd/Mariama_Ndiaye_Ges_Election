<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
{
    Schema::table('etudiants', function (Blueprint $table) {
        $table->string('telephone')->nullable();
        $table->string('email')->unique()->nullable();
    });
}

public function down()
{
    Schema::table('etudiants', function (Blueprint $table) {
        $table->dropColumn(['telephone', 'email']);
    });
}

};
