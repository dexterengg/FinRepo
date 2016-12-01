angular.module('myApp')
.controller("AgeController", ['$scope', '$state', '$window', 'decisionfactory', function ($scope, $state, $window, decisionfactory) {

    $scope.slider = {
        value: decisionfactory.getcurrage(),
        options: {
            floor: 20,
            ceil: 65,
            step: 1,
            showSelectionBar: true
        }
    };

    $scope.$parent.fprogress = "Financial Progress";

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setcurrage($scope.slider.value);

        $state.go('Annualincome');
    }

    $scope.decrement = function () {

        $window.location.href = '../FPSelfie.aspx';
    }

}]);



