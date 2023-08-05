<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Gadget extends Model
{
    use SoftDeletes;
    //

    protected $fillable = [
        'gadgetId',
        'procId',
        'gadgetType',
        'gDavName',
        'gCustomerName',
        'lastValue',
        'status'
    ];

    protected $primaryKey = 'gadgetId';

    public $incrementing = false;

    public function processor()
    {
        return $this->belongsTo(Processor::class, 'procId');
    }
}
