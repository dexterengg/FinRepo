<%@ Page Title="Insta-SIP" Language="C#" MasterPageFile="~/Plan/Website.master" AutoEventWireup="true" CodeFile="instaSIP-old.aspx.cs" Inherits="Plan_instaSIP" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>

/*form styles*/
#msform {	
width: 100%;
margin: 50px auto;
text-align: center;
position: relative;
}
#msform fieldset {
background: white;
border: 0 none;
border-radius: 3px;
box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
padding: 20px 30px;
box-sizing: border-box;
min-height: 350px;
width: 100%;
margin: 0 auto;
/*stacking fieldsets above each other*/
position: absolute;
text-align:center;
}
#msform fieldset h1 {
	font-size:30px;
	color:#333;
    margin-bottom:10px;
}
/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
display: none;
}
/*inputs*/
#msform input, #msform textarea {
padding: 15px;
border: 1px solid #ccc;
border-radius: 3px;
margin-bottom: 10px;
width: 100%;
box-sizing: border-box;
font-family: montserrat;
color: #2C3E50;
font-size: 13px;
}

/*buttons*/
#msform .action-button {
width: 100px;
background: #27AE60;
font-weight: bold;
color: white;
border: 0 none;
border-radius: 1px;
cursor: pointer;
padding: 10px 5px;
margin: 50px 5px 5px 5px;
}
#msform .action-button:hover, #msform .action-button:focus {
box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
font-size: 15px;
text-transform: uppercase;
color: #2C3E50;
margin-bottom: 10px;
}
.fs-subtitle {
font-weight: normal;
font-size: 13px;
color: #666;
margin-bottom: 20px;
}
/*progressbar*/
#progressbar {
margin-bottom: 30px;
overflow: hidden;
/*CSS counters to number the steps*/
counter-reset: step;
}
#progressbar li {
list-style-type: none;
color: #333;
text-transform: uppercase;
font-size: 9px;
width: 12.5%;
float: left;
position: relative;
}
#progressbar li:before {
content: counter(step);
counter-increment: step;
width: 20px;
line-height: 20px;
display: block;
font-size: 10px;
color: #333;
background: white;
border-radius: 3px;
border:1px solid #0274f5;
margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
content: counter(step);
width: 100%;
height: 2px;
background: #cccccc;
position: absolute;
color:#ffffff;
left: -50%;
top: 9px;
z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
/*connector not needed before the first step*/
content: none;
left: 0%;
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before, #progressbar li.active:after {
background: #0274f5;
color: white;
}


/**************added by Pradeept*****************/
p {margin:20px 0;}
a.radio-style {
    border: 4px solid transparent;
    display: inline-block;
    height: 140px;
    margin-right: 10px;
    text-decoration: none;
    width: 140px;
	border-radius:80px;
	box-shadow: 0 0 0 2px white, 0 0 0 3px #50b0eb;
}
a.radio-style:hover {
	box-shadow: 0 0 5px 1px #4fb0ee, 0 0 0 3px #4fb0ee;                     
}

    a.radio-style span {
        margin-top:130px; text-align:center; background-color:#f1f1f1; width:100%; font-size:14px; font-weight:bold;
    }


a#Age-30 {
    background: url("clickslider/30.png") no-repeat scroll 0 0 transparent;
}
a#Age-30-40 {
    background: url("clickslider/3040.png") no-repeat scroll 0 0 transparent;
}
a#Age-40-50 {
    background: url("clickslider/4050.png") no-repeat scroll 0 0 transparent;
}
a#Age-50 {
    background: url("clickslider/50.png") no-repeat scroll 0 0 transparent;
}
a#Status-single {
    background: url("clickslider/single.png") no-repeat scroll 0 0 transparent;
}
a#Status-no-kids {
    background: url("clickslider/nokids.png") no-repeat scroll 0 0 transparent;
}
a#Status-with-kids {
    background: url("clickslider/withkids.png") no-repeat scroll 0 0 transparent;
}
a#Status-retired {
    background: url("clickslider/retired.png") no-repeat scroll 0 0 transparent;
}
a#Term-1 {
    background: url("clickslider/1.png") no-repeat scroll 0 0 transparent;
}
a#Term-1-3 {
    background: url("clickslider/13.png") no-repeat scroll 0 0 transparent;
}
a#Term-3-5 {
    background: url("clickslider/35.png") no-repeat scroll 0 0 transparent;
}
a#Term-5-10 {
    background: url("clickslider/510.png") no-repeat scroll 0 0 transparent;
}
a#Term-10 {
    background: url("clickslider/10.png") no-repeat scroll 0 0 transparent;
}
a#Knowledge-beginner {
    background: url("clickslider/beginner.png") no-repeat scroll 0 0 transparent;
}
a#Knowledge-fair {
    background: url("clickslider/fair.png") no-repeat scroll 0 0 transparent;
}
a#Knowledge-expert {
    background: url("clickslider/expert.png") no-repeat scroll 0 0 transparent;
}
a#Mindset-gain {
    background: url("clickslider/gain.png") no-repeat scroll 0 0 transparent;
}
a#Mindset-loss {
    background: url("clickslider/loss.png") no-repeat scroll 0 0 transparent;
}
a#Mindset-both {
    background: url("clickslider/both.png") no-repeat scroll 0 0 transparent;
}
a#Actionplan-sellall {
    background: url("clickslider/sellall.png") no-repeat scroll 0 0 transparent;
}
a#Actionplan-sellsome {
    background: url("clickslider/sellsome.png") no-repeat scroll 0 0 transparent;
}
a#Actionplan-keepall {
    background: url("clickslider/keepall.png") no-repeat scroll 0 0 transparent;
}
a#Actionplan-buy{
    background: url("clickslider/buy.png") no-repeat scroll 0 0 transparent;
}
a#Risk-low {
    background: url("clickslider/low.png") no-repeat scroll 0 0 transparent;
}
a#Risk-moderate {
    background: url("clickslider/moderate.png") no-repeat scroll 0 0 transparent;
}
a#Risk-high{
    background: url("clickslider/high.png") no-repeat scroll 0 0 transparent;
}
a#Investent-amount{
    background: url("clickslider/invest.png") no-repeat scroll 0 0 transparent;
}
a.green-border {
	border:2px solid green;
}
.hidden {
    left: -10000px;
    position: absolute;
    top: -1000px;
}
span{float:left;}

 output {
            display: block;
            font-size: 30px !important;
            font-weight: bold;
            text-align: center;
            margin: 30px 0;
			width:100%;

        }
    .amount {
        width:50%;
        margin:auto;
    }
</style>


<link rel="stylesheet" href="rangeslider/rangeslider.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="MainContainer">
        <div class="slide-area">
             <div class="fin-health">
        <h1 style="margin-top:10px" align="center">Your Investment Plan Selfie (#IPSelfie)</h1>
<!-- multistep form -->
<div id="msform">
<!-- progressbar -->
<ul id="progressbar">
<li class="active">Age</li>
<li>Status</li>
<li>Term</li>
<li>Knowledge</li>
<li>Mindset</li>
<li>Action Plan</li>
<li>Risk</li>
<li>Investment</li>
</ul>
<!-- fieldsets -->
	<fieldset>
    	<h1>Which age bracket do you fall in?<br/><br/></h1>
        <input type="radio" value="Less than 30 Years" name="age" id="age_1" class="hidden" />              
        <a id="Age-30" href="javascript:set_radio('age_1');" title="Less than 30 Years" class="radio-style">&nbsp;
            <span><30 Years</span>
        </a>

        <input type="radio" value="30 - 40 Years" name="age" id="age_2" class="hidden" />
        <a id="Age-30-40" href="javascript:set_radio('age_2');" title="30 - 40 Years" class="radio-style">&nbsp;
            <span>30-40 Years</span>
        </a>


        <input type="radio" value="40 - 50 Years" name="age" id="age_3" class="hidden" />
        <a id="Age-40-50" href="javascript:set_radio('age_3');" title="40 - 50 Years" class="radio-style">&nbsp;
            <span>40-50 Years</span>
        </a>
        
        <input type="radio" value="Above 50 Years" name="age" id="age_4" class="hidden" />
        <a id="Age-50" href="javascript:set_radio('age_4');" title="Above 50 Years" class="radio-style">&nbsp;
            <span>>50 Years</span>
        </a>        
    </fieldset>
    <fieldset>
        <h1>Which defines your status best?<br/><br/></h1>
        <input type="radio" value="Single" name="status" id="status_1" class="hidden" />
        <a id="Status-single" href="javascript:set_radio('status_1');" title="Single" class="radio-style">&nbsp;
            <span>Single</span>
        </a>

        <input type="radio" value="Married with no Kids" name="status" id="status_2" class="hidden" />
        <a id="Status-no-kids" href="javascript:set_radio('status_2');" title="Married with no Kids" class="radio-style">&nbsp;
            <span>Married w/o Kids</span>
        </a>

        <input type="radio" value="Married with Kids" name="status" id="status_3" class="hidden" />
        <a id="Status-with-kids" href="javascript:set_radio('status_3');" title="Married with Kids" class="radio-style">&nbsp;
            <span>Married with Kids</span>
        </a> 
        
        <input type="radio" value="Retired" name="status" id="status_4" class="hidden" />
        <a id="Status-retired" href="javascript:set_radio('status_4');" title="Retired" class="radio-style">&nbsp;
            <span>Retired</span>
        </a>                
        <br>
        <input type="button" name="previous" class="previous action-button" value="Back" />
    </fieldset>
    <fieldset>
        <h1>For how long would you like to Invest?<br/><br/></h1>
        <input type="radio" value="1" name="term" id="term_1" class="hidden" />
        <a id="Term-1" href="javascript:set_radio('term_1');" title="Less than 1 year" class="radio-style">&nbsp;
            <span>< 1 Yr</span>
        </a>
        
        <input type="radio" value="3" name="term" id="term_2" class="hidden" />
        <a id="Term-1-3" href="javascript:set_radio('term_2');" title="1 to 3 years" class="radio-style">&nbsp;
            <span>1-3 Yrs</span>
        </a>

        <input type="radio" value="5" name="term" id="term_3" class="hidden" />
        <a id="Term-3-5" href="javascript:set_radio('term_3');" title="3 to 5 years" class="radio-style">&nbsp;
            <span>3-5 Yrs</span>
        </a>

        <input type="radio" value="10" name="term" id="term_4" class="hidden" />
        <a id="Term-5-10" href="javascript:set_radio('term_4');" title="5 to 10 years" class="radio-style">&nbsp;
            <span>5-10 Yrs</span>
        </a> 
        
        <input type="radio" value="11" name="term" id="term_5" class="hidden" />
        <a id="Term-10" href="javascript:set_radio('term_5');" title="more than 10 years" class="radio-style">&nbsp;
            <span>> 10 Yrs</span>
        </a>                
        <br>
        <input type="button" name="previous" class="previous action-button" value="Back" />
    </fieldset>
    <fieldset>
        <h1>How would you rate your knowledge on Investment & Mutual Funds?<br/><br/></h1>
        <input type="radio" value="2.5" name="knowledge" id="knowledge_1" class="hidden" />
        <a id="Knowledge-beginner" href="javascript:set_radio('knowledge_1');" title="	Beginner" class="radio-style">&nbsp;
            <span>Beginner</span>
        </a>
        
        <input type="radio" value="5" name="knowledge" id="knowledge_2" class="hidden" />
        <a id="Knowledge-fair" href="javascript:set_radio('knowledge_2');" title="Fair Knowledge" class="radio-style">&nbsp;
            <span>Fair Knowledge</span>
        </a>

        <input type="radio" value="10" name="knowledge" id="knowledge_3" class="hidden" />
        <a id="Knowledge-expert" href="javascript:set_radio('knowledge_3');" title="Expert" class="radio-style">&nbsp;
            <span>Expert</span>
        </a>               
         <br>
        <input type="button" name="previous" class="previous action-button" value="Back" />
    </fieldset>
    <fieldset>
        <h1>While Investing, which of the following you care most?<br/><br/></h1>
        <input type="radio" value="10" name="mindset" id="mindset_1" class="hidden" />
        <a id="Mindset-gain" href="javascript:set_radio('mindset_1');" title="To Maximize Gain" class="radio-style">&nbsp;
            <span>To Maximize Gain</span>
        </a>
        
        <input type="radio" value="2.5" name="mindset" id="mindset_2" class="hidden" />
        <a id="Mindset-loss" href="javascript:set_radio('mindset_2');" title="To Minimize Loss" class="radio-style">&nbsp;
            <span>To Minimize Loss</span>
        </a>

        <input type="radio" value="5" name="mindset" id="mindset_3" class="hidden" />
        <a id="Mindset-both" href="javascript:set_radio('mindset_3');" title="Both" class="radio-style">&nbsp;
            <span>Both</span>
        </a>         
        <br>
        <input type="button" name="previous" class="previous action-button" value="Back" />
    </fieldset>
    <fieldset>
        <h1>The stock market declines by 20% and your portfolio falls by 20% in a month, what will you do?<br/><br/></h1>
        <input type="radio" value="2.5" name="actionplan" id="actionplan_1" class="hidden" />
        <a id="Actionplan-sellall" href="javascript:set_radio('actionplan_1');" title="Sell All" class="radio-style">&nbsp;
            <span>Sell All</span>
        </a>
        
        <input type="radio" value="5" name="actionplan" id="actionplan_2" class="hidden" />
        <a id="Actionplan-sellsome" href="javascript:set_radio('actionplan_2');" title="Sell Some" class="radio-style">&nbsp;
            <span>Sell Some</span>
        </a>

        <input type="radio" value="7.5" name="actionplan" id="actionplan_3" class="hidden" />
        <a id="Actionplan-keepall" href="javascript:set_radio('actionplan_3');" title="Keep All" class="radio-style">&nbsp;
            <span>Keep All</span>
        </a>
        
        <input type="radio" value="10" name="actionplan" id="actionplan_4" class="hidden" />
        <a id="Actionplan-buy" href="javascript:set_radio('actionplan_4');" title="Buy More" class="radio-style">&nbsp;
            <span>Buy More</span>
        </a>                 
        <br>
        <input type="button" name="previous" class="previous action-button" value="Back" />
    </fieldset>
    <fieldset>
        <h1>How would you rate your risk taking ability?<br/><br/></h1>
        <input type="radio" value="2.5" name="risk" id="risk_1" class="hidden" />
        <a id="Risk-low" href="javascript:set_radio('risk_1');" title="Low" class="radio-style">&nbsp;
            <span>Low</span>
        </a>
        
        <input type="radio" value="5" name="risk" id="risk_2" class="hidden" />
        <a id="Risk-moderate" href="javascript:set_radio('risk_2');" title="Moderate" class="radio-style">&nbsp;
            <span>Moderate</span>
        </a>

        <input type="radio" value="10" name="risk" id="risk_3" class="hidden" />
        <a id="Risk-high" href="javascript:set_radio('risk_3');" title="High" class="radio-style">&nbsp;
            <span>High</span>
        </a>       
        <br>
        <input type="button" name="previous" class="previous action-button" value="Back" />
    </fieldset>
    <fieldset>
        <h1>Amount to be invested?<br/><br/></h1>        
        <div class="amount">
            <input type="range"  min="5000"  max="200000" step="1000" name="amt" value="10000" data-rangeslider>
            <output></output>
        </div>
        <br>
        <input type="button" name="previous" class="previous action-button" value="Back" />                
        <input type="submit" name="submit" class="submit action-button" value="Submit" />
    </fieldset>
</div>

<!-- jQuery --> 
<!-- jQuery easing plugin --> 

<script>
    $(function () {

        //jQuery time
        var current_fs, next_fs, previous_fs; //fieldsets
        var left, opacity, scale; //fieldset properties which we will animate
        var animating; //flag to prevent quick multi-click glitches
        var q1 = "", q2 = "", q3 = "", q4 = "", q5 = "", q6 = "", q7 = "", amt = "", score = "";
        var planURL = "";

        $("input:radio[name=age]").click(function () {
            q1 = $(this).val();
            //alert(q1);

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });

        });

        $("input:radio[name=status]").click(function () {
            q2 = $(this).val();
            //alert(q2);

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });

        });

        $("input:radio[name=term]").click(function () {
            q3 = $(this).val();
            //alert(q3);

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });

        });

        $("input:radio[name=knowledge]").click(function () {
            q4 = parseFloat($(this).val());
            //alert(q4);

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });

        });

        $("input:radio[name=mindset]").click(function () {
            q5 = parseFloat($(this).val());
            //alert(q5);

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });

        });

        $("input:radio[name=actionplan]").click(function () {
            q6 = parseFloat($(this).val());
            //alert(q6);

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });

        });

        $("input:radio[name=risk]").click(function () {
            q7 = parseFloat($(this).val());
            //alert(q7);

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });

        });



        $(".next").click(function () {
            if (animating) return false;
            animating = true;

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });
        });

        $(".previous").click(function () {
            if (animating) return false;
            animating = true;

            current_fs = $(this).parent();
            previous_fs = $(this).parent().prev();

            //de-activate current step on progressbar
            $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

            //show the previous fieldset
            previous_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale previous_fs from 80% to 100%
                    scale = 0.8 + (1 - now) * 0.2;
                    //2. take current_fs to the right(50%) - from 0%
                    left = ((1 - now) * 50) + "%";
                    //3. increase opacity of previous_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'left': left });
                    previous_fs.css({ 'transform': 'scale(' + scale + ')', 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'linear'
            });
        });

        $(".submit").click(function () {
            //alert("hello");            
            window.event.returnValue = false;
            amt = $("input[type=range]").val();
            score = parseFloat(q4) + parseFloat(q5) + parseFloat(q6) + parseFloat(q7);
            window.location.href = "openPlanOutput.aspx?q1=" + q1 + "&q2=" + q2 + "&amt=" + amt + "&score=" + score + "&invage=" + q3 + "&risk=" + q7 + "";
            planURL = "openPlanOutput.aspx?q1=" + q1 + "&q2=" + q2 + "&amt=" + amt + "&score=" + score + "&invage=" + q3 + "&risk=" + q7 + "";
            window.location = planURL;
            window.location.assign(planURL);
            setTimeout(function () { document.location.href = planURL }, 500);


        })

    });
</script>


<script type="text/javascript">

    function set_radio($inputid) {
        $("input#" + $inputid).click();
    }
</script>

<script src="rangeslider/rangeslider.js"></script>
    <script>
        $(function () {
            var $document = $(document);
            var selector = '[data-rangeslider]';
            var $element = $(selector);
            // For ie8 support
            var textContent = ('textContent' in document) ? 'textContent' : 'innerText';
            // Example functionality to demonstrate a value feedback
            function valueOutput(element) {
                var value = element.value;
                var output = element.parentNode.getElementsByTagName('output')[0] || element.parentNode.parentNode.getElementsByTagName('output')[0];
                output[textContent] = value;
            }
            $document.on('input', 'input[type="range"], ' + selector, function (e) {
                valueOutput(e.target);
            });


            // Basic rangeslider initialization
            $element.rangeslider({
                // Deactivate the feature detection
                polyfill: false,
                // Callback function
                onInit: function () {
                    valueOutput(this.$element[0]);
                },
                // Callback function
                onSlide: function (position, value) {
                    console.log('onSlide');
                    console.log('position: ' + position, 'value: ' + value);
                },
                // Callback function
                onSlideEnd: function (position, value) {
                    console.log('onSlideEnd');
                    console.log('position: ' + position, 'value: ' + value);
                }
            });
        });
    </script>
                 <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
    </div>
      </div>  
    </div>
    <div class="clear"></div>  
</asp:Content>

