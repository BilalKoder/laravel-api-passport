<?php
namespace App\Traits;

use Illuminate\Support\Facades\Mail;
use Exception;

trait EmailTrait
{
    public function sendMail($data, $view){ 
        try {
            Mail::send($view, $data, function ($message) use ($data) {
                $message->from('info@change.com', 'Change Therapy');
                $message->to($data['email']);
                $message->Subject($data['subject']);
            });
            return true;
        } catch (Exception $e) {
            dd($e->getMessage(),);
            return false;
        }
    }

}
