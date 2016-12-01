<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Conclusion.aspx.cs" Inherits="SFinancialPlanning_Conclusion" %>

<!DOCTYPE html>

<html class="full">
<head runat="server">
    <title>Fincart Financial Planning</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/fusioncharts.js"></script>
    <script src="Scripts/fusioncharts.theme.fint.js"></script>
    <script src="Scripts/fusioncharts.widgets.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        // Load the Visualization API
        google.load('visualization', '1.0', { 'packages': ['corechart'] });
        // Set a callback to run when the Google Visualization API is loaded.
        // This callback function actually draws the chart
        // google.setOnLoadCallback(drawChart);
        // Draw the chart
        // This is where chart logic is located
        function drawChart(assetdata) {
            // Add the data to the chart
            var data = new google.visualization.DataTable();
            // Add columns
            data.addColumn('string', 'Asset');
            data.addColumn('number', 'Count');
            // Add rows
            data.addRows(assetdata);
            // Set chart options
            var options = {
                'width': '100%',
                'height': 350,
                is3D: true
            };
            // Draw the chart

            var formatter = new google.visualization.NumberFormat({ pattern: '###', fractionDigits: 0 });
            formatter.format(data, 1);

            var chart = new google.visualization.PieChart(document.getElementById('chart_wrap'));
            chart.draw(data, options);
        }

    </script>

    <style>
        #chartdiv {
            width: 100%;
            height: 380px;
            font-size: 16rem;
        }

        .full {
            background: url(images/background_1680x1050.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .price_table_container {
            text-align: center;
            color: #666;
            margin-top: 35px;
            font-family: 'Open Sans', sans-serif;
        }

        .price_table_heading {
            font-size: 36px;
            padding: 10px;
            background: #EEE;
        }


        .price_table_row {
            padding: 15px;
            background: #FFF;
        }

        .cost {
            padding: 30px;
            font-size: 30px;
        }

            .cost span {
                font-size: 15px;
            }

        .price_table_row:nth-of-type(even) {
            background: #F8F8F8;
        }

        .btn {
            border-radius: 0px;
        }

        .recommended {
            /*USER DEFINED COLOUR*/
            background: #FF3A3A;
            color: #FFF;
            /*USER DEFINED COLOUR*/
            padding: 3px 0 3px 0;
            margin-top: 10px;
            text-align: center;
            margin-bottom: -35px;
            font-family: 'Open Sans', sans-serif;
        }


        .spacer {
            width: 100%;
            height: 50px;
        }


        /*Already Defined Colours*/
        /*Background*/
        .primary-bg {
            background: #337AB7;
            color: #FFF;
        }

        .success-bg {
            background: #5CB85C;
            color: #FFF;
        }

        .info-bg {
            background: #5BC0DE;
            color: #FFF;
        }

        .warning-bg {
            background: #F0AD4E;
            color: #FFF;
        }

        .danger-bg {
            background: #D9534F;
            color: #FFF;
        }

        .dark-bg {
            background: #444;
            color: #FFF;
        }

        .royal-bg {
            background: #8E74E2;
            color: #FFF;
        }

        .static-bg {
            background: #2BB0A6;
            color: #FFF;
        }

        /*Only Text Colours*/
        .primary-text {
            background: #FFF;
            color: #337AB7;
        }

        .success-text {
            background: #FFF;
            color: #5CB85C;
        }

        .info-text {
            background: #FFF;
            color: #5BC0DE;
        }

        .warning-text {
            background: #FFF;
            color: #F0AD4E;
        }

        .danger-text {
            background: #FFF;
            color: #D9534F;
        }

        .dark-text {
            background: #FFF;
            color: #444;
        }

        .royal-text {
            background: #FFF;
            color: #8E74E2;
        }

        .static-text {
            background: #FFF;
            color: #2BB0A6;
        }

        .cost {
            font-size: 29px;
        }
        /*Additional Button styles*/

        /*BTN-DARK*/
        .btn-dark {
            color: #fff;
            background-color: #444;
            border-color: #444;
        }

            .btn-dark:hover,
            .btn-dark:focus,
            .btn-dark.focus,
            .btn-dark:active,
            .btn-dark.active,
            .open > .dropdown-toggle.btn-dark {
                color: #fff;
                background-color: #222;
                border-color: #222;
            }

            .btn-dark:active,
            .btn-dark.active,
            .open > .dropdown-toggle.btn-dark {
                background-image: none;
            }


        /*BTN-ROYAL---------*/
        .btn-royal {
            color: #fff;
            background-color: #8E74E2;
            border-color: #8E74E2;
        }

            .btn-royal:hover,
            .btn-royal:focus,
            .btn-royal.focus,
            .btn-royal:active,
            .btn-royal.active,
            .open > .dropdown-toggle.btn-royal {
                color: #fff;
                background-color: #7451E8;
                border-color: #7451E8;
            }

            .btn-royal:active,
            .btn-royal.active,
            .open > .dropdown-toggle.btn-royal {
                background-image: none;
            }


        /*BTN-STATIC---------*/
        .btn-static {
            color: #fff;
            background-color: #2BB0A6;
            border-color: #2BB0A6;
        }

            .btn-static:hover,
            .btn-static:focus,
            .btn-static.focus,
            .btn-static:active,
            .btn-static.active,
            .open > .dropdown-toggle.btn-static {
                color: #fff;
                background-color: #07A094;
                border-color: #07A094;
            }

            .btn-static:active,
            .btn-static.active,
            .open > .dropdown-toggle.btn-static {
                background-image: none;
            }
    </style>
</head>

<body style="background: none;">
    <form id="form2" runat="server">
        <!-- Top menu -->
        <nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" style="height: 55px;" href="../Default.aspx"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="top-navbar-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <span class="li-text">
                                <asp:LinkButton ID="lnkbtn_logout" runat="server" OnClick="lnkbtn_logout_Click">Logout</asp:LinkButton>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>
            <div class="container">
                <div class="row form-bottom">
                    <h1 align="center" style="color: #ffffff;"><span id="username"></span></h1>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost info-bg"><strong>Personal Profile</strong></div>
                                <div class="price_table_row">Status: <span id="userstatus"></span></div>
                                <div class="price_table_row">Mobile: <span id="usermobile"></span></div>
                                <div class="price_table_row">Email: <span id="useremail"></span></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost success-bg"><strong>Retirement Milestone</strong></div>
                                <div class="price_table_row">Current Age: <span id="userage"></span></div>
                                <div class="price_table_row">Retirement Age: <span id="userretirementage"></span></div>
                                <div class="price_table_row">Life Expentency: <span id="userlifeexpentency"></span></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost danger-bg"><strong>Risk-O-Meter</strong></div>
                                <div id="chart-container"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row form-bottom">

                    <h1 align="center" style="color: #ffffff;">The Way Forward</h1>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost warning-bg"><strong>Emergency Fund</strong></div>
                                <div class="price_table_row">Investment needed: <span id="efundA"></span></div>
                            </div>
                            <a id="Ehref" href="#" class="btn btn-warning btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost warning-bg"><strong>Term Insurance</strong></div>
                                <div class="price_table_row" id="riskLife_div">Life Insurance Needed:<span id="riskLife"></span> </div>
                            </div>
                            <a href="../OnlineTermInsurance.aspx" class="btn btn-warning btn-lg btn-block">Click for Best Insurance Options</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost warning-bg"><strong>Medical Insurance</strong></div>
                                <div class="price_table_row" id="riskHealth_div">Health Insurance Needed: <span id="riskHealth"></span></div>
                            </div>
                            <a href="../OnlineHealthInsurance.aspx" class="btn btn-warning btn-lg btn-block">Click for Best Insurance Options</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Education" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost info-bg"><strong>Children’s Education</strong></div>
                                <div class="price_table_row">Amount needed: <span id="EducationA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="EducationM"></span></div>
                            </div>
                            <a id="CEhref" href="#" class="btn btn-info btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Marriage" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost success-bg"><strong>Children’s Marriage</strong></div>
                                <div class="price_table_row">Amount needed: <span id="MarriageA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="MarriageM"></span></div>
                            </div>
                            <a id="CMhref" href="#" class="btn btn-success btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="asset" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost dark-bg"><strong>Buying Asset</strong></div>
                                <div class="price_table_row">Amount needed: <span id="assetA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="assetM"></span></div>
                            </div>
                            <a id="Ahref" href="#" class="btn btn-dark btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Vacation" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost royal-bg"><strong>Vacation</strong></div>
                                <div class="price_table_row">Amount needed: <span id="VacationA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="VacationM"></span></div>
                            </div>
                            <a id="Vhref" href="#" class="btn btn-royal btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Others" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost success-bg"><strong>Others</strong></div>
                                <div class="price_table_row">Amount needed: <span id="OthersA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="OthersM"></span></div>
                            </div>
                            <a id="Ohref" href="#" class="btn btn-success btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Retirement" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost primary-bg"><strong>Retirement</strong></div>
                                <div class="price_table_row">Amount needed: <span id="RetirementA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="RetirementM"></span></div>
                            </div>
                            <a id="Rhref" href="#" class="btn btn-primary btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost success-bg" style="cursor: pointer;">Estate Planning: Get your personalised online will.</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-12 float-shadow" style="display:none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost static-bg"><strong>Asset Allocation</strong></div>
                                <!--<div id="chartdiv"></div>-->
                                <div id="chart_wrap"></div>

                            </div>
                            <a id="AAhref" href="#" class="btn btn-static btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                </div>
                <div class="row form-bottom" style="text-align:center;">
                    <button type="button" onclick="window.location.href='src/Questions.aspx'" class="btn btn-previous">Change Answers</button>
<%--                    <button type="button" class="btn btn-next pull-right">Open Account</button>--%>
                </div>
            </div>

        </div>
        <script>


            $(document).ready(function () {

                $.ajax({
                    type: "POST",
                    url: "Conclusion.aspx/getplan",
                    data: "{'id':1}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var d = JSON.parse(data.d);
                        $('#username').text(d.name + "'s – Financial Plan");

                        $('#Ehref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#CEhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#CMhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#Ahref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#Vhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#Ohref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#Rhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#AAhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);

                        $('#userstatus').text(d.status);
                        $('#usermobile').text("+91" + d.mobile);
                        $('#useremail').text(d.email);

                        $('#userage').text(d.currrentage);
                        $('#userretirementage').text(d.retirementage);
                        $('#userlifeexpentency').text(d.lifeexpentency);

                        $('#efundA').text(d.E_Fund_Amount);

                        $('#riskLife').text(d.Risk_T_Insurance);

                        $('#riskHealth').text(d.Risk_FF_Insurance);


                        if (d.Asset) {
                            $('#asset').css("display", "Block");
                            $('#assetA').text(d.Asset_Amount);
                            $('#assetM').text(d.Asset_SIP);
                        }

                        if (d.Vacation) {
                            $('#Vacation').css("display", "Block");
                            $('#VacationA').text(d.Vacation_Amount);
                            $('#VacationM').text(d.Vacation_SIP);
                        }

                        if (d.Retire) {
                            $('#Retirement').css("display", "Block");
                            $('#RetirementA').text(d.Retire_Amount);
                            $('#RetirementM').text(d.Retire_SIP);
                        }

                        if (d.other) {
                            $('#Others').css("display", "Block");
                            $('#OthersA').text(d.other_Amount);
                            $('#OthersM').text(d.other_SIP);
                        }

                        if (d.ChildE) {
                            $('#Education').css("display", "Block");
                            $('#EducationA').text(d.ChildE_Amount);
                            $('#EducationM').text(d.ChildE_SIP);
                        }

                        if (d.ChildM) {
                            $('#Marriage').css("display", "Block");
                            $('#MarriageA').text(d.ChildM_Amount);
                            $('#MarriageM').text(d.ChildM_SIP);
                        }

                        var res = d.chartdata.split("~");

                        var assetdata = [];

                        for (var i = 0; i < res.length; i++) {

                            var r = res[i].split(",");

                            var crdat = ['' + r[0] + '', parseInt(r[1])];//'{ "text": "' + r[0] + '", "values": [' + r[1] + '] },';

                            assetdata.push(crdat);
                        }

                        drawChart(assetdata);

                        FusionCharts.ready(function () {
                            var cSatScoreChart = new FusionCharts({
                                type: 'angulargauge',
                                renderAt: 'chart-container',
                                width: '100%',
                                height: '180',
                                dataFormat: 'json',
                                dataSource: {
                                    "chart": {
                                        "caption": "",
                                        "subcaption": "",
                                        "lowerLimit": "10",
                                        "upperLimit": "40",
                                        "lowerLimitDisplay": "Low",
                                        "upperLimitDisplay": "High",
                                        "showValue": "0",
                                        "valueBelowPivot": "1",
                                        "pivotRadius": "0",
                                        "theme": "fint",
                                        "showTickMarks": "0",
                                        "tickValueStep": "5",
                                        "gaugeFillMix": "{dark-40},{light-40},{dark-20}",
                                    },
                                    "colorRange": {
                                        "color": [
                                            {
                                                "minValue": "10",
                                                "maxValue": "20",
                                                "code": "#6baa01"
                                            },
                                            {
                                                "minValue": "20",
                                                "maxValue": "30",
                                                "code": "#f8bd19"
                                            },
                                            {
                                                "minValue": "30",
                                                "maxValue": "40",
                                                "code": "#e44a00"
                                            }
                                        ]
                                    },
                                    "dials": {
                                        "dial": [{
                                            "radius": "80",
                                            "baseWidth": "40",
                                            "baseRadius": "25",
                                            "topWidth": "1",
                                            "rearExtension": "0",
                                            "value": d.Risk_Ability
                                        },
                                         {
                                             "radius": "48",
                                             "bgColor": "ffffff",
                                             "borderAlpha": "0",
                                             "baseWidth": "45",
                                             "baseRadius": "25",
                                             "topWidth": "40",
                                             "rearExtension": "2",
                                             "value": d.Risk_Ability,
                                             "showValue": "0"
                                         }]
                                    }
                                }
                            }).render();
                        });

                    }
                });

            });
        </script>
    </form>
</body>

</html>

