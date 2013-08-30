<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="UserAccess_Users_EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Edit Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Edit Profile
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server" class="form-horizontal">

        <div class="control-group">
            <asp:Label CssClass="label_filter" ID="Label3" runat="server"
                Text="Theme"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ThemeDropDownList" runat="server">
                <asp:ListItem Value="Default">Cerulean</asp:ListItem>
                <asp:ListItem>United</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="control-group">
            <asp:Button ID="SaveButton" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="SaveButton_Click" />
        </div>

    </form>
</asp:Content>

