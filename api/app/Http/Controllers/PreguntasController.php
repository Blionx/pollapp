<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Encuestas;
use App\Preguntas;
use App\Opciones;

class PreguntasController extends Controller
{
	public function index(Request $request,$id){
		$preguntas= Encuestas::find($id)->preguntas;
		return Response()->json($preguntas);
	}
	public function saved(Request $request, $id){
		$info = $request->all();
		$newpreg = new Preguntas;
		$newpreg->name = $info['name'];
		$newpreg->status = "1";
		$newpreg->encuestas_id=$id;
		$newpreg->save();
		return Response()->json("ok");
	}
	public function edit(Request $request,$id){
		$info = $request->all();
		$oldpreg = Preguntas::find($id);
		$oldpreg->name=$info['name'];
		$oldpreg->save();
		return Response()->json($oldpreg);
	}
}