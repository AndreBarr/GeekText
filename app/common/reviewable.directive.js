const ReviewableDirective = function ($window, api) {
    return {
        restrict: 'AEC',
        transclude: true,
        template: '<div ng-transclude ng-if="reviewed"></div>',
        link: function ($scope, $elem, $attr, $transclude) {
            $scope.reviewed = api.isReviewed();

            $scope.$on('login-change', function () {
                $scope.reviewed = api.isReviewed();
            });
        }
    }
}