<?php
namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Blade;
use DB;
use Log;

class AppServiceProvider extends ServiceProvider
{

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
        DB::listen(function ($query) {
            $sql = $query->sql;
            for ($i = 0; $i < count($query->bindings); $i++) {
                $sql = preg_replace("/\?/", $query->bindings[$i], $sql, 1);
            }
            Log::info($sql);
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Blade::component('scene.components.links', 'links');
        Blade::component('scene.components.header', 'header');
        Blade::component('scene.components.footer_a', 'footer_a');
        Blade::component('scene.components.footer_b', 'footer_b');

        Blade::component('scene.components.link', 'link');
    }
}
