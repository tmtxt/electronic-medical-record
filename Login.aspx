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
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" placeholder="Username" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Password" />
                        </div>
                        <div class="form-inline">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" />
                                    Remember me
                                </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-large">
                            <span class="glyphicon glyphicon-hand-up"></span>
                            Sign in
                        </button>
                    </fieldset>
                </form>
            </div>
            <div class="span3"></div>
        </div>
    </div>
</body>
</html>
