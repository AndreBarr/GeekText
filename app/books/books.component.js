const BooksComponent = {
    templateUrl: "/app/books/books.component.html",
    controller: function (api, $stateParams, $filter, $window, paginator) {
        var $ctrl = this;
        $ctrl.books = [];
        $ctrl.listing = []; //store books before filter
        $ctrl.search = $stateParams.search;
        $ctrl.genres = [];
        $ctrl.filter = {};
        $ctrl.resultsPerPage = [10, 20, 30, 40, 50];
        $ctrl.page = new paginator();
        $ctrl.page.Number = 0;
        $ctrl.page.Size = 10;

        this.$onInit = function () {

            //Get books list from web api
            api.getBooks().then(function (response) {
                $ctrl.listing = response.data;
                $ctrl.updateFilter();
            });

            api.getBookGenres().then(function (response) {
                $ctrl.genres = $filter('orderBy')(response.data, 'Genre'); //sort genre dropdown
            });

        }


        this.updateFilter = function () {
            var result = $ctrl.listing;

            //clears empty filters
            for (var prop in $ctrl.filter) {
                if ($ctrl.filter[prop] == null || $ctrl.filter[prop] == false)
                    $ctrl.filter[prop] = undefined;
            }

            //filter results
            result = $filter('filter')(result, $ctrl.filter);

            //page results
            $ctrl.page = $ctrl.page.CreateUpdatedPaginator(result.length);
            result = $filter('paginator')(result, $ctrl.page);

            $ctrl.books = result;
        }

        this.clearFilter = function () {
            $ctrl.filter = {};
            this.updateFilter();
        }

        this.onResultPerPage = function (count) {
            $ctrl.page.Size = count;
            $ctrl.page.Number = 0;
            $ctrl.updateFilter();
        }

        this.onPage = function () {
            $window.scrollTo(0, 0);
            $ctrl.updateFilter();
        }
    }
};