angular.module('myApp')
.controller("illnessController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.switchStatus = decisionfactory.getillness();

    $scope.k =  "Yes";

    $scope.valchange = function () {

        if($scope.switchStatus)
            $scope.k = "No";
        else
            $scope.k = "Yes";
    }


    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setillness($scope.switchStatus);

        $state.go('Inflation');

    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setillness(false);

        $state.go('Monthlyexpense');
    }


    $scope.modalShown = false;
    $scope.toggleModal = function () {
        $scope.modalShown = !$scope.modalShown;
    };


}])
.directive('modalDialog', function () {
    return {
        restrict: 'E',
        scope: {
            show: '='
        },
        replace: true, // Replace with the template below
        transclude: true, // we want to insert custom content inside the directive
        link: function (scope, element, attrs) {
            scope.dialogStyle = {};
            if (attrs.width)
                scope.dialogStyle.width = attrs.width;
            if (attrs.height)
                scope.dialogStyle.height = attrs.height;
            scope.hideModal = function () {
                scope.show = false;
            };
        },
        template: "<div class='ng-modal' ng-show='show'><div class='ng-modal-overlay' ng-click='hideModal()'></div><div class='ng-modal-dialog' ng-style='dialogStyle'><div class='ng-modal-close' ng-click='hideModal()'>X</div><div class='ng-modal-dialog-content' ng-transclude></div></div></div>" // See below
    };
});



