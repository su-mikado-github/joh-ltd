<?php

namespace App\Http\Controllers\Scene;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AttestController extends Controller {
    //
    public function index() {
        return view('scene.attest_index', [
            'title' => '【グッドライフ】ログイン',
        ]);
    }
}
