const ProfileComponent = {
    templateUrl: "/app/profile/profile.component.html",
    controller: function (api) {
        var $ctrl = this;
        $ctrl.myBooks = [];

        $ctrl.saveInfo = function () {
            api.saveUserInfo($ctrl.myInfo.UserName, $ctrl.myInfo.Email).then(function (response) {

            });

            api.saveHomeAddr($ctrl.newHStreetAddr, $ctrl.newHomeState, $ctrl.newHomeCity, $ctrl.newHomeZip).then(function (response) {

            });

            api.saveShipAddr($ctrl.newSStreetAddr, $ctrl.newShipState, $ctrl.newShipCity, $ctrl.newShipZip).then(function (response) {

            });
        }

        function getData() {
            api.getMyProfileBooks().then(function (response) {
                $ctrl.myBooks = response.data;
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
        }

        this.$onInit = function () {

            getData();
            getUserInfo();

        }


    }
};