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
            signupCtrl.dataLoading = true;
            UserService.Create(signupCtrl.user)
                .then(function (response) {
                    if (response.status == "200") {
                        $(".modal").modal("hide");
                    } else {
                        signupCtrl.error = response.status;
                        signupCtrl.dataLoading = false;
                    }
                });
        };

        function switchToLogin() {
            $(".modal#signup").modal("hide"),
            $(".modal#login").modal("show");
        };

    }

})();
