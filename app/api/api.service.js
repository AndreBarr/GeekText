/*
    Service that will be a wrapper for all api calls
*/
const ApiService = function($http, $window, $rootScope){
    let userId = -1;
    let login_key = "session";

    loadLogin(); //loads if user is logged in

    //Helper function for get api requests
    function _get (url, parameters) {
        if (parameters === null || parameters === undefined)
            parameters = {};
        return $http.get(url, { params: parameters });
    };

    function _post (url, data) {
        return $http.post(url, data);
    };

    //Logging in
    function logIn(id) {
        userId = id; 
        $window.localStorage.setItem(login_key, userId);

        $rootScope.$broadcast('login-change');
    }
    function loadLogin() {
        var result = $window.localStorage.getItem(login_key);

        if (result !== null && result !== undefined) {
            logIn(result);
        }
    }
    function logOut() {
        userId = -1;
        $window.localStorage.removeItem(login_key);
        $rootScope.$broadcast('login-change');
    }
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
        return userId !== -1 || userId == null;
    }

    this.login = function(username, password){
        return _post("api/login.php", { username: username, password: password});
    }
    this.logOut = function () {
        logOut();
    }
    this.getUserId = function () {
        if (this.isLoggedIn())
            return userId;
        else
            return false;
    }
    this.register = function (username, password, email) {

        return _post("api/register.php", { username: username, password: password, email: email })
            .then(function (response) {
                userId = response.data;
                logIn(userId);
                return response;
            }, function (response) {
                return response;
            });
    }

};