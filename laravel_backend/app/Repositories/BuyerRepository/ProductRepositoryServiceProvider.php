<?php

namespace App\Repositories\ProductRepository;

use Illuminate\Support\ServiceProvider;

class ProductRepositoryServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind(
        	'App\Repositories\ProductRepository\ProductInterface',
        	'App\Repositories\ProductRepository\ProductRepository'
        );
    }
}
