<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $table = 'bookings';

    protected $fillable = [
        'user_id',
        'division_id',
        'booking_code',
        'booking_type',
        'booking_date',
        'start_time',
        'end_time',
        'purpose',
        'room_id',
        'vehicle_id',
        'participants_count',
        'destination',
        'status',
        'division_approval_by',
        'division_approval_at',
        'division_approval_notes',
        'ga_approval_by',
        'ga_approval_at',
        'ga_approval_notes',
        'rejection_reason'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function division()
    {
        return $this->belongsTo(Division::class);
    }

    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    public function vehicle()
    {
        return $this->belongsTo(Vehicle::class);
    }

    public function toApiResponse()
{
    return [
        'id' => $this->id,
        'booking_code' => $this->booking_code,
        'booking_type' => $this->booking_type,
        // ... other fields
    ];
}
}