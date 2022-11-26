<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\OtpRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;;
use App\Traits\EmailTrait;
use App\Traits\UploadTrait;
use PDO;
use App\Models\Appointments;
use File;
use Illuminate\Support\Facades\Hash;

class UserController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::where('role_id', '!=', 1)->get();
        
        return $this->sendResponse($users,"All Users Listing");
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);

        if(!$user){
            return $this->sendError("Couldn't find user with id '$id'",$user);
        }
        
        return $this->sendResponse($user, "User with id '$id' has been found");
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            // 'phone' => 'required',
            'email' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        $user = User::find($id);

        if(!$user){
            return $this->sendError("Couldn't find user with id '$id'",$user);
        }

        try {
            //code...
      
        DB::beginTransaction();

        $user->full_name = isset($request->full_name)?$request->full_name:$user->full_name;
        $user->phone =  isset($request->phone)?$request->phone:$user->phone;
        $user->email =  isset($request->email)?$request->email:$user->email;
        $user->image = isset($request->image)?$request->image:$user->image;
        $user->about = isset($request->about)?$request->about:$user->about;
        $user->save();

        DB::commit();

        } catch (\Throwable $th) {
        
            DB::rollBack();

            return $this->sendError($th->getMessage(),'Error Occurred!');
        }

        return $this->sendResponse($user, "User Updated successfully!");
    }

    public function updatePassword(Request $request, $id){

        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'new_password' => 'required',
            'confirm_password' => 'required|same:new_password',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        $user = User::find($id);

        if(!$user){
            return $this->sendError("Couldn't find user with id '$id'",$user);
        }

        $current_password  = $user->password;
        
        $hashCheck = Hash::check($request->current_password, $current_password);
       
        if(!$hashCheck){
            return $this->sendError("Curent Password Does Not Match");
        }

        try{

        DB::beginTransaction();

        $updatedPassword = bcrypt($request->new_password);

        $user->password = $updatedPassword;
        $user->save();
            
        DB::commit();

        } catch (\Throwable $th) {
        
            DB::rollBack();

            return $this->sendError($th->getMessage(),'Error Occurred!');
        }

        return $this->sendResponse($user, "Password Updated Successfully!");

    }


    public function storeImages(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:25000',
        ]);
    
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        try {

            DB::beginTransaction();
     
            if ($request->hasFile('image')) {
                
                $image = $request->file('image');
    
                //store Image to directory
                $imgName = rand() . '_' . time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('uploads/profile/');
                $imagePath = $destinationPath . "/" . $imgName;
                $image->move($destinationPath, $imgName);
                $path = basename($imagePath);
                $image = 'uploads/profile/'.$path;
    
            }

            DB::commit();

            return $this->sendResponse($image, 'Images Path!');

        } catch (\Throwable $th) {

            DB::rollback();

            return $this->sendError('Error Occurred!', $th->getMessage());  
        }
    }
    public function myProfile(){

        $user = auth()->user();

        return $this->sendResponse($user, 'User Profile!');

    }

    public function aboutMeContent(){

        $content = [];

        $image = "uploads/profile/1930254936_1666348722.jfif";
        $text = "Instead of going to therapy every week for months or years. Get your answer in one day. Someone who knows it too well would not let you pay just to sit and talk about the same thing over and over. Yes, this app is not for you if you are just looking for a good listener, This is for people who want solutions right away and are ready to fully commit to assignments, right resources and complete worksheets.";

        $data = array_merge($content, array("image"=> $image,"text"=>$text));

        return $this->sendResponse($data, 'About Me Content');

    }

}
