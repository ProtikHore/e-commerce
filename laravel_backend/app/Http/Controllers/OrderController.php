<?php

namespace App\Http\Controllers;

use App\Repositories\OrderRepository\OrderInterface;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    protected $orderRepo;
	public function __construct(OrderInterface $orderRepo) {
		$this->orderRepo = $orderRepo;
	}

    public function index(){
        return $this->orderRepo->index();
    }

    public function approveReject($id, $approveReject){
        return $this->orderRepo->approveReject($id, $approveReject);
    }

    public function searchOrderNumber($orderNumber){
        return $this->orderRepo->searchOrderNumber($orderNumber);
    }

    public function updateStatus($id, $status){
        return $this->orderRepo->updateStatus($id, $status);
    }

    public function productSort($sortBy){
        return $this->orderRepo->productSort($sortBy);
    }

    public function filterStatus($status){
        return $this->orderRepo->filterStatus($status);
    }

    public function saveOrder(Request $request){
        return $this->orderRepo->saveOrder($request);
    }

    public function notification() {
        return $this->orderRepo->notification();
    }
}
