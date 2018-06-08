const BooksDetailComponent = {
    templateUrl: "/app/books/books-detail.component.html",
    controller: function ($stateParams, api) {
        var $ctrl = this;
        var bookId = $stateParams.id;
        $ctrl.book = {};
        let html = angular.element('html');


          //Get books list from web api
        api.getBookDetail(bookId).then(function(response) {
            $ctrl.book = response.data;
        },   function(){
            //404 not found
        });


        this.$onInit = function () {
            html.addClass('freeze-scroll');
        };

        this.$onDestroy = function () {
            html.removeClass('freeze-scroll');
        };
        
    }
};