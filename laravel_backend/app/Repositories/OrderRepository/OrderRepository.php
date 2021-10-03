<?php
namespace App\Repositories\OrderRepository;

use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class OrderRepository implements OrderInterface {

    public function index() {
        return response()->json(Order::with('orderDetail', 'orderDetail.product', 'buyer')->get());
	}

    public function approveReject($id, $approveReject) {
        return response()->json(Order::where('id', $id)->update(['status' => $approveReject]));
	}

    public function searchOrderNumber($orderNumber) {
        return response()->json(Order::where('order_number', $orderNumber)->get());
	}

    public function updateStatus($id, $status) {
        return response()->json(Order::where('id', $id)->update(['status' => $status]));
	}

    public function productSort($sortBy) {
        $orderBy = $sortBy === 'lowToHigh' ? 'ASC' : 'DESC';
        return response()->json(Product::orderBy('price', $orderBy)->get());
	}

    public function filterStatus($status) {
        return response()->json(Order::where('status', $status)->get());
	}

    public function saveOrder($request) {
        $orderData['order_number'] = rand(100000, 999999);
        $orderData['buyer_id'] = 1;
        $orderData['status'] = 'Pending';
        $orderData['description'] = '---';
        $order = Order::create($orderData);

        $orderDetails['order_id'] = $order->id;
        $orderDetails['product_id'] = $request->get('id');
        $orderDetails['quantity'] = 1;
        $orderDetails['price'] = $request->get('price');
        $orderDetails['status'] = 'Active';
        OrderDetail::create($orderDetails);
        return response()->json('Order Placed Successfully');
	}
}
