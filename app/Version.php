<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Version extends Model
{
    protected $fillable = [
        'version_title', 'type', 'interface_code'
    ];
}
