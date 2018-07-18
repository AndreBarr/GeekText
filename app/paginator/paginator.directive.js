const PaginatorDirective = function (paginator) {
    return {
        restrict: 'AE',
        templateUrl: '/app/paginator/paginator.directive.html',
        transclude: false,
        require: 'ngModel',
        scope: {
            ngModel: '=',
            onPage: '&',
            showPages: '<'
        },
        link: function ($scope, $elem, $attr, ngModel) {

            if ($scope.ngModel == null || $scope.ngModel == undefined) {
                $scope.ngModel = new paginator();
            }

            ngModel.$validators['page'] = function renderList(modelValue, viewValue) {
                if ($scope.showPages === false)
                    return;

                var pages = $scope.ngModel;
                $scope.list = [];
                for (var i = 0; i < pages.Count; i++) {
                    if (i < 3)
                        $scope.list.push(i);
                    else if (i < pages.Number + 2 && i > pages.Number - 2)
                        $scope.list.push(i);
                    else if (i > pages.Count - 4)
                        $scope.list.push(i);

                }

                return true;
            };
            $scope.onClick = function (n) {
                $scope.ngModel.Number = n;
                $scope.onPage();

            };
            $scope.clickPrev = function () {
                if ($scope.ngModel.Number != 0) {
                    $scope.ngModel.Number--;
                    $scope.onPage();
                }
            };
            $scope.clickNext = function () {
                if ($scope.ngModel.Number != $scope.ngModel.Count - 1) {
                    $scope.ngModel.Number++;
                    $scope.onPage();
                }
            };
        }
    };
}
