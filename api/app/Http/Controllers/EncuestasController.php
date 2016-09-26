<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Encuestas;
use App\Preguntas;
use App\Opciones;

class EncuestasController extends Controller
{
	public function index(request $request){
		$encuestas = Encuestas::where('status','=','1')->get();
		return response()->json($encuestas);
	}
	public function edit(request $request, $id){
		$name = $request->all('');		
		$encuestas = Encuestas::find($id);
		$encuestas->name = $name['name'];
		$encuestas->save();
	
		return response()->json("ok");
	}
	public function showedit(Request $request, $id){
		$single = Encuestas::find($id);
		return Response()->json($single);
	}
	public function saved(request $request){
		$info = $request->all();
		$newenc = new Encuestas;
		$newenc->name = $info['name'];
		$newenc->status = 1;
		$newenc->save();
		return response()->json("ok");
	}
	public function delete(Request $request,$id){
		$oldenc= Encuestas::find($id);
		$oldenc->status='0';
		$oldenc->save();
		return response()->json("ok");
	}
}