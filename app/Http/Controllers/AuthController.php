<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Carbon\Carbon;
use Validator;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register', 'registerOrLogin', 'checkOTP']]);
    }
    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        if (!$token = auth()->attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        return $this->createNewToken($token);
    }
    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required|string|confirmed|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
        $user = User::create(array_merge(
            $validator->validated(),
            ['password' => bcrypt($request->password)]
        ));
        return response()->json([
            'message' => 'User successfully registered',
            'user' => $user
        ], 201);
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();
        return response()->json(['message' => 'User successfully signed out']);
    }
    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->createNewToken(auth()->refresh());
    }
    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userProfile()
    {

        return response()->json(auth()->user());
    }
    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }

    public function registerOrLogin(Request $request)
    {
        $this->validate($request, [
            'mobile' => 'required',
        ]);

        try {
            // create user
            $user = User::create([
                'mobile' => $request->mobile
            ]);
        } catch (\Exception $e) {
            $user = User::checkMobile($request->mobile);
        }

        // send OTP
        return $this->sendOTP($user);
    }

    public function sendOTP($user)
    {
        // $otp = mt_rand(10000, 99999);
        $otp = 12345;
        // $res = SendSmsWithPattern($user->mobile, $otp);

        $user->update([
            'otp' => $otp
        ]);

        return response()->json([
            'message'   => 'send OTP successfully',
            'user'       => $user
        ], Response::HTTP_OK);

        // if (is_null($user->otp)) {
        //     $user->update([
        //         'otp' => $otp,
        //         'expire_time' => Carbon::now()->addMinutes(2)
        //     ]);

        //     return response()->json([
        //         'message'   => 'send OTP successfully',
        //         // 'res'       => $res
        //     ], Response::HTTP_OK);
        // }
        // if ($user->expire_time > Carbon::now()->toDateTimeString()) {
        //     // return [$user->expire_time, Carbon::now()->toDateTimeString()];
        //     return response()->json([
        //         'message' => 'please wait'
        //     ], Response::HTTP_OK);
        // } else {

        //     $user->update([
        //         'otp' => $otp,
        //         'expire_time' => Carbon::now()->addMinutes(2)
        //     ]);
        //     return response()->json([
        //         'message' => 'send OTP successfully',
        //         // 'res'     => $res
        //     ], Response::HTTP_OK);
        // }
    }

    public function checkOTP(Request $request)
    {
        $this->validate($request, [
            'mobile' => 'required',
            'otp' => 'required',
        ]);

        $user = User::checkMobileAndOtp($request->mobile, $request->otp);
        if ($user) {
            $token = $user->createToken($user->mobile)->plainTextToken;
            return response()->json([
                'message'           => 'token generated',
                'token'             => $token,
                'user'              => $user,
            ], Response::HTTP_OK);
        } else {
            return response()->json([
                'message' => 'OTP Or Mobile Not found',
                'token' => null
            ], Response::HTTP_NOT_FOUND);
        }
    }
}
