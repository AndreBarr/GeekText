const CartComponent = {
    templateUrl: "app/cart/cart.component.html",
    controller: function (api) {
        var $ctrl = this;
        $ctrl.books = []; 

        //Get books list from web api
        api.getBooks().then(function(response) {
            $ctrl.books = response.data.splice(0, 3);
        });
    }
};