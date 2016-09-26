<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::group(['middleware'=>'cors'],function(){
	Route::post('/authlogin','ApiAuthController@userAuth');
	//encuestas routes begin
	Route::get('/encuestas','EncuestasController@index');
	Route::post('/encuestas','EncuestasController@saved');
	Route::put('/encuestas/{id}','EncuestasController@edit');
	Route::get('/encuestas_delete/{id}','EncuestasController@delete');
	Route::get('/encuestas/{id}','EncuestasController@showedit');
	//encuestas routes end
	//preguntas routes begin
	Route::get('/encuestas/{id}/preguntas','PreguntasController@index');
	Route::put('/preguntas/{id}','PreguntasController@edit');
	Route::post('/encuestas/{id}/preguntas','PreguntasController@saved');
	//preguntas routes end
	//users routes
	Route::get('/users','UsersController@index');
	Route::post('/users','UsersController@saved');
	Route::put('/users/{id}','UsersController@edit');
	Route::get('/users_delete/{id}','UsersController@delete');
	Route::get('/users/{id}','UsersController@showedit');
	//users routes end
	//company routes
	Route::get('/company','CompanyController@index');
	Route::post('/company','CompanyController@saved');
	Route::post('/company_edit/{id}','CompanyController@edit');
	Route::get('/company_delete/{id}','CompanyController@delete');
	Route::get('/company/{id}','CompanyController@showedit');
	//company routes end
});