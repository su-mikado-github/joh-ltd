<?php

namespace App\Http\Controllers\Scene;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TopController extends Controller {
    public function index() {
        return view('scene.top_index', [
            'title' => '【グッドライフ】ＴＯＰ',
        ]);
    }
}
