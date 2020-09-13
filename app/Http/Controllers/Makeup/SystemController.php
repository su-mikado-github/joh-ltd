<?php

namespace App\Http\Controllers\Makeup;

use App\Http\Controllers\Controller;

use App\Models\System;
use App\Models\Color;

use Log;
use Response;

class SystemController extends Controller {
    public function index() {
        $system = System::row();

//Log::info(__FILE__ . '(' . __LINE__ . ') => ' . var_export($system, true));

        $colors = Color::rowsetByThemeId($system->theme_id);
        $color_palette = array_reduce($colors, function($result, $item) {
            $category = str_replace('_', '', ucwords($item->category, '_'));
            $result["{$category}-{$item->id}"] = $item;
            return $result;
        }, []);

//Log::info(__FILE__ . '(' . __LINE__ . ') => ' . var_export($color_palette, true));

        return Response::view('makeup.system', ['colors'=>$colors, 'color_palette'=>$color_palette])
            ->header('Content-Type', 'text/css; charset=utf-8');
    }
}
