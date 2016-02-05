(function () {
    'use strict';

    angular
        .module('umi')
        .factory('ItemService', ItemService);

    ItemService.$inject = ['$http'];
	function ItemService($http) {
		var service = {};

        service.getItemDetails = getItemDetails;

        return service;


        function getItemDetails(number) {
            return $http.get('http://52.10.176.132/details?id=' + number)
            	.then(handleSuccess, handleError('Error getting item detail'));
        }

        function handleSuccess(data) {
            return data;
        }

        function handleError(error) {
            return function () {
                return { success: false, message: error };
            };
        }
	};
})();