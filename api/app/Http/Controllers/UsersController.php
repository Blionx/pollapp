<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\User;
use App\UserCompany;
use Illuminate\Support\Facades\Hash;

class UsersController extends Controller
{
	public function index(request $request){
		$users = User::where('status','=','1')->get();
		return response()->json($users);
	}
	public function edit(request $request, $id){
		$name = $request->all('');		
		$users = User::find($id);
		$users->name = $name['name'];
		$users->email = $name['email'];
		$users->type = $name['type'];
		if($name['password']!=$users->password){
			$users->password = Hash::make($name['password']);
		}	
		$users->save();
	
		return response()->json("ok");
	}
	public function showedit(Request $request, $id){
		$single = User::find($id);
		$relation = $single->company();
		$company = Company::find($relation->company_id)
		return Response()->json($single);
	}
	public function saved(request $request){
		$name = $request->all();
		$newusers = new User;
		$newusers->name = $name['name'];
		$newusers->email = $name['email'];
		$newusers->type = $name['type'];
		$newusers->password = Hash::make($name['password']);
		$newusers->status = 1;	
		$newusers->save();
		$newusercomp = new UserCompany;
		$newusercomp->users_id = $newusers->id;
		$newusercomp->company_id = $name['company_id'];
		$newusercomp->save();
		return response()->json("ok");
	}
	public function delete(Request $request,$id){
		$oldenc= User::find($id);
		$oldenc->status='0';
		$oldenc->save();
		return response()->json("ok");
	}
}