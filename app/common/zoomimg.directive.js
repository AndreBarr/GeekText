const ZoomImgDirective = function () {
    return {
        restrict: 'E',
        scope: {
            src: "@"
        },
        template: `
            <img ng-src="{{src}}" class="img-fluid zoom-img" ng-click="openModal()"/>
            <div class="modal-backdrop fade" ng-show="showModal" ng-class="{'show' : showModal}"></div>
            <div class="modal scroll-y" tabindex="-1" role="dialog" ng-show="showModal" ng-class="{'show' : showModal, 'd-block' : showModal}">
                <div class="container" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" ng-click="closeModal()">
                                <span aria-hidden="true">&times;</span>
                            </button>

                            <img class="img-fluid mx-auto d-block" ng-src="{{src}}"/>
                        </div>
                    </div>
                </div>
            </div>
        `,
        transclude: false,
        link: function ($scope, $elem, $attr) {
            let html = angular.element('html');
            $scope.showModal = false;

            $scope.openModal = function () {
                $scope.showModal = true;
                html.addClass('freeze-scroll');
            }

            $scope.closeModal = function () {
                $scope.showModal = false;
                html.removeClass('freeze-scroll');
            }
        }
    }
}