const BooksDetailComponent = {
    templateUrl: "/app/books/books-detail.component.html",
    controller: function ($stateParams, api) {
        var $ctrl = this;
        var bookId = $stateParams.bookId;
        var userId = api.getUserId();
        $ctrl.book = {};
        $ctrl.comments = {};
        $ctrl.rating = 0;
        $ctrl.isAnon = 0;
        $ctrl.ratings = [0, 1, 2, 3, 4, 5];
        let html = angular.element('html');

        function getData() {
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
        }

        this.$onInit = function () {
            html.addClass('freeze-scroll');
            getData();
        };

        this.$onDestroy = function () {
            html.removeClass('freeze-scroll');
        };

        $ctrl.submitReview = function () {
            if ($ctrl.isAnon != 1)
                $ctrl.IsAnon = 0;

            api.submitReview($ctrl.comment, $ctrl.rating, $ctrl.isAnon, userId, bookId)
                .then(function (response) {
                    getData();
                    $ctrl.comment = ""; //reset value
                    alert("Review Submitted!");
                });
        };

        $ctrl.markPurchased = function () {

        };
    }
};