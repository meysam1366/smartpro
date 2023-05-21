<?php

namespace App\Http\Controllers;

use App\Version;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class VersionsController extends Controller
{
    public function __construct()
    {
        //$this->middleware('auth:api');
    }

    public function index()
    {
        $versions = Version::all();
        return response()->json([
            'message' => 'versions Lists',
            'versions' => $versions
        ], 201);
    }
    public function show($id)
    {
        $version = Version::find($id);
        return response()->json([
            'message' => 'version',
            'version' => $version
        ], 201);
    }
    public function versionGetValue(Request $request)
    {
        //   dd($request->header());
        $validator = Validator::make($request->header(), [
            'version-title' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
        //dd((array) $request);
        $version = Version::where([
            'version_title' => $request->input('version_title'),

        ])->first();
        $fileContents = Storage::get($version->interface_file);
        if ($version) {
            return response()->json([
                'message' => 'version Value',
                'version Last Type Value' => $version->type,
                'version Last Interface Code Value' => $version->interface_code,
                'version Last Interface File' => $fileContents,
            ], 201);
        }

        return response()->json([
            'message' => 'Cant Find version Value ',
            'version Last Type Value' => null,
            'version Last Interface Code Value' => null
        ], 401);
    }

    public function versionSetValue(Request $request)
    {
        // dd($request);
        $validator = Validator::make($request->all(), [
            'version_title' => 'required',
            'type' => 'required',
            // 'interface_code' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
        //dd((array) $request);


        $version = Version::where([
            'version_title' => $request->input('version_title'),
        ])->firstOrNew();

        $filePath = Storage::putFile('version_interfaces', $request->file('interface_file'));



        if ($version) {
            $version->interface_file = $filePath;
            $version->update([
                'type' => $request->input('type'),
                'interface_code' => $request->input('interface_code'),

            ]);


            if ($version->save()) {
                return response()->json([
                    'message' => ' version type  updated With Latest Value',
                    'Version With Last type && interface code' => $version
                ], 201);
            }
        }
        return response()->json([
            'message' => 'version  Missmatched',
            'version With Last type && interface code ' => null
        ], 401);
    }
}
