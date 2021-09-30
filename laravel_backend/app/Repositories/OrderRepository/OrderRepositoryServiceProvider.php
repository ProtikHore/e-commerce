<?php

namespace App\Repositories\OrderRepository;

use Illuminate\Support\ServiceProvider;

class OrderRepositoryServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind(
        	'App\Repositories\OrderRepository\OrderInterface',
        	'App\Repositories\OrderRepository\OrderRepository'
        );
    }
}
