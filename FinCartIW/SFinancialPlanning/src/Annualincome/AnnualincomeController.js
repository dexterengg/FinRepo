angular.module('myApp')
.controller("AnnualincomeController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.options = [
        { name: "Up to 5Lac", id: 500000 },
        { name: "5Lac to 10Lac", id: 1000000 },
        { name: "10Lac to 20Lac", id: 2000000 },
        { name: "20Lac to 50Lac", id: 5000000 },
        { name: "50Lac and Above", id: 5000000 }
    ];

    $scope.annualval = decisionfactory.getanualincome();

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        //alert($scope.annualval);
        decisionfactory.setanualincome($scope.annualval);

        $state.go('Monthlyexpense');
    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setanualincome(500000);

        $state.go('Start');
    }
}]);



