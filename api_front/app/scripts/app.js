'use strict';

/**
 * @ngdoc overview
 * @name apiFrontApp
 * @description
 * # apiFrontApp
 *
 * Main module of the application.
 */
angular
  .module('apiFrontApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'satellizer',
    'authService',
    'toastr',
    'restangular'
  ])
  .config(function ($routeProvider, $authProvider, RestangularProvider) {
    $authProvider.loginUrl ='http://localhost:8000/authlogin';
    RestangularProvider.setBaseUrl('http://localhost:8000');
    $routeProvider
      .when('/dashboard', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main',
      })
      .when('/usuarios',{
        templateUrl:'views/usuarios/index.html',
        controller:'UserCtrl',
        controllerAs:'enc'
      })
      .when('/company',{
        templateUrl:'views/company/index.html',
        controller:'CompanyCtrl',
        controllerAs:'comp'
      })
      .when('/encuestas', {
        templateUrl: 'views/encuestas/index.html',
        controller: 'EncuestasCtrl',
        controllerAs: 'enc'
      })
      .when('/',{
        templateUrl:'views/login.html',
        controller:'LoginCtrl',
        controllerAs:'login'
      })
      .otherwise({
        redirectTo: '/dashboard'
      });
  })
  .run(function($rootScope, $location, authUser,toastr){
    $rootScope.$on('$routeChangeStart',function(){
      if($location.path()!='/' && !authUser.isLoggedIn()){
        toastr.error('Debe Iniciar sesion para poder continuar.', "alerta"); 
        $location.path('/');
      }
    });
  });
