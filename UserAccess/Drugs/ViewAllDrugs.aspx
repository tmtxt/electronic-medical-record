<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllDrugs.aspx.cs" Inherits="UserAccess_Drugs_ViewAllDrugs" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Drugs List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Drugs List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:GridView ID="AllDrugGridView" runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="ID" DataSourceID="AllDrugsDataSource"
                    CssClass="gridview table table-bordered table-striped table-hover">

                    <Columns>
                        <asp:TemplateField HeaderText="Drug Name" SortExpression="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Generic Name" SortExpression="GenericName">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("GenericName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Drug Group" SortExpression="DrugGroupID">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"
                                    Text='<%# (new DataClassesDataContext()).DrugGroups
                                .Where(g => g.ID == long.Parse(Eval("DrugGroupID").ToString()))
                                .Select(g => g.Name).First().ToString() %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="ID" Text="Details"
                            DataNavigateUrlFormatString="ViewDrugDetails.aspx?ID={0}">
                            <ControlStyle CssClass="btn btn-small btn-primary" />
                        </asp:HyperLinkField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete"
                                    CommandName="Delete" CssClass="btn btn-danger btn-small"
                                    OnClientClick="return confirm('Are you sure you want to delete this Drug?\n\nAll Prescription Details associated with this Drug will be deleted, too!')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>

                <asp:LinqDataSource ID="AllDrugsDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EntityTypeName="" TableName="Drugs">
                </asp:LinqDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

