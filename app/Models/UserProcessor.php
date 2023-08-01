<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserProcessor extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'procId'
    ];

    public $table = "users_processors";
}
