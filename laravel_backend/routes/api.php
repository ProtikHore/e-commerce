<?php

use App\Http\Controllers\BuyerController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/login', [LoginController::class, 'login']);
Route::post('/buyer/login', [BuyerController::class, 'login']);

Route::group(['middleware' => ['auth:users']], function(){
    Route::prefix('product')->group(function () {
        Route::get('/get/list', [ProductController::class, 'index']);
        Route::post('/save/data', [ProductController::class, 'save']);
        Route::get('/get/update/data/{id}', [ProductController::class, 'getUpdate']);
        Route::post('/update/data/{id}', [ProductController::class, 'update']);
        Route::post('/delete/data/{id}', [ProductController::class, 'delete']);
        Route::get('/search/{name}', [ProductController::class, 'search']);
        Route::put('/update/status/{id}/{status}', [OrderController::class, 'updateStatus']);
        Route::put('/approve/reject/order/{id}/{approve_reject}', [OrderController::class, 'approveReject']);
        Route::get('/search/unique/{order_number}', [OrderController::class, 'searchOrderNumber']);
        Route::get('/admin/logout', [LoginController::class, 'logout']);
    });
});



//-------------------------------------------


Route::group(['middleware' => ['auth:buyers']], function(){

});

Route::prefix('order')->group(function () {
    Route::get('/get/list', [OrderController::class, 'index']);
    Route::get('/product/sort/amount/{sort_by}', [OrderController::class, 'productSort']);
    Route::get('/filer/status/{status}', [OrderController::class, 'filterStatus']);
    Route::post('/save/data', [OrderController::class, 'saveOrder']);

    Route::get('/buyer/product/get/list', [ProductController::class, 'index']);
});

//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------

Route::group(['middleware' => ['auth:sanctum']], function(){

});


Route::get('/hash', function () {
    return Hash::Make(123);
});
