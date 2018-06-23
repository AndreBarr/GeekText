const LoginComponent = {
    templateUrl: "GeekText/app/login/login.component.html",
    controller: function (api) {
    	var $ctrl = this;
    	$ctrl.onSubmit = function(){
    		api.login($ctrl.username, $ctrl.password);
    	};

        $ctrl.onCreate = function(){
                alert('Do Something');
                api.createAcc($ctrl.newUsername, $ctrl.newPassword, $ctrl.confirmedPassword);
        };
    }
};