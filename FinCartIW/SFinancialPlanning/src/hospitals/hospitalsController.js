angular.module('myApp')
.controller("hospitalsController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.options = [
        { name: "A – Category Hospitals", id: 'A' },
        { name: "B – Category Hospitals", id: 'B' },
        { name: "C – Category Hospitals", id: 'C' }
    ];

    $scope.hospitalval = decisionfactory.gethospital();

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.sethospital($scope.hospitalval);

        $state.go('illness');
    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.sethospital('A');

        $state.go('City');
    }

}]);



