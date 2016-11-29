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
            $.each(r.d, function (index) {
                var i = index + 1;
                ul.append("<li data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['Name'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
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

function departmentChange(ddlDepartment, ddlDesignation, ddlAssignTo, ddlReportTo) {
    startPreloader("Loading Designations...");

    ddlDesignation.empty().append('<option selected="selected" value="0">Select Designation</option>');
    var ul = ddlDesignation.prev().children();
    ul.empty().append("<li data-original-index='" + 0 + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>Select Designation</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");


    $.ajax({
        type: "POST",
        url: "Tickets.aspx/GetDepartments",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            ddlDepartment.empty().append('<option selected="selected" value="0">Select Department</option>');
            var ul = ddlDepartment.prev().children();
            $.each(r.d, function (index) {
                var i = index + 1;
                ul.append("<li data-original-index='" + i + "'><a tabindex='0' class='' style='' data-tokens='null'><span class='text'>" + this['Name'] + "</span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>");
                ddlDepartment.append($("<option></option>").val(this['Code']).html(this['Name']));
            });

            endPreloader("");
        },
        error: function (r) {
            endPreloader("Error");
        }
    });
}