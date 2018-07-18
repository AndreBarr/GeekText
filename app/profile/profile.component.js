const ProfileComponent = {
    templateUrl: "/app/profile/profile.component.html",
    controller: function (api) {
        var $ctrl = this;
        $ctrl.myBooks = [];


        function getData() {
            api.getMyProfileBooks().then(function (response) {
                $ctrl.myBooks = response.data;
            }, function (response) {
                //404 not found
            });
        }


        this.$onInit = function () {

            getData();

        }


    }
};