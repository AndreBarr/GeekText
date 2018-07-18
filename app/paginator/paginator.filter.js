/**
This filter allows you to filter a data set in ngRepeat. 
The only parameter (use the factory to create the object) required is the paginator object associated with the paginator directive.*/
function PaginatorFilter() {
    return function (input, pager) {
        var a = pager.Size * pager.Number;
        var b = pager.Size * (pager.Number + 1);
        return input.slice(a, b);
    };

}
