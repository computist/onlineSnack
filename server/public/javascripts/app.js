var app = angular.module('umi', ['ngRoute','rzModule']);

app.config(function ($routeProvider) { 
  $routeProvider 
    .when('/', { 
      controller: 'MainController', 
      templateUrl: 'views/home.html' 
    }) 
    .otherwise({ 
      redirectTo: '/' 
    }); 
});