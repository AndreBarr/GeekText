const ProfileComponent = {
    templateUrl: "/app/profile/profile.component.html",
    controller: function (api) {
        var $ctrl = this;
        $ctrl.myBooks = [];
        $ctrl.myInfo = null;
        $ctrl.addrs = [];
        $ctrl.creditCards = [];

        $ctrl.saveInfo = function () {
            api.saveUserInfo($ctrl.myInfo)
            .then(function (response) {
            }, function (response) {
            	//404 not found
            });

            api.saveShippingInfo($ctrl.addrs)
            .then(function (response) {
            }, function (response) {
            	//404 not found
            });

            api.saveCreditCardInfo($ctrl.creditCards)
            .then(function (response) {
            }, function (response) {
                //404 not found
            });
        }

        $ctrl.addAddress = function () {
        	$ctrl.addrs.push({});
        }

        $ctrl.deleteAddress = function (index) {
        	$ctrl.addrs.splice(index, 1);
        }

        $ctrl.addCreditCard = function () {
            $ctrl.creditCards.push({});
        }

        $ctrl.deleteCreditCard = function (index) {
            $ctrl.creditCards.splice(index, 1);
        }

        $ctrl.changePassword = function () {
        	if ($ctrl.newPassword !== $ctrl.confirmedPassword)
                return;

        	api.changeUserPassword($ctrl.oldPassword, $ctrl.newPassword)
        		.then(function (response) {
                    if (response.data === -1)
                    {
                        $ctrl.incorrect = true;
                        $ctrl.notNewPass = false;
                        //alert("Old password is incorrect");
                    }
                    else if (response.data === -2)
                    {
                    	$ctrl.incorrect = false;
                    	$ctrl.notNewPass = true;
                    }
                    else if (response.data === 1)
                    {
                        $ctrl.incorrect = false;
                        $ctrl.notNewPass = false;
                        alert("Password has been changed!");
                    }
                }, function (response) {
                    //404 not found
                });
        }

        function getUserInfo() {
            api.getUserInfo().then(function (response) {
                $ctrl.myInfo = response.data;
            }, function (response) {
                //404 not found
            });

            api.getMyProfileBooks().then(function (response) {
                $ctrl.myBooks = response.data;
            }, function (response) {
                //404 not found
            });

            api.getShippingInfo().then(function (response) {
                $ctrl.addrs = response.data;
            }, function (response) {
                //404 not found
            });

            api.getCreditCardInfo().then(function (response) {
                $ctrl.addrs = response.data;
            }, function (response) {
                //404 not found
            });
        }

        this.$onInit = function () {
            getUserInfo();
        }


    }
};