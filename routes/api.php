<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
  
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\ForgotPasswordController;
use App\Http\Controllers\API\ResetPasswordController;
use App\Http\Controllers\API\CodeCheckController;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\AppointmentController;
use App\Http\Controllers\API\NotificationController;
use App\Http\Controllers\API\PackageController;
use App\Http\Controllers\API\ReviewsController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\ServiceController;
use Illuminate\Support\Facades\Auth;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('register', [AuthController::class, 'register']);

Route::post('guest-register', [AuthController::class, 'phoneRegister']);

Route::post('login', [AuthController::class, 'login'])->name('login');

Route::post('password/email',  ForgotPasswordController::class);

Route::post('password/verify/otp', CodeCheckController::class);

Route::post('password/reset', ResetPasswordController::class);

Route::post('image/upload', [UserController::class, 'storeImages']);

Route::get('content/about', [UserController::class, 'aboutMeContent']);
     
Route::group(['middleware' => 'auth:api'], function(){

    Route::post('logout', [AuthController::class, 'logout'])->name('logout.api');

    Route::get('users', [UserController::class, 'index']);

    Route::get('me', [UserController::class, 'myProfile']);
    
    Route::get('users/{id}', [UserController::class, 'show']);

    Route::post('users/{id}/update', [UserController::class, 'update']);

    Route::post('users/{id}/update/password', [UserController::class, 'updatePassword']);

    Route::get('reviews', [ReviewsController::class, 'index']);

    Route::get('reviews/{id}', [ReviewsController::class, 'getReviewsByUserId']);

    Route::get('reviews/{id}/destroy', [ReviewsController::class, 'destroy']);
    
    Route::post('reviews', [ReviewsController::class, 'store']);

    Route::get('appointments', [AppointmentController::class, 'index']);

    Route::get('my/appointments', [AppointmentController::class, 'myAppointments']);
    
    Route::post('appointment', [AppointmentController::class, 'store']);

    Route::get('appointment/{id}', [AppointmentController::class, 'edit']);

    Route::post('appointment/{id}/destroy', [AppointmentController::class, 'destroy']);

    Route::get('pacakages', [PackageController::class, 'index']);
    
    Route::post('pacakages', [PackageController::class, 'store']);

    Route::get('pacakage/{id}', [PackageController::class, 'edit']);

    Route::post('pacakage/{id}/update', [PackageController::class, 'update']);

    Route::post('pacakage/{id}/destroy', [PackageController::class, 'destroy']);

    Route::get('services', [ServiceController::class, 'index']);
    
    Route::post('services', [ServiceController::class, 'store']);

    Route::get('service/{id}', [ServiceController::class, 'edit']);

    Route::post('service/{id}/update', [ServiceController::class, 'update']);

    Route::post('service/{id}/destroy', [ServiceController::class, 'destroy']);

    Route::get('notifications', [NotificationController::class, 'index']);

});
