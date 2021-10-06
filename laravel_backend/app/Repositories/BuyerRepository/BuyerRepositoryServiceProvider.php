<?php

namespace App\Repositories\BuyerRepository;

use Illuminate\Support\ServiceProvider;

class BuyerRepositoryServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind(
        	'App\Repositories\BuyerRepository\BuyerInterface',
        	'App\Repositories\BuyerRepository\BuyerRepository'
        );
    }
}
