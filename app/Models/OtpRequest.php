<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OtpRequest extends Model
{
    use HasFactory;

    protected $guarded  = [];
   
    protected $table = 'otp_requests';

    protected $fillable = [
        'email',
        'otp',
        'created_at',
    ];
}
