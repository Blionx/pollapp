'use strict';

/**
 * @ngdoc function
 * @name apiFrontApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the apiFrontApp
 */
angular.module('apiFrontApp')
  .controller('MainCtrl', function () {
    var ctrl = this;
    ctrl.menuTemplate = {
    	url: 'views/menu.html'
    }
  });
