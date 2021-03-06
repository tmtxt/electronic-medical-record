﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VIewICDDetails.aspx.cs" Inherits="UserAccess_ICDs_VIewICDDetails" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/RedirectSuccessAlert.ascx" TagPrefix="utmpl" TagName="RedirectSuccessAlert" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    ICD Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    ICD Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <utmpl:RedirectSuccessAlert runat="server" ID="RedirectSuccessAlert" />

                <asp:FormView ID="ICDDetailsFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="ICDDetailsDataSource" OnItemDeleted="ICDDetailsFormView_ItemDeleted"
                    OnItemDeleting="ICDDetailsFormView_ItemDeleting" Width="100%" OnItemUpdated="ICDDetailsFormView_ItemUpdated" OnItemUpdating="ICDDetailsFormView_ItemUpdating">

                    <ItemTemplate>
                        <h3><%# Eval("Name") %></h3>
                        <table class="table table-hover">
                            <tr>
                                <td style="width:25%">
                                    <strong>Code</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Code") %>'></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    <strong>Name</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>ICD Chapter</strong>
                                </td>
                                <td>
                                    <asp:Label ID="ICDChapterLabel" Text='<%# ((ICD)ICDDetailsFormView.DataItem).ICDChapter.Name %>' runat="server"></asp:Label>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <strong>Description</strong>
                                    
                                </td>
                                <td>
                                    <asp:Label ID="DescriptionTextBox" runat="server"
                                        Text='<%# Eval("Description") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <% if(System.Threading.Thread.CurrentPrincipal.IsInRole("admin")){%>
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete ICD"
                                        CssClass="btn btn-danger" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure to you want to delete this ICD?\n\nAll Visits associated with this ICD will be deleted, too!')" />
                                    <asp:Button ID="EditButton" runat="server" Text="Edit ICD"
                                        CssClass="btn btn-primary" CommandName="Edit" />
                                    <%} %>
                                    <asp:HyperLink ID="ViewAllICDButton" runat="server"
                                        NavigateUrl="/UserAccess/ICDs/ViewAllICD.aspx" CssClass="btn btn-primary">
                                        View All ICD
                                    </asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <h3><%# Eval("Name") %></h3>
                        <table class="table table-hover">
                            <tr>
                                <td style="width:25%">
                                    <strong>Code</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="CodeTextBox" runat="server"
                                        Text='<%# Bind("Code") %>'></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ErrorMessage="ICD Code is required" ControlToValidate="CodeTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    <strong>Name</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="NameTextBox" runat="server"
                                        Text='<%# Bind("Name") %>'></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ErrorMessage="ICD Name is required" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>ICD Chapter</strong>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ICDChapterDropdownList" runat="server"
                                        DataSourceID="ICDChaptersDataSource" DataTextField="Name"
                                        DataValueField="ID" SelectedValue='<%# Bind("ICDChapterID") %>'></asp:DropDownList>
                                    <asp:LinqDataSource ID="ICDChaptersDataSource" runat="server"
                                        ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                        Select="new (ID, Name)" TableName="ICDChapters">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <strong>Description</strong>
                                    
                                </td>
                                <td>
                                    <asp:TextBox ID="DescriptionTextBox" runat="server"
                                        Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="100%"
                                        Rows="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="UpdateButton" runat="server" Text="Update"
                                        CssClass="btn btn-primary" CommandName="Update" CausesValidation="true" />
                                    <asp:Button ID="ClearButton" runat="server" Text="Clear Form"
                                        CssClass="btn btn-primary" CausesValidation="false" OnClick="ClearButton_Click" />
                                    <asp:Button ID="CancelButton" runat="server" Text="Cancel"
                                        CssClass="btn btn-primary" CommandName="Cancel" CausesValidation="false" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </asp:FormView>
                <asp:LinqDataSource ID="ICDDetailsDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="ICDs" Where="ID == @ID">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <p></p>
        <% if(System.Threading.Thread.CurrentPrincipal.IsInRole("admin")){%>
        <asp:HyperLink ID="HyperLink1" runat="server"
            CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            NavigateUrl="/AdminAccess/ICDs/AddNewICD.aspx">Add New ICD</asp:HyperLink>
        <%} %>
    </form>
</asp:Content>

