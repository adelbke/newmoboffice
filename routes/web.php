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

Route::get('/retailers','RetailerController@index')->name('retailers.index');
Route::get('/retailers/create','RetailerController@create')->name('retailers.create');
Route::post('/retailers','RetailerController@store')->name('retailers.store');

Route::group(['middleware' => 'Admin'], function () {
	
	// Profiles
	Route::get('/home', 'HomeController@index')->name('home');
	Route::get('profile', ['as' => 'profile.edit', 'uses' => 'ProfileController@edit']);
	Route::put('profile', ['as' => 'profile.update', 'uses' => 'ProfileController@update']);
	Route::put('profile/password', ['as' => 'profile.password', 'uses' => 'ProfileController@password']);

	// Products
	Route::get('/products','ProductController@index')->name('products.index');	
	Route::get('/products/create','ProductController@create')->name('products.create');
	Route::patch('/products/{product}','ProductController@update');
	Route::get('/products/{product}/edit','ProductController@edit')->name('products.edit');
	// Route::get('/products/{product}','ProductController@show')->name('products.show');
	Route::post('/products','ProductController@store');
	Route::delete('/products/{product}', 'ProductController@destroy')->name('products.destroy');

	// Retailers
	Route::post('/retailers/activate','RetailerController@Activate')->name('retailers.activate');
	Route::post('/retailers/deactivate','RetailerController@Deactivate')->name('retailers.deactivate');

	// Types
	Route::delete('/types/{type}','TypeController@destroy')->name('types.destroy');
	Route::post('/types','TypeController@store')->name('types.store');
	Route::get('/types','TypeController@index')->name('types.index');
	Route::get('/types/create','TypeController@create')->name('types.create');

	Route::post('/types/getcategory','TypeController@getCategory')->name('types.getCategory');

	// Colors
	Route::get('/colors','ColorController@index')->name('colors.index');
	Route::post('/colors','ColorsController@store')->name('colors.store');
	Route::get('/colors/create','ColorController@create')->name('colors.create');
	Route::delete('/colors/{color}','ColorController@destroy')->name('colors.destroy');

	// Images
	Route::get('/Images','ImageController@index')->name('images.index');


	Route::group(['middleware'=>'SuperAdmin'],function(){
		// Route::get('/user','UserController@index')->name('user.index');
		// Route::get('/user/create','UserController@create')->name('user.create');
		// Route::post('/user','UserController@store')->name('user.store');
		// Route::post('/user/{user}','UserController@update')->name('user.update');
		// Route::delete('/user/{user}','UserController@destroy')->name('user.destroy');
		// Route::get('user/{user}/edit','UserController@edit')->name('user.edit');
		Route::resource('user', 'UserController', ['except' => ['show']]);
		Route::get('/user/{user}/edit','UserController@edit')->name('user.edit');
	
	});

});

Route::get('/products/{product}','ProductController@show')->name('products.show');


