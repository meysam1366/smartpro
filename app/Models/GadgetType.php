<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GadgetType extends Model
{
    use HasFactory;

    protected $fillable = [
        'gTypeName',
        'tag'
    ];
}
