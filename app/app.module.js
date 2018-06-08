﻿(function () {
    'use strict';
    let module = angular.module('app', ['ngAnimate', 'ngSanitize', 'ui.router']);

    //Declare all angular components/services/factories/filters here
    module.service('api', ApiService);
    module.component('appNavbar', NavbarComponent);
    module.component('appFooter', FooterComponent);
    module.component('appHome', HomeComponent);
    module.component('appAbout', AboutComponent);
    module.component('appBooks', BooksComponent);
    module.component('appBooksDetail', BooksDetailComponent);
    module.component('appCart', CartComponent);
    module.component('appLogin', LoginComponent);
    
    //Configure angular here
    module.config(function ($locationProvider, $urlRouterProvider, $stateProvider) {
        // $locationProvider.html5Mode(true);
        $urlRouterProvider.otherwise('/');

        /*
          List all URLs for angular here SEE: Angular ui-router docs
          Angular makes the website a SPA (single page app)
          So the whole web page is never reloaded, only the content inside the page is replaced
          Angular handles replacing the content based on the URL
        */
        $stateProvider.state("home", {
            url: "/",
            component: 'appHome'
        })
        .state("about", {
            url: "/about",
            component: "appAbout"
        })
        .state("books", {
            url: "/books",
            component: "appBooks"
        })
        .state("books.detail", {
            url: "/{id}",
            component: "appBooksDetail"
        })
        .state("cart", {
            url: "/cart",
            component: "appCart"
        })
        .state("login", {
            url: "/login",
            component: "appLogin"
        });
        
    });

})();
