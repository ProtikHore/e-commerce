<?php
namespace App\Repositories\BuyerRepository;

interface BuyerInterface {
    public function login($request);
    public function logout($request);
    public function signup($request);
}
