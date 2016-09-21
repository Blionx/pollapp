'use strict';

/**
 * @ngdoc function
 * @name apiFrontApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the apiFrontApp
 */
angular.module('apiFrontApp')
  .controller('AboutCtrl', function () {
    var ctrl = this;
    ctrl.menuTemplate = {
    	url: 'views/menu.html'
    }
  });
