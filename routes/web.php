<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

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
    return view('welcome');
});
Auth::routes();

Route::get('/products/{product}','ProductController@show')->name('products.show');
Route::get('/retailers','RetailerController@index')->name('retailers.index');

Route::group(['middleware' => 'Admin'], function () {
	// Route::resource('user', 'UserController', ['except' => ['show']]);
	// Route::get('/user/{user}/edit','UserController@edit')->name('user.edit');
	Route::get('/home', 'HomeController@index')->name('home');
	Route::get('profile', ['as' => 'profile.edit', 'uses' => 'ProfileController@edit']);
	Route::put('profile', ['as' => 'profile.update', 'uses' => 'ProfileController@update']);
	Route::put('profile/password', ['as' => 'profile.password', 'uses' => 'ProfileController@password']);

	Route::get('/products','ProductController@index')->name('products.index');	
	Route::get('/products/create','ProductController@create')->name('products.create');
	Route::patch('/products/{product}','ProductController@update');
	Route::get('/products/{product}/edit','ProductController@edit')->name('products.edit');
	// Route::get('/products/{product}','ProductController@show')->name('products.show');
	Route::post('/product','ProductController@store');
	Route::delete('/products/{product}', 'ProductController@destroy')->name('products.destroy');
	
	Route::group(['middleware'=>'SuperAdmin'],function(){
		Route::get('/user','UserController@index')->name('user.index');
		Route::get('/user/create','UserController@create')->name('user.create');
		Route::post('/user','UserController@store')->name('user.store');
		Route::post('/user/{user}','UserController@update')->name('user.update');
		Route::delete('/user/{user}','UserController@destroy')->name('user.destroy');
		Route::get('user/{user}/edit','UserController@edit')->name('user.edit');
	});

});

