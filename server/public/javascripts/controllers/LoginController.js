(function () {
    'use strict';

    angular
        .module('umi')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$location', 'AuthenticationService', 'FlashService'];
    function LoginController($location, AuthenticationService, FlashService) {
        var loginCtrl = this;

        loginCtrl.login = login;


        function login() {
            AuthenticationService.Login(loginCtrl.username, loginCtrl.password, function (response) {
                if (response.status == "login success") {
                    AuthenticationService.SetCredentials(loginCtrl.username, loginCtrl.password);
                    $(".modal").modal("hide");
                } else {
                    loginCtrl.error = response.status;
                    FlashService.Error(response.status);
                }
            });
        };

        function switchToSignup() {
            $(".modal").modal("hide");
            $(".modal#signup").modal("show");
        }
    }

})();