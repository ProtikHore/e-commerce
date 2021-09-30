<?php

namespace App\Repositories\LoginRepository;

use Illuminate\Support\ServiceProvider;

class LoginRepositoryServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind(
        	'App\Repositories\LoginRepository\LoginInterface',
        	'App\Repositories\LoginRepository\LoginRepository'
        );
    }
}
