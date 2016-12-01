angular.module('myApp')
.controller("InflationController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.slider = {
        value: decisionfactory.getinflation(),
        options: {
            floor: 0,
            ceil: 20,
            step: 1,
            showSelectionBar: true
        }
    };

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setinflation($scope.slider.value);

        $state.go('familystatus');
    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setinflation(7);

        $state.go('illness');
    }
}]);



