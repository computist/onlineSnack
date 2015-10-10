(function () {
    'use strict';
    angular
        .module('umi')
        .controller('NavBarController', NavBarController);

    NavBarController.$inject = ['$scope', '$location', 'AuthenticationService'];

    function NavBarController($scope, $location, AuthenticationService) {
    	var navBarCtrl = this;
    	navBarCtrl.logout = logout;

    	function logout() {
    		AuthenticationService.ClearCredentials();
    		$location.url('/');
        }
    };
})();