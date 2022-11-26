<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Services;
use Illuminate\Http\Request;
use App\Models\User;
use Session;
use Stripe;
use App\Models\OtpRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;;
use App\Traits\EmailTrait;
use App\Traits\UploadTrait;
use PDO;
use Illuminate\Support\Facades\DB;
use App\Models\Appointments;
use App\Models\Transactions;

class ServiceController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $services = Services::all();

        return $this->sendResponse($services, 'Success');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'price' => 'required',
            'description' => 'required',
            'image' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        try {
          
        DB::beginTransaction();
            
        $service = new Services();
        $service->title = isset($request->title)?$request->title:'';
        $service->price = isset($request->price)?$request->price:'';
        $service->description = isset($request->description)?$request->description:'';
        $service->image = isset($request->image)?$request->image:'';
        $service->save();

        DB::commit();

        return $this->sendResponse(null, 'Service Created Successfully');

        } catch (\Throwable $th) {
        
            DB::rollBack();

            return $this->sendError($th->getMessage(),'Error Occurred!');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $service = Services::find($id);

        return $this->sendResponse($service, 'Success');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $service = Services::find($id);

        if(!$service){

            return $this->sendError('No Service Found By this ID', 'Success');
        }

        try {
          
        DB::beginTransaction();
            
        $service->title = isset($request->title)?$request->title:$service->title;
        $service->price = isset($request->price)?$request->price:$service->price;
        $service->description = isset($request->description)?$request->description:$service->description;
        $service->image = isset($request->image)?$request->image:$service->image;
        $service->save();

        DB::commit();

        return $this->sendResponse(null, 'Service Updated Successfully!');

        } catch (\Throwable $th) {
        
            DB::rollBack();

            return $this->sendError($th->getMessage(),'Error Occurred!');
        }
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $service = Services::find($id);

        if($service){

            $service->delete();

            return $this->sendResponse(null, 'Deleted Successfully!');
      
        }else{

            return $this->sendError('No Service Found By this ID', 'Success');
        }
    }
}
