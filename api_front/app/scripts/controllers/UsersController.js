'use strict'

angular.module("apiFrontApp")
.controller("UserCtrl", function(Restangular, toastr){
var ctrl = this;
ctrl.edit = false;
ctrl.new = false;
ctrl.newsingle ={};
ctrl.options =[{id:"1",name:"Administrador"},{id:"2",name:"Usuario"}];
ctrl.menuTemplate = {url: 'views/menu.html'};
Restangular.service('users').getList().then(function(response){
    ctrl.encuestas=response; 
});
Restangular.service('company').getList().then(function(response){
	ctrl.company = response;
});
ctrl.eliminar = function(id){
	Restangular.one('users_delete',id).get().then(function(response){
		if(response=="ok"){
			Restangular.service('users').getList().then(function(response){
            ctrl.encuestas=response; 
          });
		}
	});
}
ctrl.showedit = function(id){
	Restangular.one('users',id).get().then(function(response){
		ctrl.single=response;
		if(ctrl.single.type==1){
			ctrl.single.type={id:1,name:"Administrador"};
		}
		if(ctrl.single.type==2){
			ctrl.single.type={id:2,name:"Usuario"};
		}
		
		ctrl.edit = true;
	});
}
ctrl.put = function(){
	ctrl.single.put().then(function(response){
		if(response=="ok"){
			ctrl.edit = false;
			toastr.success('Encuesta Editada Con Éxito','mensaje');
			Restangular.service('users').getList().then(function(response){
            ctrl.encuestas=response; 
          });
		}
	});
}
ctrl.guardar = function(){
	ctrl.encuestas.post( ctrl.newsingle).then(function(response){
		if(response == "ok"){
			ctrl.new = false;
			Restangular.service('users').getList().then(function(response){
            ctrl.encuestas=response; 
            ctrl.newsingle={};
          });
		}
	});
}
});