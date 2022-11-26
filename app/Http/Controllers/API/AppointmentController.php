<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
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
use App\Models\Notifications;

class AppointmentController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $appointments = Appointments::orderBy('id', 'DESC')->get();

        return $this->sendResponse($appointments, 'Success');
    }


     /**
     * Display a listing of My appointments.
     *
     * @return \Illuminate\Http\Response
     */
    public function myAppointments()
    {
        $appointments = Appointments::where('user_id',auth()->user()->id)->orderBy('id', 'DESC')->get();

        return $this->sendResponse($appointments, 'Success');
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
            'patient_name' => 'required',
            'stripe_token' => 'required',
            'phone' => 'required',
            'amount' => 'required',
            'date' => 'required',
            'time' => 'required',
            'reminder_before' => 'required',
            'appointment_for' => 'required',
            'package_id' => 'required',
            // 'service_id' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        $checkIfAppointmentBooked = Appointments::where('date', '=', $request->date)
        ->where('time', '=', $request->time)
        ->exists();
        
        if($checkIfAppointmentBooked){
            return $this->sendError("Appointment already Booked!, Please select different booking date and time");
        }

        try {
          
        DB::beginTransaction();

        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

        // dd(env('STRIPE_SECRET'));


    //    $token = \Stripe\Token::create(array(
    //         "card" => array(
    //           "number" => "4242424242424242",
    //           "exp_month" => 1,
    //           "exp_year" => 2025,
    //           "cvc" => "314"
    //         )
    //       ));

        $stripeCharge = Stripe\Charge::create ([
                "amount" => $request->amount * 100,
                "currency" => "usd",
                // "source" => $token->id,
                "source" => $request->stripe_token,
                "description" => "Test payment from Change Your Life App!" ,
                "capture" => true
        ]);

            
        $appointment = new Appointments();
        $appointment->patient_name = isset($request->patient_name)?$request->patient_name:'';
        $appointment->order_id = Str::random(16, 'alphaNum');;
        $appointment->date = isset($request->date)?$request->date:'';
        $appointment->phone = isset($request->phone)?$request->phone:'';
        $appointment->amount = isset($request->amount)?$request->amount:'';
        $appointment->user_id = auth()->user()->id;
        $appointment->time = isset($request->time)?$request->time:'';
        $appointment->reminder_before = isset($request->reminder_before)?$request->reminder_before:'';
        $appointment->appointment_for = isset($request->appointment_for)?$request->appointment_for:'';
        $appointment->notes = isset($request->notes)?$request->notes:'';
        $appointment->package_id = isset($request->package_id)?$request->package_id:'';
        $appointment->service_id = isset($request->service_id)?$request->service_id:'';
        $appointment->payment_status = 'paid';

        $appointment->image = isset($request->image)?$request->image:'';
       
        $appointment->save();

        $transaction = new Transactions;
        $transaction->user_id = auth()->user()->id;
        $transaction->appointment_id = $appointment->id;
        $transaction->type = 'charge';
        $transaction->details = json_encode($stripeCharge);
        $transaction->save();

        $notification = new Notifications;
        $notification->from_user = auth()->user()->id;
        $notification->to_user = 1;
        $notification->body = 'New Appointment Created';
        $notification->save();
      
        DB::commit();

        return $this->sendResponse(null, 'Appointment Created Successfully');

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
        $appointment = Appointments::find($id);

        return $this->sendResponse($appointment, 'Success');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $appointment = Appointments::find($id);

        if($appointment){

            $appointment->delete();

            return $this->sendResponse(null, 'Deleted Successfully!');
      
        }else{

            return $this->sendError('No Appointment Found By this ID', 'Success');
        }
    }
}
