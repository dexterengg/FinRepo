angular.module('myApp')
.controller("VacationcostController", ['$scope', '$state', '$window', 'decisionfactory', function ($scope, $state, $window, decisionfactory) {

    $scope.routehandle = decisionfactory.getroutes();

    $scope.slider = {
        value: decisionfactory.getvacationcost(),
        options: {
            floor: 25000,
            ceil: 1000000,
            step: 5000,
            showSelectionBar: true
        }
    };


    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        for (var i = 0; i < $scope.routehandle.length; i++) {
            if ($scope.routehandle[i].hasroute) {
                if ($scope.routehandle[i].isrouted) {
                }
                else {
                    if ($state.current.name != $scope.routehandle[i].routename) {
                        decisionfactory.setrouteval($scope.routehandle[i].routename);
                        $scope.routehandle[i].isrouted = true;
                        if (i > 0) {
                            $scope.routehandle[i - 1].isrouted = true;
                        }
                        break;
                    }
                }
            }
        }
        decisionfactory.setvacationcost($scope.slider.value);

        decisionfactory.setroutes($scope.routehandle);

        $state.go(decisionfactory.getrouteval());
    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        for (var i = $scope.routehandle.length - 1; i > -1 ; i--) {
            if ($scope.routehandle[i].hasroute) {
                if ($scope.routehandle[i].isrouted) {
                    if ($state.current.name != $scope.routehandle[i].routename) {
                        decisionfactory.setrouteval($scope.routehandle[i].routename);
                        $scope.routehandle[i].isrouted = false;
                        if (i < 13) {
                            $scope.routehandle[i + 1].isrouted = false;
                        }
                        break;
                    }
                }
            }
        }

        decisionfactory.setvacationcost(5000);

        decisionfactory.setroutes($scope.routehandle);

        $state.go(decisionfactory.getrouteval());
    }

}]);



