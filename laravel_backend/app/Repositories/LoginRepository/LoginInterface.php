<?php
namespace App\Repositories\LoginRepository;

interface LoginInterface {
	public function login($request);
    public function logout($request);
}
