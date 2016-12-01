angular.module('myApp')
.controller("KnowledgerateController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.knowledgestatus = decisionfactory.getknowledge();

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setknowledge($scope.knowledgestatus);

        $state.go('Risktakingrate');
    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setknowledge(2.5);

        $state.go('Stockmarketdecline');
    }

}]);



