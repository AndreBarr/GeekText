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
        return _get("GeekText/api/books.php");
    };
    
    this.getBookDetail = function(bookId){
        return _get("GeekText/api/book_detail.php", { id: bookId});
    };


    //Use for checking if user is logged in
    this.isLoggedIn = function(){
        return false;
    }
};