<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Company;
use Illuminate\Support\Facades\Hash;

class CompanyController extends Controller
{
	public function index(request $request){
		$users = Company::get();
		return response()->json($users);
	}
	public function edit(request $request, $id){
		$info = $request->all();
		$newusers = Company::find($id);
		if(isset($_FILES['logo'])){
			$img = $_FILES['logo'];
			$ruta_imagen = "company_img/";
			if(!is_dir($ruta_imagen)){
                        mkdir($ruta_imagen, 0700, true);
                    }
		    $imagen = rand(20000, 9999)."-".$img["name"];
		    move_uploaded_file($img["tmp_name"], $ruta_imagen.$imagen);
		    $dirimg= $ruta_imagen.$imagen;
		
		if(is_file($newusers->logo) ){
			unlink($newusers->logo);
		}
		$newusers->logo = $dirimg;
		}

		$newusers->name = $info['name'];
		$newusers->email = $info['email'];		
		$newusers->save();
		return response()->json("ok");
	}
	public function showedit(Request $request, $id){
		$single = Company::find($id);
		return Response()->json($single);
	}
	public function saved(request $request){
		$name = $request->all();
		$img = $_FILES['logo'];
			$ruta_imagen = "company_img/";
			if(!is_dir($ruta_imagen)){
                        mkdir($ruta_imagen, 0700, true);
                    }
		    $imagen = rand(20000, 9999)."-".$img["name"];
		    move_uploaded_file($img["tmp_name"], $ruta_imagen.$imagen);
		    $dirimg= $ruta_imagen.$imagen;
		$newusers = new Company;
		$newusers->name = $name['name'];
		$newusers->email = $name['email'];
		$newusers->logo = $dirimg;
		$newusers->save();
		return response()->json("ok");
	}
	public function delete(Request $request,$id){
		$oldenc= Company::find($id);
		$oldenc->delete();
		return response()->json("ok");
	}
}