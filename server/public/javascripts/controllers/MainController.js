app.controller('MainController', ['$scope', 'items', function($scope, items) {
  items.success(function(data) {
    $scope.items = data;
  });

  $scope.sortField = 'popular';
  $scope.filters = {};

  $scope.spicySlider = {
  	floor: 0,
  	ceil: 5
  };

  $scope.onSliderChange = function(){
  		$scope.filters.spicy = $scope.spicySlider
  };

}]);