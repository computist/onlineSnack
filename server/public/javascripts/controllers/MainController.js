(function () {
    'use strict';
    angular
        .module('umi')
        .controller('MainController', MainController);

    MainController.$inject = ['$scope', '$http'];
    function MainController($scope, $http) {
        var mainCtrl = this;
        mainCtrl.selectedTabKey = "All";
        mainCtrl.setCategory = setCategory;
        mainCtrl.categoryList = categories;
        // mainCtrl.change = change;
        // mainCtrl.select = select;
        mainCtrl.category = ""
        mainCtrl.loaded = false;
        mainCtrl.noItem = false;

        // var pendingTask;

        fetch();


        function setCategory(category) {
            mainCtrl.loaded = false;
            mainCtrl.noItem = false;
            mainCtrl.selectedTabKey = category.name;
            if(mainCtrl.selectedTabKey == "All"){
                mainCtrl.category = "";
            } else {
                mainCtrl.category = "?name=" + mainCtrl.selectedTabKey;
            }
            fetch();
        };

        function fetch() {
            $http.get("http://52.10.176.132/list" + mainCtrl.category)
            .success(function(response){ 
                $scope.items = response; 
                mainCtrl.loaded = true;
                if (!$scope.items[0]) {
                    mainCtrl.noItem = true;
                };
            });
        };


        // function updateItem(item) {
        //     $http.get("http")
        // }
        // Oct 4
        // function change() {
        //     if(pendingTask){
        //         clearTimeout(pendingTask);
        //     }
        //     pendingTask = setTimeout(fetchRelated, 800);
        // };

        // function fetchRelated() {
        //     $http.get("http://52.10.176.132/list?name=" + $scope.search)
        //     .success(function(response){
        //         mainCtrl.searchItems = response;
        //     });

        //     $http.get("http://52.10.176.132/list?shop_name=" + $scope.search)
        //     .success(function(response){
        //         mainCtrl.searchShops = response;
        //     });
        // };
        

        // function select() {
        
        // };
    };

    var categories = [{
            name: "All"
        }, {
            name: "北京"
        },{
            name: "四川"
        },{
            name: "湖北"
        },{
            name: "扯淡的选项"
        }
    ];
})();