<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Gadget extends Model
{
    use SoftDeletes;
    //

    protected $fillable = [
        'procId',
        'gadgetType',
        'gDavName',
        'gCustomerName',
        'lastValue',
        'status'
    ];
    public function processor()
    {
        return $this->belongsTo(Processor::class, 'procId');
    }
}
