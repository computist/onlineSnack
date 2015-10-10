(function () {
    'use strict';

    angular
        .module('umi')
        .controller('ItemController', ItemController);

    ItemController.$inject = ['$scope', 'ItemsService', '$routeParams'];

	function ItemController($scope, ItemsService, $routeParams) {
	  emails.success(function(data) {
	    $scope.item = data[$routeParams.id];
	  });


	  $scope.info = null;
	  $scope.openDetailPage = function(name){
	  	$scope.info = name;
	  };

	  //function buy 
	};
})();