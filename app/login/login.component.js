const LoginComponent = {
    templateUrl: "/app/login/login.component.html",
    controller: function ($state, api) {
        var $ctrl = this;

        $ctrl.onSubmit = function () {
            api.login($ctrl.username, $ctrl.password);
        };

        $ctrl.onCreate = function () {

            if ($ctrl.newPassword !== $ctrl.confirmedPassword)
                return;

            api.register($ctrl.newUsername, $ctrl.newPassword)
                .then(function (response) {
                    alert("Account has been created");
                    $state.go("home");
                }, function (response) {
                    alert("Error creating account.");
                });
        };


        $ctrl.$onDestroy = function () {
            $('.modal-backdrop').remove();
        }

    }
};