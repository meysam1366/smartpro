<?php

use Illuminate\Support\Facades\Route;
use PhpMqtt\Client\Exceptions\MqttClientException;
use \PhpMqtt\Client\ConnectionSettings;
use PhpMqtt\Client\MqttClient;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    try {
        // Create a new instance of an MQTT client and configure it to use the shared broker host and port.
        $client = new MqttClient(env('MQTT_HOST'), env('MQTT_PORT'));
        // Connect to the broker without specific connection settings but with a clean session.
        $connectionSettings = (new \PhpMqtt\Client\ConnectionSettings)
            // The username used for authentication when connecting to the broker.
            ->setUsername(env("MQTT_AUTH_USERNAME"))

            // The password used for authentication when connecting to the broker.
            ->setPassword(env("MQTT_AUTH_PASSWORD"))
            ->setConnectTimeout(3)
            ->setUseTls(true)
            ->setTlsSelfSignedAllowed(true);

        $client->connect($connectionSettings, true);

        // Publish the message 'Hello world!' on the topic 'foo/bar/baz' using QoS 0.
        $client->publish('smartpro', 'Hello world!', 0);

        // Gracefully terminate the connection to the broker.
        $client->disconnect();
    } catch (MqttClientException $e) {
        dd($e->getMessage(), $e->getLine());
    }
    return view('welcome');
});
