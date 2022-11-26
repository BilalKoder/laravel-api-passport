<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAppointmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('appointments', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->unsigned();
            $table->string('patient_name')->nullable();
            $table->string('phone')->nullable();
            $table->string('amount')->nullable();
            $table->string('image')->nullable();
            $table->string('appointment_for')->nullable();
            $table->string('order_id')->nullable();
            $table->string('date')->nullable();
            $table->string('time')->nullable();
            $table->string('reminder_before')->nullable();
            $table->enum('payment_status', ['pending','paid'])->default('pending');
            $table->string('notes')->nullabe();
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
        Schema::dropIfExists('appointments');
    }
}
