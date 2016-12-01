    angular.module('myApp')
.controller("3goalsController", ['$scope', '$state', '$window', 'decisionfactory', function ($scope, $state, $window, decisionfactory) {
    if (decisionfactory.getroutes().length > 0) {
        $scope.routehandle = decisionfactory.getroutes();
    }
    else {
        $scope.routehandle = [
                { routename: '3goals', hasroute: true, isrouted: true },
                { routename: 'noofchildren', hasroute: false, isrouted: false },
                { routename: 'childrenage', hasroute: false, isrouted: false },
                { routename: 'childreneducationcost', hasroute: false, isrouted: false },
                { routename: 'childrenmarriagecost', hasroute: false, isrouted: false },
                { routename: 'Assetcost', hasroute: false, isrouted: false },
                { routename: 'Assettime', hasroute: false, isrouted: false },
                { routename: 'Vacationcost', hasroute: false, isrouted: false },
                { routename: 'Vacationtime', hasroute: false, isrouted: false },
                { routename: 'Retirementage', hasroute: false, isrouted: false },
                { routename: 'Lifeexpectancy', hasroute: false, isrouted: false },
                { routename: 'Othercost', hasroute: false, isrouted: false },
                { routename: 'Othertime', hasroute: false, isrouted: false },
                { routename: 'Investingcare', hasroute: true, isrouted: false }
        ]
    }

    $scope.routehandle[0].hasroute = true;
    $scope.routehandle[0].isrouted = true;

    $scope.stat = decisionfactory.getuserstatus()

    if (decisionfactory.getgoals())
    {
        $scope.checkboxModel = decisionfactory.getgoals();
    }
    else {
        $scope.checkboxModel = {
            value1: false,
            value2: false,
            value3: false,
            value4: false,
            value5: false,
            value6: false
        };
    }
    

    $scope.count = decisionfactory.getgoalcount();

    $scope.chkchange1 = function () {

        if ($scope.checkboxModel.value1) {
            $scope.routehandle[1].hasroute = true;
            $scope.routehandle[2].hasroute = true;
            $scope.routehandle[3].hasroute = true;
            $scope.count++;
        }
        else if ($scope.count > 0) {
            if ($scope.checkboxModel.value2) {

            }
            else {
                $scope.routehandle[1].hasroute = false;
                $scope.routehandle[2].hasroute = false;
            }
            $scope.routehandle[3].hasroute = false;
            $scope.count--;
        }


    }

    $scope.chkchange2 = function () {

        if ($scope.checkboxModel.value2) {
            $scope.routehandle[1].hasroute = true;
            $scope.routehandle[2].hasroute = true;
            $scope.routehandle[4].hasroute = true;
            $scope.count++;
        }
        else if ($scope.count > 0) {
            if ($scope.checkboxModel.value1) {

            }
            else {
                $scope.routehandle[1].hasroute = false;
                $scope.routehandle[2].hasroute = false;
            }
            $scope.routehandle[4].hasroute = false;
            $scope.count--;
        }
    }

    $scope.chkchange3 = function () {

        if ($scope.checkboxModel.value3) {
            $scope.routehandle[5].hasroute = true;
            $scope.routehandle[6].hasroute = true;
            $scope.count++;
        }
        else if ($scope.count > 0) {
            $scope.routehandle[5].hasroute = false;
            $scope.routehandle[6].hasroute = false;
            $scope.count--;
        }
    }

    $scope.chkchange4 = function () {

        if ($scope.checkboxModel.value4) {
            $scope.routehandle[7].hasroute = true;
            $scope.routehandle[8].hasroute = true;
            $scope.count++;
        }
        else if ($scope.count > 0) {
            $scope.routehandle[7].hasroute = false;
            $scope.routehandle[8].hasroute = false;
            $scope.count--;
        }
    }

    $scope.chkchange5 = function () {

        if ($scope.checkboxModel.value5) {
            $scope.routehandle[9].hasroute = true;
            $scope.routehandle[10].hasroute = true;
            $scope.count++;
        }
        else if ($scope.count > 0) {
            $scope.routehandle[9].hasroute = false;
            $scope.routehandle[10].hasroute = false;
            $scope.count--;
        }
    }

    $scope.chkchange6 = function () {

        if ($scope.checkboxModel.value6) {
            $scope.routehandle[11].hasroute = true;
            $scope.routehandle[12].hasroute = true;
            $scope.count++;
        }
        else if ($scope.count > 0) {
            $scope.routehandle[11].hasroute = false;
            $scope.routehandle[12].hasroute = false;
            $scope.count--;
        }
    }


    $scope.chkchange = function () {

        if ($scope.count > 2) {

            return false;
        }
        else {
            return true;
        }
    }


    $scope.chkchangeall1 = function () {

        if ($scope.count > 2) {
            if ($scope.checkboxModel.value1) {
                return false;
            }
            else {
                return true;
            }
        }
        else {
            return false;
        }
    }

    $scope.chkchangeall2 = function () {

        if ($scope.count > 2) {
            if ($scope.checkboxModel.value2) {
                return false;
            }
            else {
                return true;
            }
        }
        else {
            return false;
        }
    }

    $scope.chkchangeall3 = function () {

        if ($scope.count > 2) {
            if ($scope.checkboxModel.value3) {
                return false;
            }
            else {
                return true;
            }
        }
        else {
            return false;
        }
    }

    $scope.chkchangeall4 = function () {

        if ($scope.count > 2) {
            if ($scope.checkboxModel.value4) {
                return false;
            }
            else {
                return true;
            }
        }
        else {
            return false;
        }
    }

    $scope.chkchangeall5 = function () {

        if ($scope.count > 2) {
            if ($scope.checkboxModel.value5) {
                return false;
            }
            else {
                return true;
            }
        }
        else {
            return false;
        }
    }

    $scope.chkchangeall6 = function () {

        if ($scope.count > 2) {
            if ($scope.checkboxModel.value6) {
                return false;
            }
            else {
                return true;
            }
        }
        else {
            return false;
        }
    }

    $scope.increment = function () {

        $scope.$parent.counter = $scope.$parent.counter + 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';


        decisionfactory.setgoals($scope.checkboxModel);

        decisionfactory.setgoalcount($scope.count);

        for (var i = 0; i < $scope.routehandle.length; i++) {
            if ($scope.routehandle[i].hasroute) {
                if ($scope.routehandle[i].isrouted) {
                }
                else {
                    decisionfactory.setrouteval($scope.routehandle[i].routename);
                    $scope.routehandle[i].isrouted = true;
                    break;
                }
            }
        }

        decisionfactory.setroutes($scope.routehandle);

        $state.go(decisionfactory.getrouteval());

    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setgoals({});
        decisionfactory.setgoalcount(0);
        decisionfactory.setroutes([]);

        $state.go('familystatus');
    }

}]);



