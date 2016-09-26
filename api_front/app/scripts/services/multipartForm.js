angular.module('apiFrontApp').service('multipartForm',['$http','Restangular',function($http, Restangular){
	this.post = function(uploadUrl, data){
		var fd = new FormData();
		for(var key in data)
			fd.append(key, data[key]);
		Restangular.one('company')
.withHttpConfig({transformRequest: angular.identity})
.customPOST(fd, '', undefined, {'Content-Type': undefined}).then(function(response){
	Restangular.service('company').getList().then(function(response){
            CompanyCtrl.encuestas=response; 
            CompanyCtrl.newsingle={};
          });
});
	}
}])