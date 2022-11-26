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
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class AuthController extends BaseController
{

    use EmailTrait, UploadTrait;
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }

        try {
            //code...

            DB::beginTransaction();

            $input = $request->all();

            $input['password'] = bcrypt($input['password']);
            $input['image'] = isset($input['image']) ? $input['image'] : '';
            $input['about'] = isset($input['about']) ? $input['about'] : '';
            $input['identity_token'] = Str::random(12, 'alphaNum');
            $user = User::create($input);
            $success['user_id'] =  $user->id;
            $success['full_name'] =  $user->full_name;

            DB::commit();

            return $this->sendResponse($success, 'User Registered Successfully');
        } catch (\Throwable $th) {

            DB::rollBack();

            return $this->sendError($th->getMessage(), 'Error Occurred!');
        }
    }

    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $user = User::where('email', $request->email)->where('is_active', 0)->first();

        if ($user) {
            return $this->sendError('User Inactivae', "Your Account has been deactivated. Please Contact your administrator");
        }

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {

            $user = Auth::user();
            $success['token'] =  $user->createToken('MyApp')->accessToken;
            $success['user'] =  auth()->user();

            return $this->sendResponse($success, 'User logged-in successfully.');
        } 
        else {

            return $this->sendError('Unauthorised.', ['error' => 'Invalid Credentials!']);
        }
    }

    public function phoneRegister(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'phone' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }

        try {
            //code...

            DB::beginTransaction();

            $user = User::where('phone', $request->phone)->first();

            if (!$user) {
                $randomNumbers = rand(pow(10, 5 - 1), pow(10, 5) - 1);
                $email = "guest-{$randomNumbers}@guest.com";
                $password = "anonymousUser123";

                $input = $request->all();

                $input['password'] = bcrypt($password);
                $input['full_name'] = "Guest{$randomNumbers}";
                $input['email'] = $email;
                $input['phone'] = $request->phone;
                $input['about'] = "anonymous";
                $input['identity_token'] = Str::random(12, 'alphaNum');

                $new_user = User::create($input);
                $success['user_id'] =  $new_user->id;
                $success['full_name'] =  $new_user->full_name;
                $success['user'] = Auth::loginUsingId($new_user->id);

                $success['token'] =  $new_user->createToken('MyApp')->accessToken;

                DB::commit();

               return $this->sendResponse($success, 'Guest User Registered Successfully.');

            }

            $success['user']  = Auth::loginUsingId($user->id);

            $success['token'] =  $user->createToken('MyApp')->accessToken;

            return $this->sendResponse($success, 'Guest User logged-in successfully.');
        
        } catch (\Throwable $th) {

            DB::rollBack();

            return $this->sendError($th->getMessage(), 'Error Occurred!');
        }
    }


    public function logout(Request $request)
    {

        $token = $request->user()->token();
        $token->revoke();
        $response = 'You have been successfully logged out!';
        return $this->sendResponse($response, 'Successfully logged out!');
    }
}
