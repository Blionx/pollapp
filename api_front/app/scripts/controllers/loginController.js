'use strict'
angular.module('apiFrontApp').controller('LoginCtrl',function(authUser){
	var ctrl = this;
	ctrl.loginForm = {
		email:'',
		password:''
	};
	ctrl.login = function(){
		authUser.loginApi(ctrl.loginForm);
	}
})