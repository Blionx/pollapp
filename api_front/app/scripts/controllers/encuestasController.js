'use strict'

angular.module("apiFrontApp")
.controller("EncuestasCtrl", function(Restangular, toastr){
var ctrl = this;
ctrl.edit = false;
ctrl.new = false;
ctrl.newsingle ={};
ctrl.menuTemplate = {url: 'views/menu.html'};
Restangular.service('encuestas').getList().then(function(response){
    ctrl.encuestas=response; 
});
ctrl.eliminar = function(id){
	Restangular.one('encuestas_delete',id).get().then(function(response){
		if(response=="ok"){
			Restangular.service('encuestas').getList().then(function(response){
            ctrl.encuestas=response; 
          });
		}
	});
}
ctrl.showedit = function(id){
	Restangular.one('encuestas',id).get().then(function(response){
		ctrl.single=response;
		ctrl.edit = true;
	});
}
ctrl.put = function(){
	ctrl.single.put().then(function(response){
		if(response=="ok"){
			ctrl.edit = false;
			toastr.success('Encuesta Editada Con Éxito','mensaje');
			Restangular.service('encuestas').getList().then(function(response){
            ctrl.encuestas=response; 
          });
		}
	});
}
ctrl.guardar = function(){
	ctrl.encuestas.post( ctrl.newsingle).then(function(response){
		if(response == "ok"){
			ctrl.new = false;
			Restangular.service('encuestas').getList().then(function(response){
            ctrl.encuestas=response; 
          });
		}
	});
}
});