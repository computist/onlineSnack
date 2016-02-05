(function () {
    'use strict';

    angular
        .module('umi')
        .controller('ModalInstanceController', ModalInstanceController);

    ModalInstanceController.$inject = ['$scope', '$uibModalInstance', 'detail'];
    function ModalInstanceController($scope, $uibModalInstance, detail) {
    	var modalInstanceCtrl = this;
    	modalInstanceCtrl.itemDetail = detail;
    	modalInstanceCtrl.cancel = cancel;

    	function cancel() {
    		$uibModalInstance.dismiss('cancel');
    	};

    };

})();