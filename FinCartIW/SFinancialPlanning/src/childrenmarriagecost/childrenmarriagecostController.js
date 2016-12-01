angular.module('myApp')
.controller("childrenmarriagecostController", ['$scope', '$state', 'decisionfactory', function ($scope, $state, decisionfactory) {

    $scope.routehandle = decisionfactory.getroutes();

    $scope.childrencount = decisionfactory.getnoofchild();

    $scope.sliders = [];

    if (decisionfactory.getchildrensmarriage()) {
        $scope.sliders = decisionfactory.getchildrensmarriage();
    }
    else {
        for (i = 1; i <= $scope.childrencount; i++) {
            var itm = {
                name: 'Child ' + i,
                value: 500000,
                options: {
                    floor: 500000,
                    ceil: 5000000,
                    step: 100000,
                    showSelectionBar: true
                }
            }
            $scope.sliders.push(itm);
        }
    }
    

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

        decisionfactory.setchildrensmarriage($scope.sliders);

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

        decisionfactory.setchildrensmarriage(false);

        decisionfactory.setroutes($scope.routehandle);

        $state.go(decisionfactory.getrouteval());
    }
}]);



