<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FNOLTestPage.aspx.cs" Inherits="fnol.FNOLTestPage" ValidateRequest="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="Scripts/angular.min.js"></script>
    <style type="text/css">
        span.sand-box-form-label-small {
            font-size: 13px;
        }

        body {
            font-family: arial;
        }

        .myApp {
            padding-left: 33px;
        }

        .sand-box-xml {
            border: 1px solid #000;
            height: 150px;
            width: 97%;
        }

        .sand-box-wrapper {
            padding: 33px;
        }

        .sand-box-form-label {
            font-family: arial;
        }

        #ddlServicename, #Button1 {
            border: 1px solid;
            padding: 5px;
        }

        .button {
            font-family: lucida grande;
            height: 40px;
            width: 150px;
        }

        #result tr td {
            border: 0px solid #808080;
        }

        .error {
            color: red;
            font-family: lucida grande;
        }

        table#result {
            width: 52%;
        }
    </style>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
    <form id="form1" runat="server">
        <div   class="myApp">
            <table style="width: 50%">
                 <tr>
                    <td class="sand-box-form-label" style="width: 200px;">Client ID :
                    </td>
                    <td>
                        <input name="txtClientId" id="txtClientId" type="text" ng-model="objLogin.clientId" />
                    </td>
                </tr>
                <tr>
                    <td class="sand-box-form-label" style="width: 200px;">Organization ID :
                    </td>
                    <td>
                        <input name="txtOrgId" id="txtOrgId" type="text" ng-model="objLogin.cocd" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px;" class="sand-box-form-label">User ID :
                    </td>
                    <td>
                        <input id="txtUserId" type="text" ng-model="objLogin.userid" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px;" class="sand-box-form-label">Password :
                    </td>
                    <td>
                        <input id="txtPassword" type="password" ng-model="objLogin.userpassword" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px;" class="sand-box-form-label">Language :
                    </td>
                    <td>
                        <input id="txtLanguage" type="text" ng-model="objLogin.language" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px;" class="sand-box-form-label">CallCenter Hours :
                    </td>
                    <td>
                        <input id="txtCallCenterHours" type="text" ng-model="objLogin.callcenterhours" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px;"></td>
                    <td>
                        <input type="button" id="btnLogin" value="Login" ng-click="login()" />
                    </td>
                </tr>
            </table>
            <table id="result" border="0">
                <tr>
                    <td colspan="2" class="error" style="width: 200px;">
                        <div id="lblmessage">
                        </div>
                    </td>
                </tr>

                <tr>
                    <td style="vertical-align: top; width: 200px;">
                        <span class="sand-box-form-label">Paste Your XML</span><br />
                        <span class="sand-box-form-label-small">for “InitiateFnolProcess service”</span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="sand-box-xml" ID="txtXMLInitiateFnolProcess" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; width: 200px;">
                        <span class="sand-box-form-label">Paste Your XML</span><br />
                        <span class="sand-box-form-label-small">for “ProcessFnolPackage service” </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="sand-box-xml" ID="txtXMLProcessFnolPackage" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; width: 200px;">
                        <span class="sand-box-form-label">Paste Your XML</span><br />
                        <span class="sand-box-form-label-small">for “SearchAvailableAppointments service” </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="sand-box-xml" ID="txtXMLSearchAvailableAppointments" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; width: 200px;">
                        <span class="sand-box-form-label">Paste Your XML</span><br />
                        <span class="sand-box-form-label-small">for “BookAppointment service” </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="sand-box-xml" ID="txtXMLBookAppointment" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />

        </div>
    </form>
    <script type="text/javascript">
        var app = angular.module('myApp', []);

        app.controller('myCtrl', function ($scope, $rootScope, $q, $http, $location) {
            var objLogin = {
                clientId: "",
                cocd: "",
                userid: "",
                userpassword: "",
                language: "",
                callcenterhours: ""
            };


            $scope.url = window.location.href.split('/')[2];

            $scope.getMiEnvironment = function () {
                try {
                    $http({
                        method: "GET",
                        url: "/test.sample",
                        headers: {
                            'Content-Type': 'application/JSON'
                        }
                    }).success(function (result) {
                        $rootScope.miEnvironment = JSON.parse(result);
                    }).error(function (result) {
                        alert('Failed to load MiEnvironment configuration settings !');
                    });
                }
                catch (e) {

                }

            }

            $scope.getMiEnvironment();

            $scope.objLogin = objLogin;

            $scope.login = function () {
                var grantType = "password";
                
                var clientSecret = $scope.getSecretKey($scope.objLogin.clientId);
                var Content_type_oauth = "application/x-www-form-urlencoded";

                var deferred = $q.defer();
                var authResult = { data: '', status: '' };

                try {
                    $http({
                        method: "POST",
                        url: $rootScope.miEnvironment.MYMITCHELL_HTTPS_URL + "/OAuth2Server/1.0/OAuth/Token",  //TODO: Temporary url will be replaced after service deployment. Need tp start the OAuth server solution first.
                        data: "grant_type=" + grantType + "&client_id=" + $scope.objLogin.clientId.toUpperCase() + "&client_secret=" + clientSecret + "&username=" + $scope.objLogin.userid + "&co_cd=" + $scope.objLogin.cocd + "&password=" + $scope.objLogin.userpassword,
                        headers: { 'Content-Type': Content_type_oauth }
                    }).success(function (result, status, headers, config) {

                        authResult.data = result;
                        authResult.status = status;
                        deferred.resolve(authResult);
                        var refreshtoken = authResult.data.refresh_token;

                        var companyCode = document.getElementById("txtOrgId").value;
                        var fnolInitiateFnolProcessXml = document.getElementById("txtXMLInitiateFnolProcess").value;
                        var fnolProcessFnolPackageXml = document.getElementById("txtXMLProcessFnolPackage").value;
                        var fnolSearchAvailableAppointmentsXml = document.getElementById("txtXMLSearchAvailableAppointments").value;
                        var fnolBookAppointmentXml = document.getElementById("txtXMLBookAppointment").value;


                        if (fnolInitiateFnolProcessXml != "" || fnolProcessFnolPackageXml != "" || fnolSearchAvailableAppointmentsXml != "" || fnolBookAppointmentXml != "") {
                            $http({
                                method: "POST",
                                url: "FNOLTestPage.aspx/UploadXMLService",
                                headers: {
                                    'Content-Type': "application/json; charset=utf-8"
                                },
                                data: {
                                    companyCode: '' + companyCode + '',
                                    userId: '' + $scope.objLogin.userid,
                                    fnolInitiateFnolProcessXml: '' + fnolInitiateFnolProcessXml,
                                    fnolProcessFnolPackageXml: '' + fnolProcessFnolPackageXml,
                                    fnolSearchAvailableAppointmentsXml: '' + fnolSearchAvailableAppointmentsXml,
                                    fnolBookAppointmentXml: '' + fnolBookAppointmentXml
                                }
                            }).success(function (data) {
                                location.href = "Default.aspx#/shell/" + objLogin.cocd + "/" + $scope.objLogin.language + "?token=" + refreshtoken + "&callcenterhours=" + $scope.objLogin.callcenterhours+"&clientId="+ $scope.objLogin.clientId;                               

                            })
                            .error(function (result) {
                                document.getElementById("lblmessage").innerHTML = result;
                            });
                        }
                        else {
                            location.href = "Default.html#/shell/" + objLogin.cocd + "/" + $scope.objLogin.language + "?token=" + refreshtoken + "&callcenterhours=" + $scope.objLogin.callcenterhours + "&clientId=" + $scope.objLogin.clientId;
                        }

                    }).error(function (result, status, headers, config) {

                        authResult.data = result;
                        authResult.status = status;
                        deferred.resolve(authResult);
                        alert('Invalid Credentials!');
                    });
                }
                catch (e) {
                    deferred.reject(e);
                }

                return deferred.promise;

            }


            $scope.getSecretKey = function () {
                var clientSecret = "";
                clientSecret = eval("$rootScope.miEnvironment.OAUTH_" + $scope.objLogin.clientId.toUpperCase() + "_SECRET");
                return clientSecret;
            }
        });

    </script>
</body>

</html>
