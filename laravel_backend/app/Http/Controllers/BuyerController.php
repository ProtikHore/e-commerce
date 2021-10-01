<?php

namespace App\Http\Controllers;

use App\Models\Buyer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class BuyerController extends Controller
{
    public function login(Request $request) {
        $user = Buyer::where('email', $request->get('email'))->first();
        if (!$user) {
            return response()->json('Unauthorized Access!');
        }
        if (!Hash::check($request->get('password'), $user->password)) {
            return response()->json('Unauthorized Access!');
        } else {
            return $user->createToken('buyer_access_token')->plainTextToken;
        }
	}
}
