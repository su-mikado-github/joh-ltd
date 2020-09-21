<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/scene/top');
});

// Route::get('/{status}', function(Request $request, $status) {
// });

//画面用ルーティング
Route::prefix('scene')->group(function() {
    //グッドライフTOP
    Route::get('top', 'Scene\TopController@index');
    Route::get('attest', 'Scene\AttestController@index');
    Route::get('user_regist', 'Scene\UserRegistController@index');
    Route::get('regist_mail_send', 'Scene\RegistMailSendController@index');
    Route::get('new_user', 'Scene\NewUserController@index');
    Route::get('new_user_preview', 'Scene\NewUserPreviewController@index');



});

//画面の振る舞いを処理するスクリプト用ルーティング
Route::prefix('behavior')->group(function() {
    Route::get('system', function() { return Response::view('behavior.system')->header('Content-Type', 'text/javascript; charset=utf-8'); });
    Route::get('components', function() { return Response::view('behavior.components')->header('Content-Type', 'text/javascript; charset=utf-8'); });

    Route::get('top', function() { return Response::view('behavior.top')->header('Content-Type', 'text/javascript; charset=utf-8'); });
    Route::get('attest', function() { return Response::view('behavior.attest')->header('Content-Type', 'text/javascript; charset=utf-8'); });
    Route::get('user_regist', function() { return Response::view('behavior.user_regist')->header('Content-Type', 'text/javascript; charset=utf-8'); });
    Route::get('new_user', function() { return Response::view('behavior.new_user')->header('Content-Type', 'text/javascript; charset=utf-8'); });
    Route::get('new_user_preview', function() { return Response::view('behavior.new_user_preview')->header('Content-Type', 'text/javascript; charset=utf-8'); });


});

//画面の装飾様スタイル用ルーティング
Route::prefix('makeup')->group(function() {
    Route::get('system', 'Makeup\SystemController@index');
});

