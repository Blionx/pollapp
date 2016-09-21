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
    'toastr'
  ])
  .config(function ($routeProvider, $authProvider) {
    $authProvider.loginUrl ='http://localhost:8000/authlogin';
    $routeProvider
      .when('/dashboard', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl',
        controllerAs: 'about'
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
