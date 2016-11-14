<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="LeadPassword.aspx.cs" Inherits="Admin_LeadPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
    <style>
        /*body{background: #fff url(img/texture.png) repeat;margin: 0;padding: 0;}*/
        .content {
            margin: 0px 20px 0px 2px;
        }

        .flexy-menu {
            margin: 5px 0 0 0 !important;
        }

        .flexy-menu {
            width: 100%;
            margin: 0;
            padding: 0;
            position: relative;
            float: left;
            list-style: none;
            background: #333333;
        }

            .flexy-menu li {
                display: inline-block;
                font-size: 13px;
                margin: 0;
                padding: 0;
                float: left;
                line-height: 20px;
                position: relative;
            }

            .flexy-menu > li > a {
                padding: 20px 22px;
                color: #ccc;
                text-decoration: none;
                display: block;
                text-transform: uppercase;
                -webkit-transition: color 0.2s linear, background 0.2s linear;
                -moz-transition: color 0.2s linear, background 0.2s linear;
                -o-transition: color 0.2s linear, background 0.2s linear;
                transition: color 0.2s linear, background 0.2s linear;
            }

            .flexy-menu li:hover > a, .flexy-menu li.active a {
                background: #555;
                color: #fff;
            }

            .flexy-menu li.right {
                float: right;
            }

            .flexy-menu ul, .flexy-menu ul li ul {
                list-style: none;
                margin: 0;
                padding: 0;
                display: none;
                position: absolute;
                z-index: 99999;
                width: 132px;
                background: #333333;
                box-shadow: 0 1px 1px rgba(0,0,0,0.3);
            }

            .flexy-menu ul {
                top: 60px;
                left: 0;
            }

                .flexy-menu ul li ul {
                    top: 0;
                    left: 100%;
                }

                .flexy-menu ul li {
                    clear: both;
                    width: 100%;
                    border: none;
                    font-size: 12px;
                }

                    .flexy-menu ul li a {
                        padding: 10px 20px;
                        width: 100%;
                        color: #dedede;
                        font-size: 13px;
                        text-decoration: none;
                        display: inline-block;
                        float: left;
                        clear: both;
                        box-sizing: border-box;
                        -moz-box-sizing: border-box;
                        -webkit-box-sizing: border-box;
                        -webkit-transition: color 0.2s linear, background 0.2s linear;
                        -moz-transition: color 0.2s linear, background 0.2s linear;
                        -o-transition: color 0.2s linear, background 0.2s linear;
                        transition: color 0.2s linear, background 0.2s linear;
                    }

            .flexy-menu > li .indicator {
                position: absolute;
                color: #dedede;
                top: 20px;
                right: 8px;
                font-size: 17px;
            }

            .flexy-menu ul > li .indicator {
                top: 10px;
                right: 8px;
            }

        .thin > li > a {
            padding: 10px 22px;
        }

        .thin ul {
            top: 40px;
        }

        .thin > li .indicator {
            top: 10px;
        }

        .thick > li > a {
            padding: 40px 22px;
        }

        .thick ul {
            top: 100px;
        }

        .thick > li .indicator {
            top: 40px;
        }

        .flexy-menu i {
            line-height: 20px !important;
            margin-right: 6px;
            font-size: 18px;
            float: left;
        }

        .flexy-menu > li.showhide {
            display: none;
            width: 100%;
            height: 50px;
            cursor: pointer;
            color: #dedede;
            border-bottom: solid 1px rgba(0, 0, 0, 0.1);
            background: #333333;
        }

            .flexy-menu > li.showhide span.title {
                margin: 16px 0 0 25px;
                float: left;
            }

            .flexy-menu > li.showhide span.icon {
                margin: 17px 20px;
                float: right;
            }

            .flexy-menu > li.showhide .icon em {
                margin-bottom: 3px;
                display: block;
                width: 20px;
                height: 2px;
                background: #ccc;
            }

        .orange li:hover > a, .orange li.active a {
            background: #025db1;
            color: #fff !important;
        }

        .flexy-menu.vertical {
            width: 100%;
        }

            .flexy-menu.vertical li {
                width: 100%;
            }

                .flexy-menu.vertical li a {
                    display: inline-block !important;
                    width: 100%;
                    padding: 10px 20px 8px;
                    box-sizing: border-box;
                    -moz-box-sizing: border-box;
                    -webkit-box-sizing: border-box;
                }

            .flexy-menu.vertical ul li {
                width: 100%;
            }

                .flexy-menu.vertical ul, .flexy-menu.vertical ul li ul {
                    width: auto;
                    white-space: nowrap;
                }

            .flexy-menu.vertical ul {
                top: 0;
                left: 100%;
            }

                .flexy-menu.vertical ul li ul {
                    top: 0px;
                }

            .flexy-menu.vertical.right {
                float: right !important;
            }

                .flexy-menu.vertical.right ul {
                    left: -150px !important;
                }

            .flexy-menu.vertical > li .indicator {
                top: 8px;
                right: 15px;
                font-size: 17px;
            }

            .flexy-menu.vertical ul > li .indicator {
                top: 9px;
                right: 15px;
            }

        @media only screen and (max-width: 768px) {
            .content {
                margin: 0px 0px 0px 2px;
            }

            .flexy-menu.vertical {
                width: 100%;
            }

            .flexy-menu li {
                display: block;
                width: 100%;
            }

            .flexy-menu > li > a {
                padding-top: 15px;
                padding-bottom: 15px;
                padding-left: 25px;
            }

            .flexy-menu a {
                width: 100%;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
            }

            .flexy-menu ul, .flexy-menu ul li ul, .flexy-menu.vertical ul, .flexy-menu.vertical ul li ul {
                width: 100%;
                left: 0;
                border-left: none;
                position: static;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
            }

                .flexy-menu ul li {
                    border-left: none;
                    border-right: none;
                }

                    .flexy-menu ul li a, .flexy-menu.vertical ul li a {
                        padding-top: 10px;
                        padding-bottom: 10px;
                    }

                .flexy-menu ul > li > a {
                    padding-left: 40px !important;
                }

            .flexy-menu > li .indicator {
                top: 15px;
                right: 25px;
                font-size: 17px;
            }

            .flexy-menu ul > li .indicator {
                right: 24px;
            }

            .flexy-menu.vertical ul > li .indicator {
                top: 10px;
                right: 15px;
            }

            .flexy-menu > li > ul > li > a {
                padding-left: 40px !important;
            }

            .flexy-menu > li > ul > li > ul > li > a {
                padding-left: 60px !important;
            }

            .flexy-menu > li > ul > li > ul > li > ul > li > a {
                padding-left: 80px !important;
            }
        }
    </style>
    <script type="text/javascript" src="js/flexy-menu.js"></script>
    <script type="text/javascript">$(document).ready(function () { $(".flexy-menu").flexymenu({ speed: 400, type: "vertical", indicator: true }); });</script>

    <link rel="stylesheet" type="text/css" href="../modal/css/component.css" />
    <script src="../modal/js/modernizr.custom.js"></script>

    <script type="text/javascript">
        $(function () {
            $('[id*=lstUserids]').multiselect({
                includeSelectAllOption: true,
                enableFiltering: true,
                enableCaseInsensitiveFiltering:true
            });
        });
    </script>


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="searchArea">
        <h4 style="margin-top:1px;">Select Lead IDs to get basic details</h4>
        <div class="searchItem">
            <label>Select ID</label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ListBox ID="lstUserids" runat="server" SelectionMode="Multiple"></asp:ListBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label>Enter Pin</label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtpin" runat="server" CssClass="inputfield" Width="100px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button Text="Search" runat="server" OnClick="Submit" CssClass="btn btn-primary"/>
        </div>
    </div>

    <div class="GV-Area">
        <asp:GridView ID="GridViewLMS" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false" RowStyle-Height="23px"
            AutoGenerateColumns="False" Width="100%" GridLines="None" AllowPaging="true"
            PageSize="10" OnPageIndexChanging="OnPaging">
            <Columns>
                <asp:BoundField DataField="Code" Visible="false" />
                <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Mobile1" HeaderText="Mobile" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Email1" HeaderText="EmailID" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Pwd" HeaderText="Password" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
            <EditRowStyle CssClass="GV-EditRow" />
            <HeaderStyle CssClass="GV-HeaderStyle" />
            <PagerStyle CssClass="GV-PagerStyle" />
            <RowStyle CssClass="GV-RowStyle" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" />
        </asp:GridView>
    </div>
        <br />
    <asp:Label id="lblmsg" runat="server" CssClass="MainButton" Style="padding:5px 20px;background-color:transparent;color:red;" ></asp:Label>

</asp:Content>

