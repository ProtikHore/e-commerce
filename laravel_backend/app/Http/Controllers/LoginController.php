<?php

namespace App\Http\Controllers;

use App\Http\Requests\Login\LoginRequest;
use App\Repositories\LoginRepository\LoginInterface;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    protected $loginRepo;
	public function __construct(LoginInterface $loginRepo) {
		$this->loginRepo = $loginRepo;
	}

    public function login(LoginRequest $request) {
        return $this->loginRepo->login($request);
    }

    public function logout(Request $request) {
        return $this->loginRepo->logout($request);
    }
}
