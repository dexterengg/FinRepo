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
                ul.append("<li id='ddlDepartmentli" + i + "' data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['Name'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
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
    if (ddlDepartment.val() === "0") {
        $('#rqddlDepartment').text("Please Select Department");
    }
    else {
        $('#rqddlDepartment').text("");

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
                    ul.append("<li id='ddlDesignationli" + i + "' data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['RoleName'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
                    ddlDesignation.append($("<option></option>").val(this['Code']).html(this['RoleName']));
                });

                endPreloader("");
            },
            error: function (r) {
                endPreloader("Error");
            }
        });
    }
}

function designationChange(ddlDesignation, ddlAssignTo, ddlReportTo) {
    if (ddlDesignation.val() === "0") {
        $('#rqddlDesignation').text("Please Select Designation");
    }
    else {
        $('#rqddlDesignation').text("");

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
}

function assignToChange(ddlDepartment, ddlAssignTo, ddlReportTo) {
    if (ddlAssignTo.val() === "0") {
        $('#rqddlAssignTo').text("Please Select Assign To");
    }
    else {
        $('#rqddlAssignTo').text("");

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
}

function reportToToChange(ddlReportTo) {
    if (ddlReportTo.val() === "0") {

        $('#rqddlReportTo').text("Please Select Report To");
    }
    else {
        $('#rqddlReportTo').text("");

        $('#ddlReportToli' + ddlReportTo.prop('selectedIndex')).addClass('selected');
    }
}

function createticket(txtquery, ddlDepartment, ddlDesignation, ddlAssignTo, ddlReportTo, ddlStatus, ddlPriority, fileattachment, txtsub, txttat) {

    if (!txtquery.val()) {
        $('#rqtxtquery').text("Please Enter Query");
    }
    else {
        $('#rqtxtquery').text("");
    }

    if (!txtsub.val()) {
        $('#rqSubject').text("Please Enter Subject");
    }
    else {
        $('#rqSubject').text("");
    }

    if (!txttat.val()) {
        $('#rqTAT').text("Please Enter Tat");
    }
    else {
        if (isDate(txttat.val())) {
            var mindatetime = 15 * 60 * 1000; /* ms *///15 mins
            var newdatetime = new Date(txttat.val())
            var currdatetime = new Date();

            if ((newdatetime.getTime() - currdatetime.getTime()) < mindatetime) {
                $('#rqTAT').text("Tat Must Be greater than 15 mins");
            }
            else {
                $('#rqTAT').text("");
            }
        }
        else {
            $('#rqTAT').text("Invalid Date");
        }
    }

    if (ddlDepartment.val() === "0") {
        $('#rqddlDepartment').text("Please Select Department");
    }
    else {
        $('#rqddlDepartment').text("");
    }

    if (ddlDesignation.val() === "0") {
        $('#rqddlDesignation').text("Please Select Designation");
    }
    else {
        $('#rqddlDesignation').text("");
    }

    if (ddlAssignTo.val() === "0") {
        $('#rqddlAssignTo').text("Please Select Assign To");
    }
    else {
        $('#rqddlAssignTo').text("");
    }

    if (ddlReportTo.val() === "0") {

        $('#rqddlReportTo').text("Please Select Report To");
    }
    else {
        $('#rqddlReportTo').text("");
    }

    if (txtquery.val() && ddlDepartment.val() != "0" && ddlDesignation.val() != "0" && ddlAssignTo.val() != "0" && ddlReportTo.val() != "0" && $('#rqTAT').text()==="") {

        var fileUpload = fileattachment.get(0);
        var files = fileUpload.files;

        if (files.length > 0) {
            var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
            if ($.inArray(fileattachment.val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                $('#rqfileattachment').html("Only .jpeg, .jpg, .png, .gif, .bmp formats are allowed." + " " + "<a href='javascript:void(0)' class='btn bg-green waves-effect' onclick='removeimagefile()'>Remove File</a>");
            }
            else {
                startPreloader("Submitting Ticket...");
                $('#rqfileattachment').html("");
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
                        if (result) {
                            $.ajax({
                                type: "POST",
                                url: "AddTicket.aspx/addticket",
                                data: '{sub:"' + txtsub.val() + '",tat:"' + txttat.val() + '",qry:"' + txtquery.val() + '",depid:"' + ddlDepartment.val() + '",roleid:"' + ddlDesignation.val() + '",assigntoemail:"' + ddlAssignTo.val() + '",reporttoemail:"' + ddlReportTo.val() + '",status:"' + ddlStatus.val() + '",priority:"' + ddlPriority.val() + '",attachfile:"' + result + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (r) {
                                    if (r.d === 'y') {
                                        $('#preloaderoverlaymsg').text("Ticket Submmitted. Please Wait Redirecting...");
                                        setTimeout(function () { window.location = "AllTickets"; }, 1000);
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
        }
        else {
            startPreloader("Submitting Ticket...");
            $.ajax({
                type: "POST",
                url: "AddTicket.aspx/addticket",
                data: '{sub:"' + txtsub.val() + '",tat:"' + txttat.val() + '",qry:"' + txtquery.val() + '",depid:"' + ddlDepartment.val() + '",roleid:"' + ddlDesignation.val() + '",assigntoemail:"' + ddlAssignTo.val() + '",reporttoemail:"' + ddlReportTo.val() + '",status:"' + ddlStatus.val() + '",priority:"' + ddlPriority.val() + '",attachfile:""}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    if (r.d === 'y') {
                        $('#preloaderoverlaymsg').text("Ticket Submmitted. Please Wait Redirecting...");
                        setTimeout(function () { window.location = "AllTickets"; }, 1000);
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
}

$(function () {
    $('.aniimated-thumbnials').lightGallery({
        thumbnail: true,
        selector: 'a'
    });
});

function delcofirm() {
    return confirm('Are you sure?');
}

function querychange(txtquery) {
    if (!txtquery.val()) {
        $('#rqtxtquery').text("Please Enter Query");
    }
    else {
        $('#rqtxtquery').text("");
    }
}

function subchange(txtsub) {
    if (!txtsub.val()) {
        $('#rqSubject').text("Please Enter Subject");
    }
    else {
        $('#rqSubject').text("");
    }
}

function tatchange(txttat) {
    if (!txttat.val()) {
        $('#rqTAT').text("Please Enter Tat");
    }
    else {
        if (isDate(txttat.val())) {
            var mindatetime = 15 * 60 * 1000; /* ms *///15 mins
            var newdatetime = new Date(txttat.val())
            var currdatetime = new Date();

            if ((newdatetime.getTime() - currdatetime.getTime()) < mindatetime) {
                $('#rqTAT').text("Tat Must Be greater than 15 mins");
            }
            else {
                $('#rqTAT').text("");
            }
        }
        else {
            $('#rqTAT').text("Invalid Date");
        }
    }
}

function imageuploadchange(fileattachment) {
    var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
    if ($.inArray(fileattachment.val().split('.').pop().toLowerCase(), fileExtension) == -1) {
        $('#rqfileattachment').html("Only .jpeg, .jpg, .png, .gif, .bmp formats are allowed." + " " + "<a href='javascript:void(0)' class='btn bg-green waves-effect' onclick='removeimagefile()'>Remove File</a>");
    }
    else {
        $('#rqfileattachment').html("");
    }
}

function removefile(fileattachment) {
    $('#rqfileattachment').html("");
    //Reference the FileUpload and get its Id and Name.
    var fileUpload = fileattachment;
    var id = fileUpload.attr("id");
    var name = fileUpload.attr("name");

    //Create a new FileUpload element.
    var newFileUpload = $('<input type = "file" class="form-control" onchange="fileattachmentchange()"/>');

    //Append it next to the original FileUpload.
    fileUpload.after(newFileUpload);

    //Remove the original FileUpload.
    fileUpload.remove();

    //Set the Id and Name to the new FileUpload.
    newFileUpload.attr("id", id);
    newFileUpload.attr("name", name);
    return false;
}

function viewTicket(ticketid,createdbymail) {
    var $loading = $('#cardLoader').waitMe({
        effect: "timer",
        text: 'Loading...',
        bg: 'rgba(255,255,255,0.90)',
        color: "lightBlue"
    });

    $('#viewTicketPanel').modal('show');

    $.ajax({
        type: "POST",
        url: "AllTickets.aspx/GetTicketDetails",
        data: '{tid:"' + ticketid + '",creatoremail:"'+createdbymail+'"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            tdetails = result.d;
            if (tdetails) {

                //if (tdetails.Status === "0") {
                //    $('#statusopen').css("display", "block");
                //    $('#statusclose').css("display", "none");
                //}
                //else {
                //    $('#statusopen').css("display", "none");
                //    $('#statusclose').css("display", "block");
                //}

                //if (tdetails.Priority === "0") {
                //    $('#phigh').css("display", "block");
                //    $('#pmoderate').css("display", "none");
                //    $('#plow').css("display", "none");
                //}
                //else if (tdetails.Priority === "1") {
                //    $('#phigh').css("display", "none");
                //    $('#pmoderate').css("display", "block");
                //    $('#plow').css("display", "none");
                //}
                //else {
                //    $('#phigh').css("display", "none");
                //    $('#pmoderate').css("display", "none");
                //    $('#plow').css("display", "block");
                //}

                $('#lbltickedid').text(tdetails.TicketId);
                $('#lbllastupdated').text(tdetails.UpdateDate);
                $('#lblDepartment').text(tdetails.DepName);
                $('#lblCreatedby').text(tdetails.CreatorName);
                $('#lblAssignTo').text(tdetails.AssignToName);
                $('#lblquery').text(tdetails.Query);
                $('#imgattachment').attr("src", tdetails.Attachment);

            }
            $loading.waitMe('hide');
        },
        error: function (err) {
            $loading.waitMe('hide');
        }
    });    
}

function closeTicketPanel() {
    $('#viewTicketPanel').modal('hide');
}

function isDate(val) {
    var d = new Date(val);
    return !isNaN(d.valueOf());
}