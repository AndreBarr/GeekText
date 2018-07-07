const LoginComponent = {
    templateUrl: "/app/login/login.component.html",
    controller: function ($state, api) {
        var $ctrl = this;

        $ctrl.onSubmit = function () {
            api.login($ctrl.username, $ctrl.password)
                .then(function (response) {
                    if (response.data === -1)
                    {
                        alert("Username or Password was incorrect");
                    }
                    else if (response.data === -2)
                    {
                        alert("One or more of the input fields is empty");
                    }
                    else
                    {
                        $state.go("home");
                    }
                }, function (response) {
                    //404 not found
                });
        };

        $ctrl.onCreate = function () {

            if ($ctrl.newPassword !== $ctrl.confirmedPassword)
                return;

            api.register($ctrl.newUsername, $ctrl.newPassword, $ctrl.newEmail)
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