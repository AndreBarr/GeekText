/*
    Service that will be a wrapper for all api calls
*/
const ApiService = function($http){

    //Helper function for get api requests
    function _get (url, parameters) {
        if (parameters === null || parameters === undefined)
            parameters = {};

        return $http.get(url, { params: parameters });
            // .finally(finFunc)
            // .catch(errorFunc);
    };


    this.getBooks = function(){
        return _get("api/books.php");
    };

    this.getBookDetail = function(bookId){
        return _get("api/book_detail.php", { id: bookId});
    };
};