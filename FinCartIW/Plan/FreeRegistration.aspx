<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FreeRegistration.aspx.cs" Inherits="Plan_FreeRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style type="text/css">   
    .ErrorControl
    {
        background-color: #ffffff !important;
        border: solid 1px #f00 !important;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">            
            <p>And get comprehensive financial planning.</p>
            <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="emailValidate" runat="server" Text="" CssClass="validateEmail"></asp:Label>
                </div>
            </div>
            <div role="form">
                <div class="form-group">                    
                    <asp:TextBox type="text" name="name" runat="server" placeholder="Enter Name" TabIndex="1" id="name" class="form-control" ValidationGroup="RegisterInfo"  />                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="" ControlToValidate="name" CssClass="mandatory"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">                    
                    <div class="input-group">
                        <span class="input-group-addon">+91</span>
                        <asp:TextBox type="text" name="countrycode" id="txtCountryCode" MaxLength="3" runat="server" value=" +91" Visible="false" ValidationGroup="RegisterInfo" />
                        <asp:TextBox type="text" name="mobile" id="mobile" Placeholder="Enter Mobile No." runat="server" class="form-control" MaxLength="10" ValidationGroup="RegisterInfo" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="" ControlToValidate="mobile" CssClass="mandatory"></asp:RequiredFieldValidator>
                    </div>                    
                </div>
                <div class="form-group">                    
                    <asp:TextBox type="text" name="email" id="email" runat="server" placeholder="Enter Email" class="form-control" ValidationGroup="RegisterInfo"  />                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="" ControlToValidate="email" CssClass="mandatory"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">                    
                    <asp:TextBox type="password" name="password" id="txtPassword" runat="server" placeholder="password" class="form-control" ValidationGroup="RegisterInfo"  />                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="" ControlToValidate="txtPassword" CssClass="mandatory"></asp:RequiredFieldValidator>
                </div>                
                <div class="form-group">
                    <asp:Button type="submit" name="RegisterButton" id="RegisterButton" runat="server" ValidationGroup="RegisterInfo" Text="Proceed to Invest" class="btn btn-info btn-block btn-md" OnClick="RegisterButton_Click" />                    
                </div>
            </div>            
    </div>
    </form>

    <script type="text/javascript">
        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
                for (var i in Page_Validators) {
                    try {
                        var control = document.getElementById(Page_Validators[i].controltovalidate);
                        if (!Page_Validators[i].isvalid) {
                            control.className = "form-control ErrorControl";
                        } else {
                            control.className = "form-control";
                        }
                    } catch (e) { }
                }
                return false;
            }
            return true;
        }
</script>
</body>
</html>
