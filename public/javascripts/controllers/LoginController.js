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
                if (response.status == 0) {
                    AuthenticationService.SetCredentials(loginCtrl.username, loginCtrl.password);
                    $(".modal").modal("hide");
                } else if (response.status == 1) {
                    loginCtrl.error = "Your E-mail or Password is wrong. Please try again.";
                } else if (response.status == 2) {
                    loginCtrl.error = "Invalid input. Please try again";
                } else {
                    loginCtrl.error = "Log in faild. Please try again";
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