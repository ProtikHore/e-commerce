<?php

namespace App\Http\Controllers;

use App\Http\Requests\Product\ProductRequest;
use App\Repositories\ProductRepository\ProductInterface;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    protected $productRepo;
	public function __construct(ProductInterface $productRepo) {
		$this->productRepo = $productRepo;
	}

    public function index(){
        return $this->productRepo->index();
    }

    public function save(ProductRequest $request){
        return $this->productRepo->save($request);
    }

    public function getUpdate($id){
        return $this->productRepo->getUpdate($id);
    }

    public function update(ProductRequest $request, $id){
        return $this->productRepo->update($request, $id);
    }

    public function delete($id){
        return $this->productRepo->delete($id);
    }

    public function search($name){
        return $this->productRepo->search($name);
    }
}
