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
        return _get("api/book_detail.php", { BookID: bookId});
    };

    this.getComments = function(bookId) {
        return _get("api/book_comments.php", { BookID: bookId});
    };

    this.getAuthorDetail = function(authorId){
        return _get("api/author_detail.php", { AuthorID: authorId});
    };

    this.getAuthorBooks = function (authorId) {
        return _get("api/author_books.php", { AuthorID: authorId });
    };

    //Use for checking if user is logged in
    this.isLoggedIn = function(){
        return false;
    }

    this.login = function(username, password){
        return _get("api/login.php", { username: username, password: password});
    }

    this.createAcc = function(newUser, newPass, confirmPass){
        return _get("api/login.php", { username: username, password: password});
    }
};