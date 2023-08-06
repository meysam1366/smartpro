<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ProcFrimWare;
use Illuminate\Support\Facades\Storage;

class ProcFrimWareController extends Controller
{
    public function setNewVersion(Request $request)
    {
        $this->validate($request, [
            'pType' => 'required',
            'version' => 'required',
            'filePath' => 'required',
        ]);

        $dir = public_path('/frimWares/images');

        $file = $request->file('filePath');

        $fileName = time() . '-' . $file->getClientOriginalName();

        // $file->move($dir, $fileName);
        $file->storeAs('public/frimWares/images', $fileName);

        // Storage::url($dir . $fileName);

        $procFrimWare = ProcFrimWare::where('pType', $request->pType)->first();

        if ($procFrimWare == null) {
            ProcFrimWare::create([
                'pType' => $request->pType,
                'version' => $request->version,
                'filePath' => env('APP_URL') . '/storage/frimWares/images/' . $fileName
            ]);

            return response()->json([
                'message' => 'FrimWare successfully created',
            ], 201);
        } else {
            $procFrimWare->update([
                'version' => $request->version,
                'filePath' => env('APP_URL') . '/storage/frimWares/images/' . $fileName
            ]);

            return response()->json([
                'message' => 'FrimWare successfully updated',
            ], 200);
        }
    }

    public function checkVersion(Request $request)
    {
        $this->validate($request, [
            'pType' => 'required',
            'version' => 'required',
        ]);

        $frimWare = ProcFrimWare::where('pType', $request->pType)
            ->where('version', ">", $request->version)
            ->latest()
            ->first();

        if (is_null($frimWare)) {
            return response()->json([
                'message' => 'new version not exsist',
                'filePath' => null
            ], 404);
        }

        return response()->json([
            'message' => 'new version exsist',
            'filePath' => $frimWare->filePath
        ], 200);
    }
}
