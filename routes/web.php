<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Product;
use App\Slider;
use Illuminate\Http\Request;

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
	$products = Product::with(['images'=>function ($query)
	{
		$query->where('image_type','=','card');
	}])->get()->sortByDesc('visitors')->take(4);

	// dd($products);

	// Reunion
	$reunion = Product::with(['images'=>function ($query){
		$query->where('image_type','=','product_image')->select('path');
	}])->whereHas('type',function ($query){
		$query->where('Category','=','Meuble de Bureau');
	})
	->get()->sortByDesc('visitors')->take(4);

	// Accueil
	$accueil = Product::with(['images'=> function ($query){
			$query->where('image_type','=','card')->select('path');
		}
	])->whereHas('type',function ($query){
		$query->where('Category','=','Chaises');
	})->get()->sortByDesc('visitors')->take(4);


	// Sliders
	$sliders = Slider::with('image')->get();

	// dd($sliders->pop());

    return view('welcome',compact('products','reunion','accueil','sliders'));
});
Auth::routes();

// Search
Route::get('/search',function (Request $request){
	if(isset($request->orderby)){

		switch ($request->orderby) {
			case 'cheaptoexpensive':
				$list = Product::search($request->search)->orderBy('clientPrice','desc')->get();			
				break;
			case 'expensivetocheap':
				$list = Product::search($request->search)->orderBy('clientPrice','asc')->get();
				break;
			case 'popularity':
				$list = Product::where('name','LIKE','%'.$request->search.'%')->orderBy('visitors','desc')->get();
		}
	}else{
		if(isset($request->search))
		{
			// $list = Product::search($request->search)->get();
			$list = Product::where('name','LIKE','%'.$request->search.'%')->get();
		}else{
			$list= Product::with(['images'=>function($query) {
				$query->where('image_type','=','card');
			}])->get();
		}
	}

	$search = $request->search;
	$orderby = $request->orderby;
	return view('search',compact('list','search','orderby'));
})->name('search');

// About
Route::get('/about',function (){
	return view('about');
})->name('about');

Route::view('/catalogue','catalogue');
// Contact
Route::get('/contact','ContactFormController@create');
Route::post('/contact','ContactFormController@store');


// Retailers
Route::get('/retailers','RetailerController@index')->name('retailers.index');
Route::get('/retailers/create','RetailerController@create')->name('retailers.create');
Route::post('/retailers','RetailerController@store')->name('retailers.store');

// Cart
Route::post('/cart/add','CartController@add');
Route::post('/cart/get','CartController@getContent');
Route::post('/cart/remove','CartController@remove');
Route::get('/cart','CartController@index')->name('cart.index');
Route::post('/cart','CartController@store')->name('cart.save');
Route::post('/cart/update','CartController@update');

// Orders
Route::post('/order/getallorders','OrderController@getUserOrders');

Route::group(['middleware' => 'Admin'], function () {

	// Slider
	Route::get('/sliders','SliderController@index')->name('sliders.index');
	Route::get('/sliders/create','SliderController@create')->name('sliders.create');
	Route::post('/sliders','SliderController@store')->name('sliders.store');
	Route::delete('/sliders/{slider}','SliderController@destroy')->name('sliders.destroy');
	
	// Profiles
	Route::get('/home', 'HomeController@index')->name('home');
	Route::get('profile', ['as' => 'profile.edit', 'uses' => 'ProfileController@edit']);
	Route::put('profile', ['as' => 'profile.update', 'uses' => 'ProfileController@update']);
	Route::put('profile/password', ['as' => 'profile.password', 'uses' => 'ProfileController@password']);

	// Products
	Route::get('/products','ProductController@index')->name('products.index');	
	Route::get('/products/create','ProductController@create')->name('products.create');
	Route::patch('/products/{product}','ProductController@update')->name('products.update');
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
	Route::get('/types/{type}/edit','TypeController@edit')->name('types.edit');
	Route::patch('/types/{type}','TypeController@update')->name('types.update');

	Route::post('/types/getcategory','TypeController@getCategory')->name('types.getCategory');

	// Colors
	Route::get('/colors','ColorController@index')->name('colors.index');
	Route::post('/colors','ColorController@store')->name('colors.store');
	Route::get('/colors/create','ColorController@create')->name('colors.create');
	Route::delete('/colors/{color}','ColorController@destroy')->name('colors.destroy');
	Route::get('/colors/{color}/edit','ColorController@edit')->name('colors.edit');
	Route::patch('/colors/{color}','ColorController@update')->name('colors.update');

	// Images
	Route::get('/Images','ImageController@index')->name('images.index');

	Route::get('/orders','OrderController@index')->name('orders.index');
	Route::post('/orders/fullList','OrderController@getListJson');
	Route::post('/orders/update','OrderController@update');


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

// Product View
Route::get('/products/{product}','ProductController@show')->name('products.show');

// Type View
Route::get('/types/{type}','TypeController@show')->name('types.show');


