(function () {
    'use strict';

    angular
        .module('umi')
        .factory('ItemsService', ItemsService);

    ItemsService.$inject = ['$scope','$http'];
	function ItemsService($scope, $http) {
		var url = 'http://52.10.176.132/list' + $scope.category;
  			return $http.get(url)
	            .success(function(data) {
	              return data;
	            })
	            .error(function(err) {
	              return err;
            });
	};
})();