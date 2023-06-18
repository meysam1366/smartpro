<?php

namespace App\Http\Controllers;

use App\Processor;
use App\Gadget;
use PhpMqtt\Client\Facades\MQTT;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use PhpMqtt\Client\ConnectionSettings;
use PhpMqtt\Client\Examples\Shared\SimpleLogger;
use PhpMqtt\Client\Exceptions\MqttClientException;
use PhpMqtt\Client\MqttClient;
use Psr\Log\LogLevel;

// use \PhpMqtt\Client\MqttClient;
// use \PhpMqtt\Client\ConnectionSettings;

class ProcessorController extends Controller
{

    public function __construct()
    {
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



                //$logger = new SimpleLogger(LogLevel::INFO);

                try {
                    // Create a new instance of an MQTT client and configure it to use the shared broker host and port.
                    $client = new MqttClient(env('MQTT_HOST'), env('MQTT_PORT'), 'test-publisher', MqttClient::MQTT_3_1, null);

                    // Create and configure the connection settings as required.
                    $connectionSettings = (new ConnectionSettings)
                        ->setUsername(env('MQTT_AUTH_USERNAME'))
                        ->setPassword(env('MQTT_AUTH_PASSWORD'));

                    // Connect to the broker with the configured connection settings and with a clean session.
                    $client->connect($connectionSettings, true);

                    // Publish the message 'Hello world!' on the topic 'foo/bar/baz' using QoS 0.
                    $client->publish('fartak_pro', 'Hello#!', MqttClient::QOS_EXACTLY_ONCE);
                    $client->loop(true, true);
                    // Gracefully terminate the connection to the broker.
                    $client->disconnect();
                } catch (MqttClientException $e) {
                    // MqttClientException is the base exception of all exceptions in the library. Catching it will catch all MQTT related exceptions.
                    dd($e);
                    //$logger->error('Connecting with username and password or publishing with QoS 0 failed. An exception occurred.', ['exception' => $e]);
                }

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
