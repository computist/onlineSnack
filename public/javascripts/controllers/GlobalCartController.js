(function () {
    'use strict';

    angular
        .module('umi')
        .controller('GlobalCartController', GlobalCartController);

    GlobalCartController.$inject = ['$scope'];
    function GlobalCartController($scope) {
    	var globalCartCtrl = this;
    	globalCartCtrl.cancel = cancel;

    	function cancel() {
    	};

    };

})();