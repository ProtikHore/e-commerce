<?php

namespace App\Http\Controllers;

use App\Models\Buyer;
use App\Repositories\BuyertRepository\BuyerInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class BuyerController extends Controller
{
    protected $buyerRepo;
	public function __construct(BuyerInterface $buyerRepo) {
		$this->buyerRepo = $buyerRepo;
	}

    public function index(){
        return $this->buyerRepo->index();
    }
}
