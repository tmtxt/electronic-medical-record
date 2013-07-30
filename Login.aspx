<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Src="/TemplateControls/Style.ascx" TagPrefix="utmpl" TagName="Style" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%-- include css and js file --%>
    <utmpl:Style runat="server" ID="Style" />

    <title>Please login to continue</title>
</head>
<body>

    <div class="container">
        <div class="content">
            <div class="span3"></div>
            <div class="span6">
                <div class="hidden-phone">
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                </div>
                <form class="well text-center" id="LoginForm" action="/Login.aspx" runat="server">
                    <fieldset>
                        <legend><h3>Login</h3></legend>
                        <div class="form-group">
                            <label for="useUsernameTextboxrname">Username</label>
                            <asp:TextBox ID="UsernameTextbox" runat="server" CssClass="form-control"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ErrorMessage="Username is required" ControlToValidate="UsernameTextbox" CssClass="label label-important"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group">
                            <label for="PasswordTextbox">Password</label>
                            <asp:TextBox ID="PasswordTextbox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is required" ControlToValidate="PasswordTextbox" CssClass="label label-important"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-inline">
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="RememberPasswordCheckbox" runat="server" />
                                    Remember me
                                </label>
                            </div>
                        </div>
                        <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn btn-primary btn-large" OnClick="LoginButton_Click" />
                    </fieldset>
                </form>
            </div>
            <div class="span3"></div>
        </div>
    </div>
</body>
</html>
