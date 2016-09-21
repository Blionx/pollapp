'use strict'
angular.module('apiFrontApp').controller('menuCtrl', function($scope,$location, authUser,sessionControl){
	var ctrl = this;
	ctrl.isActive = function(viewLocation){
		return viewLocation === $location.path();
	}
	ctrl.isLogin = authUser.isLoggedIn();
	$scope.$watch(function(){
		return authUser.isLoggedIn();
	},function(newval){
		if(typeof newval !== 'undefined'){
			ctrl.isLoggedIn = authUser.isLoggedIn();
		}
	});
	ctrl.logout = function(){
		authUser.logout();
	};
	ctrl.user ={
		email: sessionControl.get('email'),
		name: sessionControl.get('username'),
		avatar:sessionControl.get('avatar')
	}
})