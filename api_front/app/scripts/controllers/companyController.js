'use strict'

angular.module("apiFrontApp")
.controller("CompanyCtrl", function(Restangular, toastr, multipartForm){
var ctrl = this;
ctrl.edit = false;
ctrl.new = false;
ctrl.newsingle ={};
ctrl.menuTemplate = {url: 'views/menu.html'};
Restangular.service('company').getList().then(function(response){
    ctrl.encuestas=response; 
});
ctrl.eliminar = function(id){
	Restangular.one('company_delete',id).get().then(function(response){
		if(response=="ok"){
			Restangular.service('company').getList().then(function(response){
            ctrl.encuestas=response; 
          });
		}
	});
}
ctrl.showedit = function(id){
	Restangular.one('company',id).get().then(function(response){
		ctrl.single=response;
		ctrl.single.logo2 = ctrl.single.logo;
		ctrl.single.logo ='';
		
		ctrl.edit = true;
	});
}
ctrl.put = function(){
	ctrl.formsin = {name:ctrl.single.name, email:ctrl.single.email, logo:ctrl.single.logo};
	var fd = new FormData();
		
			for(var key in ctrl.formsin)
			fd.append(key, ctrl.formsin[key]);

	Restangular.one('company_edit',ctrl.single.id).withHttpConfig({transformRequest: angular.identity})
.customPOST(fd, '', undefined, {'Content-Type': undefined}).then(function(response){
		if(response=="ok"){
			ctrl.edit = false;
			toastr.success('Encuesta Editada Con Éxito','mensaje');
			Restangular.service('company').getList().then(function(response){
            ctrl.encuestas=response; 
          });
		}
	});
}
ctrl.guardar = function(){
	var fd = new FormData();
		for(var key in ctrl.newsingle)
			fd.append(key, ctrl.newsingle[key]);
		Restangular.one('company')
.withHttpConfig({transformRequest: angular.identity})
.customPOST(fd, '', undefined, {'Content-Type': undefined}).then(function(response){
	ctrl.new = false;
	Restangular.service('company').getList().then(function(response){
            ctrl.encuestas=response; 
            ctrl.newsingle={};
          });
});
		
	
}
});