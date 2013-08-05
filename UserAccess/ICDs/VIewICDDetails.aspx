<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VIewICDDetails.aspx.cs" Inherits="UserAccess_ICDs_VIewICDDetails" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



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
                <asp:FormView ID="ICDDetailsFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="ICDDetailsDataSource" OnItemDeleted="ICDDetailsFormView_ItemDeleted"
                    OnItemDeleting="ICDDetailsFormView_ItemDeleting" Width="100%">

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
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete ICD"
                                        CssClass="btn btn-danger" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure to you want to delete this ICD?\n\nAll Visits associated with this ICD will be deleted, too!')" />
                                    <asp:Button ID="EditButton" runat="server" Text="Edit ICD"
                                        CssClass="btn btn-primary" CommandName="Edit" />
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
                                        Text='<%# Bind("Code") %>'></asp:TextBox>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    <strong>Name</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="NameTextBox" runat="server"
                                        Text='<%# Bind("Name") %>'></asp:TextBox>
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
                                    <asp:TextBox ID="DescriptionTextBox" runat="server"
                                        Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="100%"
                                        Rows="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete ICD"
                                        CssClass="btn btn-danger" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure to you want to delete this ICD?\n\nAll Visits associated with this ICD will be deleted, too!')" />
                                    <asp:Button ID="EditButton" runat="server" Text="Edit ICD"
                                        CssClass="btn btn-primary" CommandName="Edit" />
                                    <asp:HyperLink ID="ViewAllICDButton" runat="server"
                                        NavigateUrl="/UserAccess/ICDs/ViewAllICD.aspx" CssClass="btn btn-primary">
                                        View All ICD
                                    </asp:HyperLink>
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
    </form>
</asp:Content>

