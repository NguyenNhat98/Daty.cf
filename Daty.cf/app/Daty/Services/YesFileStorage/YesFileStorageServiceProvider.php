<?php

namespace App\Daty\Services\YesFileStorage;

/*
 * Service Provider for YesFileStorage
 *-------------------------------------------------------- */

use Illuminate\Support\ServiceProvider;

class YesFileStorageServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     */
    public function boot()
    {
        $this->publishes([
            __DIR__.'/config/yes-file-storage.php' => config_path('yes-file-storage.php'),
        ], 'yesfilestorage');

        // required YesFileStorage helpers & directives
        require __DIR__.'/support/helpers.php';
    }

    /**
     * Register any application services.
     */
    public function register()
    {
        // Register 'YesFileStorage' instance container to our YesFileStorage object
        $this->app->singleton('yesfilestorage', function ($app) {
               return new \App\Daty\Services\YesFileStorage\YesFileStorage();
        });

        // Register Alias
        $this->app->booting(function () {
            $loader = \Illuminate\Foundation\AliasLoader::getInstance();
            $loader->alias('YesFileStorage',
                \App\Daty\Services\YesFileStorage\YesFileStorageFacade::class);
        });
    }
}
