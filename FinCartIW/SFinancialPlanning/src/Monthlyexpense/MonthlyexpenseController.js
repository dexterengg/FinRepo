angular.module('myApp')
.controller("MonthlyexpenseController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.slider = {
        value: decisionfactory.getmonthlyexp(),
        options: {
            floor: 20000,
            ceil: 400000,
            step: 5000,
            showSelectionBar: true
        }
    };

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setmonthlyexp($scope.slider.value);

        $state.go('illness');
    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setmonthlyexp(20000);

        $state.go('Annualincome');
    }
}]);



