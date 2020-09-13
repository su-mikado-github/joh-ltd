<?php

namespace App\Http\Controllers\Behavior;

use App\Http\Controllers\Controller;

use Log;
use Response;

class ComponentsController extends Controller {
    public function index() {
        return Response::view('behavior.components')
            ->header('Content-Type', 'text/javascript; charset=utf-8');
    }
}
