const BooksComponent = {
    templateUrl: "/app/books/books.component.html",
    controller: function (api, $stateParams, $filter, $window, paginator) {
        var $ctrl = this;
        $ctrl.books = [];
        $ctrl.listing = []; //store books before filter
        $ctrl.search = $stateParams.search;
        $ctrl.genres = [];
        $ctrl.topSeller = [];
        $ctrl.sort = {};
        $ctrl.filter = {};
        $ctrl.resultsPerPage = [10, 20, 30, 40, 50];
        $ctrl.ratings = [0,1,2,3,4,5];
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
                //response.data has list of genres for dropdown
                $ctrl.genres = $filter('orderBy')(response.data, 'Genre'); //sort genre dropdown
            });

            console.log($ctrl.listing.Rating);

            for(b in $ctrl.books){
                if($ctrl.topSeller < $ctrl.books[b].NumPurchased){
                    $ctrl.topSeller[0] = $ctrl.books[b];
                }

            }
            console.log($ctrl.topSeller);
                   
        }
        

        this.updateFilter = function () {
            var result = $ctrl.listing;
            //clears empty filters
            for (var prop in $ctrl.filter) {
                if ($ctrl.filter[prop] == null || $ctrl.filter[prop] == false)
                    $ctrl.filter[prop] = undefined;
            }
            if($ctrl.sort.isTopSeller == true){
                result = $filter('orderBy')(result, "-NumPurchased");
            }
            if($ctrl.sort.title == true){
                result = $filter('orderBy')(result, "BookTitle");
            }
            if($ctrl.sort.author == true){
                result = $filter('orderBy')(result, "AuthorName");
            }
            if($ctrl.sort.topPrice == true){
                result = $filter('orderBy')(result, "Price");
            }
            if($ctrl.sort.bookRating == true){
                result = $filter('orderBy')(result, "-Rating");
            }
            if($ctrl.sort.releaseDate  == true){
                result = $filter('orderBy')(result, "-ReleaseDate");
            }

            console.log($ctrl.listing);
            console.log($ctrl.isTopSeller);
            console.log($ctrl.topSeller);
            console.log($ctrl.filter);


            //filter results
            result = $filter('filter')(result, $ctrl.filter);

            //search results
            result = $filter('filter')(result, $ctrl.search);

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
            $ctrl.updateFilter();
            $ctrl.page.Number = 0;
        }

        this.onPage = function () {
            $window.scrollTo(0, 0);
            $ctrl.updateFilter();
        }

        this.onSearch = function () {
            $ctrl.page.Number = 0;
            $ctrl.updateFilter();
        }
    }
};