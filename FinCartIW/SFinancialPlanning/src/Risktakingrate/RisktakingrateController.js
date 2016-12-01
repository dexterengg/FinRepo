angular.module('myApp')
.controller("RisktakingrateController", ['$scope', '$state', '$window', 'decisionfactory', '$http', function ($scope, $state, $window, decisionfactory, $http, $activityIndicator) {

    $scope.childrensage1="";
    $scope.childrenseducation1 = "";
    $scope.childrensmarriage1 = "";
    $scope.selectedgoals = "";

    $scope.chk1 = false;

    $scope.chk = function () {
        if ($scope.chk1)
            return true;
        else
            return false;
    }

    $scope.riskstatus = decisionfactory.getrisk();

    $scope.increment = function () {
        $scope.chk1 = true;

        $scope.$parent.counter = $scope.$parent.counter + 20;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.$parent.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setrisk($scope.riskstatus);

        if (decisionfactory.getchildrensage()) {

            for (var i = 0; i < decisionfactory.getchildrensage().length; i++) {

                $scope.childrensage1 = $scope.childrensage1+"~"+decisionfactory.getchildrensage()[i].value;
            }

            $scope.childrensage1 = $scope.childrensage1.slice(1);
        }

        if (decisionfactory.getchildrenseducation()) {

            for (var i = 0; i < decisionfactory.getchildrenseducation().length; i++) {

                $scope.childrenseducation1 = $scope.childrenseducation1 + "~" + decisionfactory.getchildrenseducation()[i].value;
            }

            $scope.childrenseducation1 = $scope.childrenseducation1.slice(1);
        }

        if (decisionfactory.getchildrensmarriage()) {

            for (var i = 0; i < decisionfactory.getchildrensmarriage().length; i++) {

                $scope.childrensmarriage1 = $scope.childrensmarriage1 + "~" + decisionfactory.getchildrensmarriage()[i].value;
            }

            $scope.childrensmarriage1 = $scope.childrensmarriage1.slice(1);
        }
        

        if (decisionfactory.getroutes()) {

            for (var i = 0; i < decisionfactory.getroutes().length; i++) {
                if (decisionfactory.getroutes()[i].routename == 'childreneducationcost') {
                    if (decisionfactory.getroutes()[i].hasroute) {
                        $scope.selectedgoals = $scope.selectedgoals + "~CE";
                    }
                }
                if (decisionfactory.getroutes()[i].routename == 'childrenmarriagecost') {
                    if (decisionfactory.getroutes()[i].hasroute) {
                        $scope.selectedgoals = $scope.selectedgoals + "~CM";
                    }
                }
                if (decisionfactory.getroutes()[i].routename == 'Assetcost') {
                    if (decisionfactory.getroutes()[i].hasroute) {
                        $scope.selectedgoals = $scope.selectedgoals + "~AC";
                    }
                }
                if (decisionfactory.getroutes()[i].routename == 'Vacationcost') {
                    if (decisionfactory.getroutes()[i].hasroute) {
                        $scope.selectedgoals = $scope.selectedgoals + "~VC";
                    }
                }
                if (decisionfactory.getroutes()[i].routename == 'Retirementage') {
                    if (decisionfactory.getroutes()[i].hasroute) {
                        $scope.selectedgoals = $scope.selectedgoals + "~RA";
                    }
                }
                if (decisionfactory.getroutes()[i].routename == 'Othercost') {
                    if (decisionfactory.getroutes()[i].hasroute) {
                        $scope.selectedgoals = $scope.selectedgoals + "~OC";
                    }
                }
            }
            $scope.selectedgoals = $scope.selectedgoals.slice(1);
        }


        $scope.SendData();
    }

    $scope.decrement = function () {

        $scope.$parent.counter = $scope.$parent.counter - 1;

        $scope.$parent.dynamic = $scope.$parent.counter / $scope.max * 100;

        $scope.$parent.type = 'warning';

        decisionfactory.setrisk(2.5);

        $state.go('Knowledgerate');
    }

    $scope.SendData = function () {
        // use $.param jQuery function to serialize data from JSON 
        var newdata = JSON.stringify({
            currage: decisionfactory.getcurrage(),
            anualincome: decisionfactory.getanualincome(),
            monthlyexp: decisionfactory.getmonthlyexp(),
            assetcost: decisionfactory.getassetcost(),
            assettime: decisionfactory.getassettime(),
            vacationcost: decisionfactory.getvacationcost(),
            vacationtime: decisionfactory.getvacationtime(),
            othercost: decisionfactory.getothercost(),
            othertime: decisionfactory.getothertime(),
            retireage: decisionfactory.getretireage(),
            life: decisionfactory.getlife(),
            city: decisionfactory.getcity().Name,
            stat: decisionfactory.getuserstatus(),
            goals: $scope.selectedgoals,
            noofchild: decisionfactory.getnoofchild(),
            hospital: decisionfactory.gethospital(),
            illness: decisionfactory.getillness(),
            inflation: decisionfactory.getinflation(),
            investing: decisionfactory.getinvesting(),
            stock: decisionfactory.getstock(),
            knowledge: decisionfactory.getknowledge(),
            risk: decisionfactory.getrisk(),
            childrensage: $scope.childrensage1,
            childrenseducation: $scope.childrenseducation1,
            childrensmarriage: $scope.childrensmarriage1
        });

        $http({
            method: 'POST',
            url: 'Questions.aspx/setplan',
            headers: {
                'Content-Type': 'application/json'
            },
            data: newdata
        })
                   .success(function (data) {
                       $scope.PostDataResponse = data;
                       $window.location.href = '../Conclusion.aspx';
                   })
                   .error(function (data) {
                       $scope.ResponseDetails = "Data: " + data;
                   });
    }

}]);



