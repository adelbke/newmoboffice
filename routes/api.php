<?php

use Illuminate\Http\Request;
use App\Http\Requests\TypeRequest;


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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


// Route::name('products.')->group(function () {
//     Route::get('/products','ProductApiController@index')->name('index');
//     Route::post('/products/store','ProductApiController@store')->name('store');
// });


Route::apiResource('/products','ProductApiController');


// Type Routes
Route::apiResource('/types','TypeApiController');

Route::group(['prefix' => 'types'], function() {
    Route::get('/{type}/children','TypeApiController@children');
    Route::get('/{type}/products','TypeApiController@products');
});

// Image Routes
Route::apiResource('/images','ImageApiController');

// color Routes
Route::apiResource('/colors','ColorApiController');

// orders Routes
Route::apiResource('/orders','OrderApiController');