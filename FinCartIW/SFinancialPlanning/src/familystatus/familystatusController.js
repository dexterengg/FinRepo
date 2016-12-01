angular.module('myApp')
.controller("familystatusController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.fstatus = decisionfactory.getuserstatus();
    
    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setuserstatus($scope.fstatus)

        $state.go('3goals');

    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setuserstatus('Married with Kids');

        $state.go('Inflation');
    }

}]);



