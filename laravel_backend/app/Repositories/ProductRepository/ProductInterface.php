<?php
namespace App\Repositories\ProductRepository;

interface ProductInterface {
    public function index();
    public function save($request);
    public function getUpdate($id);
    public function update($request, $id);
    public function delete($id);
    public function search($name);
}
