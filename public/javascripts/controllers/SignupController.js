(function () {
    'use strict';

    angular
        .module('umi')
        .controller('SignupController', SignupController);

    SignupController.$inject = ['UserService', '$location', '$rootScope'];
    function SignupController(UserService, $location, $rootScope) {
        var signupCtrl = this;

        signupCtrl.signup = signup;
        signupCtrl.switchToLogin = switchToLogin;
        function signup() {
            UserService.Create(signupCtrl.user)
                .then(function (response) {
                     if (response.data.status == 0) {
                        $(".modal").modal("hide");
                    } else if (response.data.status == 1){
                        signupCtrl.error = "E-mail address has already exsit";
                    } else if (response.data.status == 2){
                        signupCtrl.error = "Please type your correct E-mail address";
                    } else if (response.data.status == 3) {
                        signupCtrl.error = "Password needs 1 Capitalized letter, one uncapitalized letter,"
                        + "and leagnth is greatter than 8 digits";
                    } else if (response.data.status == 4) {
                        signupCtrl.error = "Sign Up Failed";
                    };
                });
        };

        function switchToLogin() {
            $(".modal#signup").modal("hide"),
            $(".modal#login").modal("show");
        };

    }

})();
