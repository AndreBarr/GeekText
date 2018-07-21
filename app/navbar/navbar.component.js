const NavbarComponent = {
    templateUrl: "/app/navbar/navbar.component.html",
    controller: function ($rootScope, $state, api) {
        let $ctrl = this;

        $ctrl.logged = api.isLoggedIn();
        $ctrl.onSearch = function(){
            $state.go('books', {search: $ctrl.search});
            console.log($ctrl.search)
        };

        $rootScope.$on('login-change', function () {
            $ctrl.logged = api.isLoggedIn();
        });

        $rootScope.$on('$viewContentLoaded', function (event) {
            angular.element('.navbar-collapse.collapse').removeClass('show');
        });

        $ctrl.logOut = function () {
            api.logOut();
            $state.go('book');
        }
                
    }
};