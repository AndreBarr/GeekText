const RatingDirective = function () {
    return {
        restrict: 'E',
        scope: {
            ngModel: "="
        },
        template: `
            <i class="material-icons align-middle d-inline"  style="font-size:1.2rem;" ng-repeat="n in getStars() track by $index">{{n}}</i>
        `,
        transclude: false,
        link: function ($scope, $elem, $attr) {
            let STAR = 'star';
            let HALF_STAR = 'star_half';
            let STAR_OUTLINE = 'star_outline';

            $scope.getStars = function () {
                var stars = [];
                var rating = Math.round($scope.ngModel * 2) / 2;
                var remainder = rating % 1;
                rating -= remainder;

                for (var i = 1; i <= 5; i++) {
                    if (i < rating) {
                        stars.push(STAR);
                    }
                    else if (i == rating) {
                        if (remainder == 0.5)
                            stars.push(HALF_STAR)
                        else
                            stars.push(STAR);
                    }
                    else if (i > rating) {
                        stars.push(STAR_OUTLINE);
                    }
                }

                return stars;
            };

        }
    }
}