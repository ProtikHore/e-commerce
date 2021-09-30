<?php

use App\Http\Controllers\LoginController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
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

Route::group(['middleware' => ['auth:sanctum']], function(){
    Route::prefix('product')->group(function () {
        Route::get('/get/list', [ProductController::class, 'index']);
        Route::post('/save/data', [ProductController::class, 'save']);
        Route::get('/get/update/data/{id}', [ProductController::class, 'getUpdate']);
        Route::put('/update/data/{id}', [ProductController::class, 'update']);
        Route::post('/delete/data/{id}', [ProductController::class, 'delete']);
        Route::get('/search/{name}', [ProductController::class, 'search']);
    });

    Route::prefix('order')->group(function () {
        Route::get('/get/list', [OrderController::class, 'index']);
        Route::put('/approve/reject/order/{id}/{approve_reject}', [OrderController::class, 'approveReject']);
        Route::get('/search/{order_number}', [OrderController::class, 'searchOrderNumber']);
        Route::put('/update/status/{id}/{status}', [OrderController::class, 'updateStatus']);
        Route::get('/product/sort/amount/{sort_by}', [OrderController::class, 'productSort']);
        Route::get('/filer/status/{status}', [OrderController::class, 'filterStatus']);
        Route::post('/save/data', [OrderController::class, 'saveOrder']);
    });
});




Route::get('/hash', function () {
    return Hash::Make(123);
});
