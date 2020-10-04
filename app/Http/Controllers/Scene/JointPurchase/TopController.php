<?php
namespace App\Http\Controllers\Scene\JointPurchase;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TopController extends Controller {
    //
    public function index(Request $request) {
        return view('scene.joint_purchase.top_index');
    }
}
