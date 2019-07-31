<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('types', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('Name');
            $table->enum("Category",['Meuble de Bureau','Fauteuil et Siège','Mobilier de Réunion','Mobilier Accueil','Mobilier de Conférence','Bibliothèque & mobilier pour écoles et crèches','Environnement & Accéssoires']);
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
        Schema::dropIfExists('types');
    }
}
