(function () {
    'use strict';
    angular
        .module('umi')
        .controller('NavBarController', NavBarController);

    NavBarController.$inject = ['$scope','$rootScope', '$location', 'AuthenticationService', '$route','$uibModal'];

    function NavBarController($scope, $rootScope, $location, AuthenticationService, $route, $uibModal) {
    	var navBarCtrl = this;
    	navBarCtrl.logout = logout;
        navBarCtrl.toggleGlobalCart = toggleGlobalCart;
        navBarCtrl.openModel = openModel;
        $rootScope.globalCartOpened = false;
        
    	function logout() {
    		AuthenticationService.ClearCredentials();
    		$location.url('/');
            $route.reload();
        };

        function toggleGlobalCart() {
            $rootScope.globalCartOpened = !$rootScope.globalCartOpened;
        };

        function openModel(name) {
            var newname = name.charAt(0).toUpperCase() + name.slice(1);
            $uibModal.open({
                templateUrl: '../../views/' +name + 'Modal.html',
                controller: newname + 'Controller as ' + name + 'Ctrl',
            })
        }
    };
})();