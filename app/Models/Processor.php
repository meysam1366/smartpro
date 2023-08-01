<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Processor extends Model
{

    protected $fillable = [
        'procId',
        'procPassword',
        'pDavName',
        'pCustomerName',
        'procType',
        'firstWorkDate',
    ];

    protected $primaryKey = 'procId';

    public $incrementing = false;

    public function gadgets()
    {
        return $this->hasMany(Gadget::class);
    }

    public function users()
    {
        return $this->belongsToMany(User::class);
    }
}
