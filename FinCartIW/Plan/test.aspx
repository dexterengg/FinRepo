<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="Plan_test" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex">

    <title>Bootstrap Pricing Slider (Donations) - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    body {
    padding-top: 50px;
    padding-bottom: 50px;
}

.price-box {
    margin: 0 auto;
	background: #E9E9E9;
	border-radius: 10px;
	padding: 40px 15px;
	width: 500px;
}

.ui-widget-content {
	border: 1px solid #bdc3c7;
	background: #e1e1e1;
	color: #222222;
	margin-top: 4px;
}

.ui-slider .ui-slider-handle {
	position: absolute;
	z-index: 2;
	width: 5.2em;
	height: 2.2em;
	cursor: default;
	margin: 0 -40px auto !important;
	text-align: center;	
	line-height: 30px;
	color: #FFFFFF;
	font-size: 15px;
}

.ui-slider .ui-slider-handle .glyphicon {
	color: #FFFFFF;
	margin: 0 3px; 
	font-size: 11px;
	opacity: 0.5;
}

.ui-corner-all {
	border-radius: 20px;
}

.ui-slider-horizontal .ui-slider-handle {
	top: -.9em;
}

.ui-state-default,
.ui-widget-content .ui-state-default {
	border: 1px solid #f9f9f9;
	background: #3498db;
}

.ui-slider-horizontal .ui-slider-handle {
	margin-left: -0.5em;
}

.ui-slider .ui-slider-handle {
	cursor: pointer;
}

.ui-slider a,
.ui-slider a:focus {
	cursor: pointer;
	outline: none;
}

.price, .lead p {
	font-weight: 600;
	font-size: 32px;
	display: inline-block;
	line-height: 60px;
}

h4.great {
	background: #00ac98;
	margin: 0 0 25px -60px;
	padding: 7px 15px;
	color: #ffffff;
	font-size: 18px;
	font-weight: 600;
	border-radius: 5px;
	display: inline-block;
	-moz-box-shadow:    2px 4px 5px 0 #ccc;
  	-webkit-box-shadow: 2px 4px 5px 0 #ccc;
  	box-shadow:         2px 4px 5px 0 #ccc;
}

.total {
	border-bottom: 1px solid #7f8c8d;
	/*display: inline;
	padding: 10px 5px;*/
	position: relative;
	padding-bottom: 20px;
}

.total:before {
	content: "";
	display: inline;
	position: absolute;
	left: 0;
	bottom: 5px;
	width: 100%;
	height: 3px;
	background: #7f8c8d;
	opacity: 0.5;
}

.price-slider {
	margin-bottom: 70px;
}

.price-slider span {
	font-weight: 200;
	display: inline-block;
	color: #7f8c8d;
	font-size: 13px;
}

.form-pricing {
	background: #ffffff;
	padding: 20px;
	border-radius: 4px;
}

.price-form {
	background: #ffffff;
	margin-bottom: 10px;
	padding: 20px;
	border: 1px solid #eeeeee;
	border-radius: 4px;
	/*-moz-box-shadow:    0 5px 5px 0 #ccc;
  	-webkit-box-shadow: 0 5px 5px 0 #ccc;
  	box-shadow:         0 5px 5px 0 #ccc;*/
}

.form-group {
	margin-bottom: 0;
}

.form-group span.price {
	font-weight: 200;
	display: inline-block;
	color: #7f8c8d;
	font-size: 14px;
}

.help-text {
	display: block;
	margin-top: 32px;
	margin-bottom: 10px;
	color: #737373;
	position: absolute;
	/*margin-left: 20px;*/
	font-weight: 200;
	text-align: right;
	width: 188px;
}

.price-form label {
	font-weight: 200;
	font-size: 21px;
}

img.payment {
	display: block;
    margin-left: auto;
    margin-right: auto
}

.ui-slider-range-min {
	background: #2980b9;
}

/* HR */

hr.style {
	margin-top: 0;
    border: 0;
    border-bottom: 1px dashed #ccc;
    background: #999;
}
    </style>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function () { };
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css) {
            if (css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="' + css + '" type="text/css" />');
            else $('head > link').filter(':first').replaceWith(defaultCSS);
        }
        $(document).ready(function () {
            var iframe_height = parseInt($('html').height());
            window.parent.postMessage(iframe_height, 'http://bootsnipp.com');
        });
    </script>
</head>
<body>
	
    <div class="container">

      <div class="price-box">

        <form runat="server" class="form-horizontal form-pricing" role="form">

          <div class="price-slider">
            <h4 class="great">Amount</h4>
            <span>Minimum $10 is required</span>
            <div class="col-sm-12">
              <div id="PRslider"></div>
                
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            </div>
          </div>
          

            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

          
        </form>

       

      </div>

    </div>

    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $("#PRslider").slider({
	            animate: true,
	            value: 10000,
	            min: 5000,
	            max: 100000,
	            step: 1000,
	            slide: function (event, ui) {
	                update(1, ui.value); //changed
	            }
	        });

	        //Added, set initial value.
	        $("#txtAmount").val(10000);
	        

	        update();
	    });

	    //changed. now with parameter
	    function update(slider, val) {
	        //changed. Now, directly take value from ui.value. if not set (initial, will use current value.)
	        var $amount = slider == 1 ? val : $("#txtAmount").val();
	        $("#txtAmount").val($amount);
	        
	        $('#PRslider a').html('<label><span class="glyphicon glyphicon-chevron-left"></span> ' + $amount + ' <span class="glyphicon glyphicon-chevron-right"></span></label>');
	        
	    }
	</script>
</body>
</html>


