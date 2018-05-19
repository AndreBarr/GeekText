(function () {
    'use strict';
    let module = angular.module('app', ['ngAnimate', 'ngSanitize', 'ui.router']);

    //Declare all angular components here
    module.component('appNavbar', NavbarComponent);
    module.component('appFooter', FooterComponent);
    module.component('appHome', HomeComponent);
    module.component('appAbout', AboutComponent);

    //Configure angular here
    module.config(function ($locationProvider, $urlRouterProvider, $stateProvider) {
        // $locationProvider.html5Mode(true);
        $urlRouterProvider.otherwise('/');

        //List all URLs for angular here SEE: Angular ui-router docs
        //Angular makes the website a SPA (single page app)
        //So the whole web page is never reloaded, only the content inside the page is replaced
        //Angular handles replacing the content based on the URL
        $stateProvider.state("home", {
            url: "/",
            component: 'appHome'
        })
        .state("about", {
            url: "/about",
            component: "appAbout"
        });

    });

})();
