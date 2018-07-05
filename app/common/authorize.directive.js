/* Shows or hides content if the user is logged in. 
 * Usage: 
 *      <div authorize> .... </div>
 *      <authorize> .... </authorize>
 *      <div class="authorize"> ..... </div>
 */
const AuthorizeDirective = function ($window, api) {
    return {
        restrict: 'AEC',
        transclude: true,
        template: '<div ng-transclude ng-if="logged"></div>',
        link: function ($scope, $elem, $attr, $transclude) {
            $scope.logged = api.isLoggedIn();

            $scope.$on('login-change', function () {
                $scope.logged = api.isLoggedIn();
            });
        }
    }
}