<?php
namespace App\Repositories\LoginRepository;

use App\Models\User;
use Illuminate\Support\Facades\Hash;

class LoginRepository implements LoginInterface {
	public function login($request) {
        $user = User::where('email', $request->get('email'))->first();
        if (!$user) {
            return response()->json(['error' => 'Unauthorized Access!'], 401);
        }
        if (!Hash::check($request->get('password'), $user->password)) {
            return response()->json(['error' => 'Unauthorized Access!'], 401);
        } else {
            // return $user->createToken('access_token')->plainTextToken;
            return response()->json(['user' => $user, 'token' => $user->createToken('access_token')->plainTextToken]);
        }
	}

    public function logout($request) {
        return response()->json(request()->user());
        $data = $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Successfully logged out', 'data' => $data]);
	}
}
