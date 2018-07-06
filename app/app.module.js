(function () {
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
    module.component('appBooksComments', BooksCommentsComponent);
    module.component('appCart', CartComponent);
    module.component('appLogin', LoginComponent);
    module.component('appProfile', ProfileComponent);
    module.component('appAuthorDetail', AuthorDetailComponent);
    module.directive('rating', RatingDirective);
    module.directive('authorize', AuthorizeDirective);

    //Configure angular here
    module.config(function ($locationProvider, $urlRouterProvider, $stateProvider) {
        // $locationProvider.html5Mode(true); //would need to configure web server to work with html5 mode
        $urlRouterProvider.otherwise('/');

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
            url: "/{bookId}",
            component: "appBooksDetail"
        })
        .state("cart", {
            url: "/cart",
            component: "appCart"
        })
        .state("login", {
            url: "/login",
            component: "appLogin"
        })
        .state("profile", {
            url: "/profile",
            component: "appProfile"
        })  
        .state("author", {
            url: "/author/{id}",
            component: "appAuthorDetail"
        })
        .state("author.book", {
              url: "/{bookId}",
            component: "appBooksDetail"
        });
        
    });

})();
