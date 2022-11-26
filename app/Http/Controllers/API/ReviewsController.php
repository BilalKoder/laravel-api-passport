<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\Reviews;
use App\Models\OtpRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;;
use App\Traits\EmailTrait;
use App\Traits\UploadTrait;
use PDO;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ReviewsController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = Reviews::all();
        
        return $this->sendResponse($users,"All Reviews");
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getReviewsByUserId($id)
    {
        $reviews = Reviews::where('reviewed_to',$id)->orderBy("id","DESC")->get();
        
        return $this->sendResponse($reviews,"All Reviews");
    }

    public function store(Request $request){

        $validator = Validator::make($request->all(), [
            'star' => 'required|min:1',
            'reviewed_to' => 'required',
            'description' => 'required'
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        try {
            //code...
      
        DB::beginTransaction();
            
        $review = new Reviews;
        $review->star = $request->star;
        $review->reviewed_to = $request->reviewed_to;
        $review->reviewed_by = auth()->user()->id;
        $review->description = $request->description;
        $review->save();
      
        DB::commit();

        return $this->sendResponse(null, 'Review Posted Successfully');

        } catch (\Throwable $th) {
        
            DB::rollBack();

            return $this->sendError($th->getMessage(),'Error Occurred!');
        }
    }

    public function destroy($id)
    {
        $reviews = Reviews::find($id);

        if(!$reviews){
            return $this->sendError("Couldn't find review with id '$id'",$reviews);
        }

        $reviews->delete();
        
        return $this->sendResponse(null,"Deleted Successfully!");
    }
}
