
const PaginatorFactory = function () {
    function Paginator() {
        this.Count = 0;
        this.Size = 12; //Default 12
        this.Number = 0;
        this.CreateUpdatedPaginator = function (newLength) {
            var pager = new Paginator();
            pager.Size = this.Size;
            pager.Count = Math.ceil(newLength / this.Size);
            pager.Number = this.Number;

            if (this.Count < 1) {
                //Reset if last pager had no data
                pager.Number = 0;
            }
            return pager;
        }
    }

    return Paginator;
};
