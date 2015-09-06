app.factory('items', ['$http', function($http) {
	var url = 'http://52.10.176.132/list';
  return $http.get(url)
            .success(function(data) {
              return data;
            })
            .error(function(err) {
              return err;
            });
}]);