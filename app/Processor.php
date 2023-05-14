<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Processor extends Model
{
    public function gadgets()
    {
        return $this->hasMany(Gadget::class);
    }
}
