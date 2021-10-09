<?php
namespace App\Repositories\BuyerRepository;

use App\Models\Buyer;
use Illuminate\Support\Facades\Hash;

class BuyerRepository implements BuyerInterface {
    public function login($request) {
        $buyer = Buyer::where('email', $request->get('email'))->first();
        if (!$buyer) {
            return response()->json(['error' => 'Unauthorized Access!'], 401);
        }
        if (!Hash::check($request->get('password'), $buyer->password)) {
            return response()->json(['error' => 'Unauthorized Access!'], 401);
        } else {
            // return $buyer->createToken('buyer_access_token')->plainTextToken;
            return response()->json(['user' => $buyer, 'token' => $buyer->createToken('buyer_access_token')->plainTextToken]);
        }
	}

    public function logout($request) {
        return response()->json('logourasas');
        $data = $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Successfully logged out', 'data' => $data]);
	}
}
