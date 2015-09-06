app.controller('ItemController', ['$scope', 'items', '$routeParams', function($scope, items, $routeParams) {
  emails.success(function(data) {
    $scope.item = data[$routeParams.id];
  });


  $scope.info = null;
  $scope.openDetailPage = function(name){
  	$scope.info = name;
  };

  //function buy 
}]);