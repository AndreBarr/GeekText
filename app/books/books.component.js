const BooksComponent = {
    templateUrl: "/app/books/books.component.html",
    controller: function (api, $stateParams) {
        var $ctrl = this;
        $ctrl.books = [];
        $ctrl.search= $stateParams.search;

        //Get books list from web api
        api.getBooks().then(function(response) {
            $ctrl.books = response.data;
        });
    }
};