<?php

namespace App\Http\Controllers;

use App\Http\Requests\Buyer\LoginRequest;
use App\Models\Buyer;
use App\Repositories\BuyerRepository\BuyerInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class BuyerController extends Controller
{
    protected $buyerRepo;
	public function __construct(BuyerInterface $buyerRepo) {
		$this->buyerRepo = $buyerRepo;
	}

    public function login(LoginRequest $request){
        return $this->buyerRepo->login($request);
    }

    public function logout(Request $request) {
        return $this->buyerRepo->logout($request);
    }
}
