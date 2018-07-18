const LoginComponent = {
    templateUrl: "/app/login/login.component.html",
    controller: function ($state, api) {
        var $ctrl = this;

        $ctrl.onSubmit = function () {
                api.login($ctrl.username, $ctrl.password)
                .then(function (response) {
                    if (response.data === -1)
                    {
                        $ctrl.incorrect = true;
                        $ctrl.notFound = false;
                        //alert("Username or Password was incorrect");
                    }
                    else if (response.data === -2)
                    {
                        $ctrl.notFound = true;
                        $ctrl.incorrect = false;
                        //alert("Username was not found in the database");
                    }
                    else
                    {
                        $ctrl.incorrect = false;
                        $ctrl.notFound = false;
                        $state.go("books");
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
                    $state.go("books");
                }, function (response) {
                    alert("Error creating account.");
                });
        };


        $ctrl.$onDestroy = function () {
            $('.modal-backdrop').remove();
        }

    }
};