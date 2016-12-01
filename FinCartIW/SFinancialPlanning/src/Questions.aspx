<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Questions.aspx.cs" Inherits="SFinancialPlanning_src_Questions" %>

<!DOCTYPE html>

<html ng-app="myApp" class="full">

<head runat="server">
    <title>Fincart Financial Planning</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/form-elements.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link href="../Content/angular-toggle-switch-bootstrap-3.css" rel="stylesheet" />
    <link href="../Content/rzslider.css" rel="stylesheet" />

    <script src="../Scripts/jquery-1.9.1.js"></script>
    <script src="../Scripts/angular.js"></script>
    <script src="../Scripts/angular-ui-router.js"></script>
    <script src="../Scripts/angular-animate.js"></script>
    <script src="../Scripts/angular-toggle-switch.min.js"></script>
    <script src="../Scripts/angular-sanitize.js"></script>
    <script src="../Scripts/angular-ui/ui-bootstrap-tpls-0.9.0.js"></script>
    <script src="../Scripts/angular-touch.min.js"></script>
    <script src="../Scripts/rzslider.js"></script>

    <script src="app/route.js"></script>
    <script src="app/datafactory.js"></script>
    <script>
        angular.module('myApp')
.controller("QuestionController", ['$scope', '$state', function ($scope, $state) {
    $scope.counter = 0;
    $scope.max = 20;
    $state.go('Start');

}]);
    </script>
    
    <script src="Age/AgeController.js"></script>
    <script src="familystatus/familystatusController.js"></script>
    <script src="Annualincome/AnnualincomeController.js"></script>
    <script src="Monthlyexpense/MonthlyexpenseController.js"></script>
    <script src="City/CityController.js"></script>
    <script src="hospitals/hospitalsController.js"></script>
    <script src="illness/illnessController.js"></script>
    <script src="Inflation/InflationController.js"></script>
    <script src="3goals/3goalsController.js"></script>
    <script src="noofchildren/noofchildrenController.js"></script>
    <script src="childrenage/childrenageController.js"></script>
    <script src="childreneducationcost/childreneducationcostController.js"></script>
    <script src="childrenmarriagecost/childrenmarriagecostController.js"></script>
    <script src="Assetcost/AssetcostController.js"></script>
    <script src="Assettime/AssettimeController.js"></script>
    <script src="Vacationcost/VacationcostController.js"></script>
    <script src="Vacationtime/VacationtimeController.js"></script>
    <script src="Othertime/OthertimeController.js"></script>
    <script src="Othercost/OthercostController.js"></script>
    <script src="Retirementage/RetirementageController.js"></script>
    <script src="Lifeexpectancy/LifeexpectancyController.js"></script>


    <script src="Investingcare/InvestingcareController.js"></script>
    <script src="Stockmarketdecline/StockmarketdeclineController.js"></script>
    <script src="Knowledgerate/KnowledgerateController.js"></script>
    <script src="Risktakingrate/RisktakingrateController.js"></script>


    <style>
        .progress-bar.ng-animate {
            -webkit-transition: 0;
            transition: 0;
        }
        .full {
            background: url(../images/background_1680x1050.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        .dropdown-menu > .active > a, .dropdown-menu > .active > a:focus, .dropdown-menu > .active > a:hover {
            background-color: #5cb85c;
        }
    </style>
</head>

<body style="background:none;">
    <form id="form1" runat="server">
    <!-- Top menu -->
    <nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" style="height:55px;" href="../../Default.aspx"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="top-navbar-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <span class="li-text">
                        </span> 
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div ng-controller="QuestionController">
        <progressbar value="dynamic" type="{{type}}"></progressbar>
        <div class="container">
            <div class="row">
                <h1 style="color:#ffffff;"><strong>{{fprogress}}</strong></h1>
                <div class="col-sm-12">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div ui-view="viewA"></div>
                        </div>
                    <div class="col-sm-2"></div>
                    </div>
            </div>
        </div>
    </div>
        </form>
</body>

</html>
