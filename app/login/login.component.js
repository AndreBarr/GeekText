const LoginComponent = {
    templateUrl: "/app/login/login.component.html",
    controller: function (api) {
    	var $ctrl = this;
    	$ctrl.onSubmit = function(){
    		
    		/*if ($ctrl.username == "Andre@a" && $ctrl.password == "password")
    		{
    			alert('Login Successful!');
    		}*/

    		api.login($ctrl.username, $ctrl.password);
    	};
    }
};