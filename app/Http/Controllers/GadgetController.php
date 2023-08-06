<?php

namespace App\Http\Controllers;

use App\Models\Gadget;
use App\Models\Processor;
use App\Models\GadgetType;
use App\Models\GadgetChangeValueHistory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use PhpMqtt\Client\ConnectionSettings;
use PhpMqtt\Client\Exceptions\MqttClientException;
use PhpMqtt\Client\MqttClient;

class GadgetController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        //$this->middleware('auth:api');
    }
    public function index()
    {
        $gadgets = Gadget::all();
        return response()->json([
            'message' => 'User Gadgets Lists',
            'gadgets' => $gadgets
        ], 201);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request);
        $validator = Validator::make($request->all(), [
            'Fa_Name' => 'required',
            'En_Name' => 'required',
            'Last_Value' => 'required',
            'processor_id' => 'required'

        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
        //dd((array) $request);


        $processor = Processor::findOrFail($request->input('processor_id'));



        $gadget = Gadget::create([
            'Fa_Name' => $request->input('Fa_Name'),
            'En_Name' => $request->input('En_Name'),
            'Last_Value' => $request->input('Last_Value'),

        ]);
        $processor->gadgets()->save($gadget);
        return response()->json([
            'message' => 'User successfully registered',
            'gadget' => $gadget
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Processor  $processor
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $gadget = Gadget::find($id);
        return response()->json([
            'message' => 'User Gadget',
            'gadget' => $gadget
        ], 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Processor  $processor
     * @return \Illuminate\Http\Response
     */
    public function edit(Gadget $gadget, $id)
    {
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Processor  $processor
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Gadget $gadget)
    {
        $gadget_single = Gadget::find($request->header('id'));

        $validatedData = $request->validate([
            'Last_Value' => 'required',
        ]);
        $gadget_single->update($validatedData);
        return response()->json([
            'message' => 'User Gadget',
            'gadget' => $gadget_single
        ], 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Processor  $processor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Processor $processor)
    {
        //
    }

    public function setGadgetType(Request $request)
    {
        $this->validate($request, [
            'gTypeName' => 'required',
            'tag' => 'required',
        ]);

        GadgetType::create([
            'gTypeName' => $request->gTypeName,
            'tag' => $request->tag,
        ]);

        return response()->json([
            'message' => 'GadgetType successfully created',
        ], 201);
    }

    public function saveGadget(Request $request)
    {
        $this->validate($request, [
            'gadgetId' => 'required',
            'procId' => 'required',
            'gadgetType' => 'required',
            'gDavName' => 'required',
            'lastValue' => 'required',
        ]);

        Gadget::create([
            'gadgetId' => $request->gadgetId,
            'procId' => $request->procId,
            'gadgetType' => $request->gadgetType,
            'gDavName' => $request->gDavName,
            'lastValue' => $request->lastValue,
        ]);

        return response()->json([
            'message' => 'GadGet successfully created',
        ], 201);
    }

    public function setNewValue(Request $request)
    {
        $this->validate($request, [
            'gadgetId' => 'required',
            'newValue' => 'required',
        ]);

        $gadgetChangeValueHistory = GadgetChangeValueHistory::create([
            'gadget_id' => $request->gadgetId,
            'value' => $request->newValue,
            'timeOfChange' => Carbon::now()->format('Y-m-d H:i:s')
        ]);

        $procId = $gadgetChangeValueHistory->gadget->processor->procId;
        $lastValue = $gadgetChangeValueHistory->gadget->lastValue;

        try {
            // Create a new instance of an MQTT client and configure it to use the shared broker host and port.
            $client = new MqttClient(env('MQTT_HOST'), env('MQTT_PORT'), 'test-publisher');

            // Create and configure the connection settings as required.
            $connectionSettings = (new ConnectionSettings)
                ->setUsername(env('MQTT_AUTH_USERNAME'))
                ->setPassword(env('MQTT_AUTH_PASSWORD'))
                ->setConnectTimeout(3)
                ->setUseTls(true)
                ->setTlsSelfSignedAllowed(true);

            // Connect to the broker with the configured connection settings and with a clean session.
            $client->connect($connectionSettings, true);

            // Publish the message 'Hello world!' on the topic 'foo/bar/baz' using QoS 0.
            $client->publish($procId, "{$request->gadgetId}_{$request->newValue}", 0);
            $client->loop(true, true);
            // Gracefully terminate the connection to the broker.
            $client->disconnect();
        } catch (MqttClientException $e) {
            // MqttClientException is the base exception of all exceptions in the library. Catching it will catch all MQTT related exceptions.
            dd($e);
            //$logger->error('Connecting with username and password or publishing with QoS 0 failed. An exception occurred.', ['exception' => $e]);
        }

        return response()->json([
            'message' => 'gadgetChangeValueHistory successfully created',
            'topic' => "{$request->gadgetId}_{$procId}",
            'gadgetChangeValueHistory' => $gadgetChangeValueHistory
        ], 201);
    }

    public function getGadgetValue(Request $request)
    {
        $this->validate($request, [
            'gadgetId' => 'required',
        ]);

        $gadgetChangeValueHistory = GadgetChangeValueHistory::where('gadget_id', $request->gadgetId)->first();

        return response()->json([
            'gadgetValue' => $gadgetChangeValueHistory
        ], 200);
    }

    public function changeName(Request $request)
    {
        $this->validate($request, [
            'gadgetId' => 'required',
            'gCustomerName' => 'required',
        ]);

        $gadget = Gadget::where('gadgetId', $request->gadgetId);

        $gadget->update([
            'gCustomerName' => $request->gCustomerName
        ]);

        return response()->json([
            'message' => 'gadget successfully updated',
            'gadget' => $gadget
        ], 200);
    }
}
