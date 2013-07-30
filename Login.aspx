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
    <form id="login_form" runat="server">
    <div>
        <asp:Login ID="Login1" runat="server"></asp:Login>
    </div>
    </form>
</body>
</html>
