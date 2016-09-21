'use strict'
angular.module('authService',[])
.factory('sessionControl', function(){
	return {
		get: function(key){
			return sessionStorage.getItem(key);
		},
		set:function(key, value){
			return sessionStorage.setItem(key,value);
		},
		unset:function(key){
			return sessionStorage.removeItem(key);
		}
	}
})
.factory('authUser', function($auth,sessionControl, toastr, $location){
	var cacheSession = function(email, username, avatar){
		sessionControl.set('userIsLogin',true);
		sessionControl.set('email',email);
		sessionControl.set('username',username);
		sessionControl.set('avatar',username);
	}
	var uncacheSession = function(){
		sessionControl.unset('userIsLogin');
		sessionControl.unset('email');
		sessionControl.unset('username');
		sessionControl.unset('avatar');
	}
	var login= function(loginForm){
		$auth.login(loginForm).then( function(response){
			cacheSession(response.data.user.email,response.data.user.name,loginForm.avatar);
			$location.path('/dashboard');
			toastr.success('Sesion Iniciada con exito','Mensaje')
		}, function(error){
			toastr.error(error.data.error,'Error');
			console.log(error);
		});
	};
	return{
		loginApi: function (loginForm){
			login(loginForm)
		},
		isLoggedIn: function(){
			return sessionControl.get('userIsLogin')!==null;
		},
		logout: function(){
			$auth.logout();
			uncacheSession();
			toastr.success('session Cerrada con exito','mensaje');
			$location.path('/')
		}
	}
});