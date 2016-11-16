function validateuser() {
    var username = $('#txtAdminUserName').val();
    var password = $('#txtAdminPassword').val();
  
        $.ajax({
            type: "POST",
            url: "index.aspx/Authenticate",
            data: '{username:"' + username + '",password:"' + password + '"}',
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                var resp = response.d;
                if (resp.error) {
                    $("#usermsg").text(resp.error);
                }
                else {
                    $("#usermsg").text("Welcome " + resp.name);
                    $("#redirect-button").attr("href", '/admin/' + resp.page);
                    $("#redirect-button").text("Go To Dashboard");
                    $("#redirect-button").show();
                    $('.form').fadeOut(500);
                    $('.wrapper').addClass('form-success');
                }

            },
            failure: function (response) {
                var resp = response.d;
                if (resp.error) {
                    $("#usermsg").text(resp.error);
                }
            },
            error: function (response) {
                var resp = response.d;
                if (resp.error) {
                    $("#usermsg").text(resp.error);
                }
            }
        });
    }
 