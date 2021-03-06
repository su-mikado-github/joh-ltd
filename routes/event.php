<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('system')->group(function() {
    Route::post('login', 'Event\\SystemController@login');
    Route::post('logout', 'Event\\SystemController@logout');
    Route::post('user_regist', 'Event\\SystemController@user_regist');
    Route::post('new_user_check', 'Event\\SystemController@new_user_check');
    Route::post('new_user_apply', 'Event\\SystemController@new_user_apply');

    Route::post('new_agent_user_check', 'Event\\SystemController@new_agent_user_check');
    Route::post('new_agent_user_apply', 'Event\\SystemController@new_agent_user_apply');
});

Route::post('agent_regist/{method}', 'Event\\AgentRegistController@method_dispatch');
Route::post('agent_regist_preview/{method}', 'Event\\AgentRegistPreviewController@method_dispatch');
