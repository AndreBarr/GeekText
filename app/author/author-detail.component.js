const AuthorDetailComponent = {
    templateUrl: "/app/author/author-detail.component.html",
    controller: function ($stateParams, api) {
        var $ctrl = this;
        var authorId = $stateParams.id;
        $ctrl.auth = {};

          //Get books list from web api
        api.getAuthorDetail(authorId).then(function(response) {
            $ctrl.auth = response.data;

            api.getAuthorBooks(authorId).then(function (response) {
                $ctrl.books = response.data;
            });
        },   function(){
            //404 not found
        });

    }
};