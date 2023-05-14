<?php

namespace App\Http\Controllers;

use App\Processor;
use Illuminate\Http\Request;

class ProcessorController extends Controller
{

    public function __construct() {
        $this->middleware('auth:api');
    }

    public function index()
    {
        $processors = Processor::all();
        return response()->json([
            'message' => 'Processors Lists',
            'processors' => $processors
        ], 201);

    }
    public function show($id)
    {
        $processor = Processor::find($id);
        return response()->json([
            'message' => 'User Gadget',
            'processor' => $processor
        ], 201);
    }
}
