<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\GadgetController;
use App\Http\Controllers\ProcessorController;
use App\Http\Controllers\ProcFrimWareController;
use App\Http\Controllers\VersionsController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['api', 'cors'])
    ->prefix('v1/auth')
    ->group(function ($router) {
        route::post('registerOrLogin', [AuthController::class, 'registerOrLogin']);
        route::post('checkOTP',  [AuthController::class, 'checkOTP']);
        Route::post('/login', [AuthController::class, 'login']);
        Route::post('/register', [AuthController::class, 'register']);
        Route::post('/logout', [AuthController::class, 'logout']);
        Route::post('/refresh', [AuthController::class, 'refresh']);
        Route::get('/user-profile', [AuthController::class, 'userProfile']);
    });
Route::prefix('v1')
    ->middleware('auth:sanctum')
    ->group(function () {
        Route::post('/gadget-store', [GadgetController::class, 'store'])->name('gadget_store');
        Route::get('/gadget-list', [GadgetController::class, 'index'])->name('gadget_list');
        Route::get('/gadget-single/{id}', [GadgetController::class, 'show'])->name('gadget_single');
        Route::post('/gadget-single-update',  [GadgetController::class, 'update'])->name('gadget_single_update');


        Route::get('/processor-single/{id}', [ProcessorController::class, 'show'])->name('processor_single');
        Route::get('/processor-list', [ProcessorController::class, 'index'])->name('processor_list');


        Route::get('/gadget-get-value', [ProcessorController::class, 'gadgetGetValue'])->name('gadget_Get_Value');
        Route::post('/gadget-set-value', [ProcessorController::class, 'gadgetSetValue'])->name('gadget_Set_Value');

        Route::get('/version-get-value', [VersionsController::class, 'versionGetValue'])->name('version_Get_Value');
        Route::post('/version-set-value', [VersionsController::class, 'versionSetValue'])->name('version_Set_Value');

        Route::controller(ProcessorController::class)
            ->prefix('processor')
            ->group(function () {
                Route::post('/setProcType', 'setProcType');
                Route::post('/saveNewProc', 'saveNewProc');
                Route::post('/registeredProc', 'registeredProc');
                Route::post('/getGadgetLists', 'getGadgetLists');
                Route::post('/changeName', 'changeName');
                Route::post('/setProcessorsToUser', 'setProcessorsToUser');
                Route::post('/getProcessorsByToken', 'getProcessorsByToken');
            });
        Route::post('/setNewVersion', [ProcFrimWareController::class, 'setNewVersion']);
        Route::post('/checkVersion', [ProcFrimWareController::class, 'checkVersion']);
        Route::controller(GadgetController::class)
            ->prefix('gadget')
            ->group(function () {
                Route::post('/setGadgetType', 'setGadgetType');
                Route::post('/saveGadget', 'saveGadget');
                Route::post('/setNewValue', 'setNewValue');
                Route::post('/getGadgetValue', 'getGadgetValue');
                Route::post('/changeName', 'changeName');
            });
    });

//Route::prefix('news')->name('news.')->group(function (){
   // Route::get('/details/{news}', 'NewsController@details')->name('details');
//});
