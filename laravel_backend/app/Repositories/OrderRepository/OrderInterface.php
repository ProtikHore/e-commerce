<?php
namespace App\Repositories\OrderRepository;

interface OrderInterface {
    public function index();
    public function approveReject($id, $approveReject);
    public function searchOrderNumber($orderNumber);
    public function updateStatus($id, $status);
    public function productSort($sortBy);
    public function filterStatus($status);
    public function saveOrder($request);
    public function notification();
}
