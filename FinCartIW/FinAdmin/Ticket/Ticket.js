function bindDepartment(ddlDepartment) {

    $("<div class='preloaderoverlay'><div class='md-preloader pl-size-md' style='top:40%;left:40%;position:relative; z-index: 2'><svg viewbox='0 0 75 75'><circle cx='37.5' cy='37.5' r='33.5' class='pl-red' stroke-width='4' /></svg></div><p id='preloaderoverlaymsg' style='top:40%;left:36%;position:relative; z-index: 2'></p></div>")
    .appendTo($("#preloaderoverlay").css("position", "relative"));

    startPreloader("Loading Departments...");

    $.ajax({
        type: "POST",
        url: "AddTicket.aspx/GetDepartments",
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

            $('#ddlDepartmentli0').addClass('selected');

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

function departmentChange(ddlDepartment, ddlDesignation, ddlAssignTo, ddlReportTo) {
    startPreloader("Loading Designations...");

    $('#ddlDepartmentli' + ddlDepartment.prop('selectedIndex')).addClass('selected');

    ddlDesignation.empty().append('<option selected="selected" value="0">Select Designation</option>');
    ddlDesignation.prev().prev().children(":first").text("Select Designation");
    var ul = ddlDesignation.prev().children();
    ul.empty().append("<li id='ddlDesignationli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Designation</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
    $('#ddlDesignationli0').addClass('selected');

    ddlAssignTo.empty().append('<option selected="selected" value="0">Select Assign To</option>');
    ddlAssignTo.prev().prev().children(":first").text("Select Assign To");
    var ul1 = ddlAssignTo.prev().children();
    ul1.empty().append("<li id='ddlAssignToli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Assign To</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
    $('#ddlAssignToli0').addClass('selected');

    ddlReportTo.empty().append('<option selected="selected" value="0">Select Report To</option>');
    ddlReportTo.prev().prev().children(":first").text("Select Report To");
    var ul2 = ddlReportTo.prev().children();
    ul2.empty().append("<li id='ddlReportToli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Report To</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
    $('#ddlReportToli0').addClass('selected');

    $.ajax({
        type: "POST",
        url: "AddTicket.aspx/GetRoles",
        data: '{depid:"' + ddlDepartment.val() + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            $.each(r.d, function (index) {
                var i = index + 1;
                ul.append("<li id='ddlDesignationli"+i+"' data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['RoleName'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
                ddlDesignation.append($("<option></option>").val(this['Code']).html(this['RoleName']));
            });

            endPreloader("");
        },
        error: function (r) {
            endPreloader("Error");
        }
    });
}

function designationChange(ddlDesignation, ddlAssignTo, ddlReportTo) {
    startPreloader("Loading Assign To...");
   
    $('#ddlDesignationli' + ddlDesignation.prop('selectedIndex')).addClass('selected');

    ddlAssignTo.empty().append('<option selected="selected" value="0">Select Assign To</option>');
    ddlAssignTo.prev().prev().children(":first").text("Select Assign To");
    var ul = ddlAssignTo.prev().children();
    ul.empty().append("<li id='ddlAssignToli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Assign To</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
    $('#ddlAssignToli0').addClass('selected');

    ddlReportTo.empty().append('<option selected="selected" value="0">Select Report To</option>');
    ddlReportTo.prev().prev().children(":first").text("Select Report To");
    var ul1 = ddlReportTo.prev().children();
    ul1.empty().append("<li id='ddlReportToli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Report To</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
    $('#ddlReportToli0').addClass('selected');

    $.ajax({
        type: "POST",
        url: "AddTicket.aspx/GetAssignTo",
        data: '{roleid:"' + ddlDesignation.val() + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            $.each(r.d, function (index) {
                var i = index + 1;
                ul.append("<li id='ddlAssignToli" + i + "' data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['Name'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
                ddlAssignTo.append($("<option></option>").val(this['UserID']).html(this['Name']));
            });

            endPreloader("");
        },
        error: function (r) {
            endPreloader("Error");
        }
    });
}

function assignToChange(ddlDepartment, ddlAssignTo, ddlReportTo) {
    startPreloader("Loading Report To...");

    $('#ddlAssignToli' + ddlAssignTo.prop('selectedIndex')).addClass('selected');

    ddlReportTo.empty().append('<option selected="selected" value="0">Select Report To</option>');
    ddlReportTo.prev().prev().children(":first").text("Select Report To");
    var ul = ddlReportTo.prev().children();
    ul.empty().append("<li id='ddlReportToli0' data-original-index='0'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Report To</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
    $('#ddlReportToli0').addClass('selected');

    $.ajax({
        type: "POST",
        url: "AddTicket.aspx/GetReportTo",
        data: '{depid:"' + ddlDepartment.val() + '",assignuserid:"' + ddlAssignTo.val() + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            $.each(r.d, function (index) {
                var i = index + 1;
                ul.append("<li id='ddlReportToli" + i + "' data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['Name'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
                ddlReportTo.append($("<option></option>").val(this['UserID']).html(this['Name']));
            });

            endPreloader("");
        },
        error: function (r) {
            endPreloader("Error");
        }
    });
}

function reportToToChange(ddlReportTo) {
    $('#ddlReportToli' + ddlReportTo.prop('selectedIndex')).addClass('selected');
}

function createticket(txtquery,ddlDepartment, ddlDesignation, ddlAssignTo, ddlReportTo, ddlStatus, ddlPriority, fileattachment) {
    startPreloader("Submitting Ticket...");

    var fileUpload = fileattachment.get(0);
    var files = fileUpload.files;

    if (files) {
        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        $.ajax({
            url: "AttachmentHandler.ashx",
            type: "POST",
            data: data,
            contentType: false,
            processData: false,
            success: function (result) {
                debugger;
                if (result) {
                    $.ajax({
                        type: "POST",
                        url: "AddTicket.aspx/addticket",
                        data: '{qry:"' + txtquery.val() + '",depid:"' + ddlDepartment.val() + '",roleid:"' + ddlDesignation.val() + '",assigntoemail:"' + ddlAssignTo.val() + '",reporttoemail:"' + ddlReportTo.val() + '",status:"' + ddlStatus.val() + '",priority:"' + ddlPriority.val() + '",attachfile:"' + result + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            if (r.d === 'y') {
                                $('#preloaderoverlaymsg').text("Ticket Submmitted. Please Wait...");
                            }
                            else {
                                endPreloader("Error");
                            }
                        },
                        error: function (r) {
                            endPreloader("Error");
                        }
                    });
                }
                else {
                    endPreloader("Error");
                }
            },
            error: function (err) {
                endPreloader("Error");
            }
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: "AddTicket.aspx/addticket",
            data: '{qry:"' + txtquery.val() + '",depid:"' + ddlDepartment.val() + '",roleid:"' + ddlDesignation.val() + '",assigntoemail:"' + ddlAssignTo.val() + '",reporttoemail:"' + ddlReportTo.val() + '",status:"' + ddlStatus.val() + '",priority:"' + ddlPriority.val() + '",attachfile:""}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                if (r.d === 'y') {
                    $('#preloaderoverlaymsg').text("Ticket Submmitted. Please Wait...");
                }
                else {
                    endPreloader("Error");
                }
            },
            error: function (r) {
                endPreloader("Error");
            }
        });
    }
}

$(function () {
    $('.aniimated-thumbnials').lightGallery({
        thumbnail: true,
        selector: 'a'
    });
});

function delcofirm() {
     return false;
}