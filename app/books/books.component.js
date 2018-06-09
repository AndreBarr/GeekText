const BooksComponent = {
    templateUrl: "app/books/books.component.html",
    controller: function (api) {
        var $ctrl = this;
        $ctrl.books = []; 

        //Get books list from web api
        api.getBooks().then(function(response) {
            $ctrl.books = response.data;
        });
    }
};