app.controller('navBarController', ['$scope', '$rootScope', 'httpService', function($scope, $rootScope, httpService){


	$scope.login = function() {
		httpService.login({
			username: $scope.email, 
			password: $scope.password
		}).success(function(data) {
			if (data.error) {
				$scope.error = "success"
			} else {
				$scope.error = 'failed'
			}
		});
	}
}])