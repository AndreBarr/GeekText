const NavbarComponent = {
    templateUrl: "/app/navbar/navbar.component.html",
    controller: function ($rootScope, api) {
        let $ctrl = this;

        $ctrl.logged = api.isLoggedIn();

        $rootScope.$on('login-change', function () {
            $ctrl.logged = api.isLoggedIn();
        });

        $ctrl.logOut = function () {
            api.logOut();
        }
    }
};