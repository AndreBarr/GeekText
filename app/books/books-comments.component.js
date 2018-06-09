const BooksCommentsComponent = {
    templateUrl: "/app/books/books-comments.component.html",
    controller: function ($stateParams, api) {
        var $ctrl = this;
        var bookId = $stateParams.id;
        $ctrl.comments = {}; 

        //Get books list from web api
        api.getComments(bookId).then(function(response) {
            $ctrl.comments = response.data;
        }, function(){
        	//404 not found
        });
    }
};