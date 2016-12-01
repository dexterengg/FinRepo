angular.module('myApp')
.controller("InvestingcareController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.routehandle = decisionfactory.getroutes();

    $scope.istatus = decisionfactory.getinvesting();

    $scope.routehandle[13].hasroute = true;
    $scope.routehandle[13].isrouted = false;

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setinvesting($scope.istatus);

        $state.go('Stockmarketdecline');
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

        decisionfactory.setinvesting(10);

        decisionfactory.setroutes($scope.routehandle);

        $state.go(decisionfactory.getrouteval());

    }

}]);



