<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $table = 'orders';

    public function orderDetail()
    {
        return $this->hasMany(OrderDetail::class);
    }

    public function buyer()
    {
        return $this->belongsTo(Buyer::class);
    }
}
