﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewMedicalServiceDetails.aspx.cs" Inherits="UserAccess_MedicalServices_ViewMedicalServiceDetails" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Medical Service Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Medical Service Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView ID="MedicalServiceDetailsFormView" runat="server" DataKeyNames="ID" OnModeChanging="MedicalServiceDetailsFormView_ModeChanging" DataSourceID="MedicalServiceDetailDataSource" OnItemCommand="MedicalServiceDetailsFormView_ItemCommand" OnItemDeleting="MedicalServiceDetailsFormView_ItemDeleting" OnDataBound="MedicalServiceDetailsFormView_DataBound">
                    <ItemTemplate>
                        <h3><%# Eval("Name") %></h3>
                        <table class="table table-hover">
                            <tr>
                                <td>
                                    <strong>ID</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
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
                                    <strong>Price (USD)</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Medical Service Group</strong>
                                </td>
                                <td>
                                    <asp:Label ID="MedicalServiceGroupLabel" Text='<%# ((MedicalService)MedicalServiceDetailsFormView.DataItem).MedicalServiceGroup.Name %>' runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="DeleteButton" CommandName="Delete" runat="server" Text="Delete Medical Service"
                                        CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete this Medical Service?\n\nAll Lab Order Details belong to this Medical Service will be deleted, too!')" />
                                    <asp:LinkButton ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-primary"
                                        CommandName="Edit" />
                                    <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary" runat="server" NavigateUrl="/UserAccess/MedicalServices/ViewAllMedicalServices.aspx">
                                        View All Medical Services
                                    </asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <h3><%# Eval("Name") %></h3>
                        <table class="table table-hover">
                            <tr>
                                <td>
                                    <strong>ID</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Name</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Price (USD)</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Medical Service Group</strong>
                                </td>
                                <td>
                                    <asp:Label ID="MedicalServiceGroupLabel" Text='<%# ((MedicalService)MedicalServiceDetailsFormView.DataItem).MedicalServiceGroup.Name %>' runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="UpdateButton" CommandName="Update" runat="server" Text="Update Medical Service"
                                        CssClass="btn btn-primary"  />
                                    <asp:Button ID="ClearButton" runat="server" Text="Clear Form" CssClass="btn btn-primary"
                                         />
                                    <asp:Button ID="CancelButton" CommandName="Cancel" runat="server" Text="Cancel"
                                        CssClass="btn btn-primary"  />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="MedicalServiceDetailDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="MedicalServices" Where="ID == @ID">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <p></p>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

