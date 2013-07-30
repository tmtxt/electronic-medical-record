<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewUser.aspx.cs" Inherits="AdminAccess_AddNewUser" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add User
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Add New User
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="AddUserScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="AddUserPanel" runat="server">
            <ContentTemplate>
                <fieldset>
                    <legend>Enter user information</legend>
                    <div class="form-group">
                        <label for="UsernameTextbox">Username*</label>
                        <asp:TextBox ID="UsernameTextbox" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ErrorMessage="Username is required" ControlToValidate="UsernameTextbox" CssClass="label label-important"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="PasswordTextbox">Password*</label>
                        <asp:TextBox ID="PasswordTexbox" CssClass="form-control" placeholder="Enter password" runat="server" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ErrorMessage="Password is required" CssClass="label label-important" ControlToValidate="PasswordTexbox"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="RetypePasswordTextbox">Retype Password*</label>
                        <asp:TextBox ID="RetypePasswordTextbox" CssClass="form-control" placeholder="Retype password" runat="server" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;
                <asp:RequiredFieldValidator CssClass="label label-important" ID="RetypePasswordRequiredValidator" runat="server" ErrorMessage="Retyped password is required" ControlToValidate="RetypePasswordTextbox" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator CssClass="label label-important" ID="RetypePasswordCompareValidator" runat="server" ErrorMessage="Password must be the same" ControlToCompare="PasswordTexbox" ControlToValidate="RetypePasswordTextbox"></asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <label for="EmailTextbox">Email*</label>
                        <asp:TextBox ID="EmailTextbox" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>&nbsp;&nbsp;
                <asp:RequiredFieldValidator CssClass="label label-important" ID="EmailRequiredValidator" runat="server" ErrorMessage="Email is required" ControlToValidate="EmailTextbox" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator CssClass="label label-important" ID="EmailExpressionValidator" runat="server" ErrorMessage="Not an email" ControlToValidate="EmailTextbox" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <asp:Button ID="AddUserButton" CssClass="btn btn-primary" runat="server" Text="Add User" OnClick="AddUserButton_Click" />
                </fieldset>
                <p>&nbsp;</p>
                <div runat="server" id="ResultDiv">
                    <asp:Label ID="ResultLabel" runat="server" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>

</asp:Content>
