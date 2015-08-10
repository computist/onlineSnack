(function() {
	var app = angular.module('itemCollection', ['ui.bootstrap']);



	app.controller('StoreController', ['$http','$scope','$modal',  function($http, $scope, $modal){
		$http.get('https://webster.cs.washington.edu/students/yw47/new/www/json/product.php').success(function(data){
			$scope.products = data;
		});

		$scope.sortField = 'popular';

		$scope.openDetailPage = function () {
		    var modalInstance = $modal.open({
		      templateUrl: 'myModalContent.html',
		      controller: 'ModalInstanceCtrl',
		    });
	  	};

	}]);

	app.controller('CarouselCtrl', function ($scope) {
	  $scope.myInterval = 5000;
	  var slides = $scope.slides = [];
	  $scope.addSlide = function() {
	    slides.push({
	      text: ['More','Extra','Lots of'][slides.length % 4] + ' ' +
        	['food', 'food', 'food'][slides.length % 4]
	    });
	  };
	  for (var i=0; i<3; i++) {
	    $scope.addSlide();
	  }
	});


	// Please note that $modalInstance represents a modal window (instance) dependency.
	// It is not the same as the $modal service used above.

	app.controller('ModalInstanceCtrl', function ($scope, $modalInstance) {

		$scope.addToCart = function() {

			
		}
		$scope.cancel = function () {
		  $modalInstance.dismiss('cancel');
		};
	});


})();