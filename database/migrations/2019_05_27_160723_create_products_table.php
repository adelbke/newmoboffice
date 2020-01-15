<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('reference')->unique();
            $table->unsignedBigInteger('type_id');
            $table->unsignedBigInteger('visitors')->default(0);
            $table->double('clientPrice');
            $table->double('retailerPrice');
            $table->string('name')->unique();
	    $table->boolean('new')->nullable();
            $table->string('note')->nullable();
            $table->text('description')->nullable();
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
        Schema::dropIfExists('products');
    }
}
