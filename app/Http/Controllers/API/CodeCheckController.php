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
use PDO;

class CodeCheckController extends BaseController
{
    public function __invoke(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'otp' => 'required|string|exists:otp_requests',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        // find the code
        $passwordReset = OtpRequest::firstWhere('otp', $request->otp);

        // check if it does not expired: the time is one hour
        if ($passwordReset->created_at > now()->addHour()) {
            $passwordReset->delete();
            return $this->sendError('OTP Error', "OTP is expired");
        }

        return $this->sendResponse("OTP Verified","OTP is Valid");
    }
}
