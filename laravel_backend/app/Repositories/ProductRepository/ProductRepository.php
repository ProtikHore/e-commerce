<?php
namespace App\Repositories\ProductRepository;

use App\Models\Product;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ProductRepository implements ProductInterface {

    public function index() {
        return response()->json(Product::get());
	}

    public function save($request) {
        $productData = $request->all();
        $productData['status'] = 'Active';
        $productData['image'] = $request->file('image') === null ? '---' : $request->file('image')->storeAs('image/product', Str::slug($request->get('name')) . '-' . time() . '.' . $request->file('image')->getClientOriginalExtension(), 'public');
        Product::create($productData);
        return response()->json('Product Add Successfully');
	}

    public function update($request, $id) {
        $producUpdatetData = $request->all();
        $producUpdatetData['image'] = $request->file('image') === null ? '---' : $request->file('image')->storeAs('image/product', Str::slug($request->get('name')) . '-' . time() . '.' . $request->file('image')->getClientOriginalExtension(), 'public');
        Product::where('id', $id)->update($producUpdatetData);
        return response()->json('Product Update Successfully');
	}

    public function delete($id) {
        Storage::disk('public')->delete(Product::where('id', $id)->first()->image);
        Product::where('id', $id)->delete();
        return response()->json('Product Delete Successfully');
	}

    public function search($name) {
        return response()->json(Product::where('name', 'like', '%' . $name . '%')->get());
	}
}
