<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GadgetChangeValueHistory extends Model
{
    use HasFactory;

    protected $fillable = [
        'gadget_id',
        'value',
        'timeOfChange'
    ];

    public function gadget()
    {
        return $this->belongsTo(Gadget::class, 'gadget_id');
    }
}
