<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\OtpRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;;
use App\Traits\EmailTrait;
use App\Traits\UploadTrait;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendCodeResetPassword;

class ForgotPasswordController extends BaseController
{
    public function __invoke(Request $request)
    {
        
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        $data = $request->all();

        // Delete all old code that user send before.
        OtpRequest::where('email', $request->email)->delete();

        // Generate random code
        $data['otp'] = mt_rand(100000, 999999);

        // Create a new code
        $codeData = OtpRequest::create($data);

        // Send email to user
        Mail::to($request->email)->send(new SendCodeResetPassword($codeData->otp));

        return $this->sendResponse($codeData, "OTP Request Sent to Email",200);
    }
}
