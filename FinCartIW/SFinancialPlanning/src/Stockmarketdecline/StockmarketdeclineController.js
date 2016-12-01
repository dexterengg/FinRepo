angular.module('myApp')
.controller("StockmarketdeclineController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.stockstatus = decisionfactory.getstock();

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setstock($scope.stockstatus);

        $state.go('Knowledgerate');
    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setstock(2.5);

        $state.go('Investingcare');
    }

}]);



