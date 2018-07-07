const BooksDetailComponent = {
    templateUrl: "/app/books/books-detail.component.html",
    controller: function ($stateParams, api) {
        var $ctrl = this;
        var bookId = $stateParams.bookId;
        var userId = api.getUserId();
        $ctrl.book = {};
        $ctrl.comments = {};
        let html = angular.element('html');

        //Get books list from web api
        api.getBookDetail(bookId).then(function (response) {
            $ctrl.book = response.data;
        }, function () {
            //404 not found
        });


        //Get books list from web api
        api.getComments(bookId).then(function (response) {
            $ctrl.comments = response.data;
        }, function () {
            //404 not found
        });

        this.$onInit = function () {
            html.addClass('freeze-scroll');
        };

        this.$onDestroy = function () {
            html.removeClass('freeze-scroll');
        };

        $ctrl.submitReview = function() {
            if ($ctrl.isAnon == 1) {
                api.submitReview($ctrl.comment, $ctrl.rating, 1, userId, bookId)
                .then(function (response) {
                    alert("Review Submitted!");
                    location.reload();
                });
            } else {
                api.submitReview($ctrl.comment, $ctrl.rating, 0, userId, bookId)
                    .then(function (response) {
                        alert("Review Submitted!");
                        location.reload();
                });
            }
        };

        $ctrl.markPurchased = function() {

        };

    }
};