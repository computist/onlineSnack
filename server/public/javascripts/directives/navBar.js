app.directive('navBar', function() { 
  return { 
    restrict: 'E', 
    scope: {}, 
    templateUrl: 'views/navBar.html',
    controller: 'navBarController'
  }; 
});