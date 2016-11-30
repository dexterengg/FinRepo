function bindDepartment(ddlDepartment) {

    $("<div class='preloaderoverlay'><div class='md-preloader pl-size-md' style='top:40%;left:40%;position:relative; z-index: 2'><svg viewbox='0 0 75 75'><circle cx='37.5' cy='37.5' r='33.5' class='pl-red' stroke-width='4' /></svg></div><p id='preloaderoverlaymsg' style='top:40%;left:40%;position:relative; z-index: 2'></p></div>")
    .appendTo($("#preloaderoverlay").css("position", "relative"));

    startPreloader("Loading Departments...");

    $.ajax({
        type: "POST",
        url: "Tickets.aspx/GetDepartments",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            ddlDepartment.empty().append('<option selected="selected" value="0">Select Department</option>');
            var ul = ddlDepartment.prev().children();
            ul.empty().append("<li id='ddlDepartmentli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Department</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
            $.each(r.d, function (index) {
                var i = index + 1;
                ul.append("<li id='ddlDepartmentli"+i+"' data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['Name'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
                ddlDepartment.append($("<option></option>").val(this['Code']).html(this['Name']));
            });

            endPreloader("");
        },
        error: function (r) {
            endPreloader("Error");
        }
    });
}

function startPreloader(msg) {
    $('.preloaderoverlay').css("display", "block");
    $('#preloaderoverlaymsg').text(msg);
}

function endPreloader(msg) {
    if (msg) {
        $('#preloaderoverlaymsg').text(msg + " Please Refresh Page.");
    }
    else {
        $('.preloaderoverlay').css("display", "none");
    }
}

function departmentChange(ddlDepartment,depid, ddlDesignation, ddlAssignTo, ddlReportTo) {
    startPreloader("Loading Designations...");

    $('#ddlDepartmentli' + ddlDepartment.prop('selectedIndex')).addClass('selected');

    ddlDesignation.empty().append('<option selected="selected" value="0">Select Designation</option>');
    ddlDesignation.prev().prev().children(":first").text("Select Designation");
    var ul = ddlDesignation.prev().children();
    ul.empty().append("<li id='ddlDesignationli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Designation</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");


    ddlAssignTo.empty().append('<option selected="selected" value="0">Select Assign To</option>');
    ddlAssignTo.prev().prev().children(":first").text("Select Assign To");
    var ul1 = ddlAssignTo.prev().children();
    ul1.empty().append("<li id='ddlAssignToli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Assign To</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");


    ddlReportTo.empty().append('<option selected="selected" value="0">Select Report To</option>');
    ddlReportTo.prev().prev().children(":first").text("Select Report To");
    var ul2 = ddlReportTo.prev().children();
    ul2.empty().append("<li id='ddlReportToli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Report To</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");

    $.ajax({
        type: "POST",
        url: "Tickets.aspx/GetRoles",
        data: '{depid:"' + depid + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            $.each(r.d, function (index) {
                var i = index + 1;
                ul.append("<li d='ddlDesignationli"+i+"' data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['RoleName'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
                ddlDesignation.append($("<option></option>").val(this['Code']).html(this['RoleName']));
            });

            endPreloader("");
        },
        error: function (r) {
            endPreloader("Error");
        }
    });
}