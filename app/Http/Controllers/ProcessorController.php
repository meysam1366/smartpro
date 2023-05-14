<?php

namespace App\Http\Controllers;

use App\Processor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProcessorController extends Controller
{

    public function __construct() {
        //$this->middleware('auth:api');
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
    public function gadgetGetValue(Request $request)
    {
        //   dd($request->header());
        $validator = Validator::make($request->header(), [
            'gadget-id' => 'required',
            'processor-id' => 'required',


        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
        //dd((array) $request);
        $gadget = Gadget::where([
            'id' => $request->input('gadget_id'),
            'processor_id' => $request->input('processor_id'),

        ])->first();
        if ($gadget) {
            return response()->json([
                'message' => 'Processor && Gadget Value',
                'Gadget Last Value' => $gadget->Last_Value
            ], 201);
        }
        return response()->json([
            'message' => 'Cant Find Processor && Gadget Value ',
            'Gadget Last Value' => null
        ], 401);
    }

    public function gadgetSetValue(Request $request)
    {
        // dd($request);
        $validator = Validator::make($request->all(), [
            'gadget_id' => 'required',
            'processor_id' => 'required',
            'last_value' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
        //dd((array) $request);


        $gadget = Gadget::where([
            'id' => $request->input('gadget_id'),
            'processor_id' => $request->input('processor_id'),

        ])->first();
        if ($gadget) {
            if ($gadget->update([
                'last_value' => $request->input('last_value'),
            ])) {
                return response()->json([
                    'message' => 'Processor && Gadget  updated With Last Value',
                    'Gadget With Last Value' => $gadget
                ], 201);
            }
        }
        return response()->json([
            'message' => 'Processor && Gadget  Missmatched',
            'Gadget With Last Value' => null
        ], 401);
    }
}
