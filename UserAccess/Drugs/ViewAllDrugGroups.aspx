<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllDrugGroups.aspx.cs" Inherits="UserAccess_Drugs_ViewAllDrugGroups" %>

<%@ Register Src="/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Drug Groups
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    All Drug Groups
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="AllDrugGroupsGridView" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ID" DataSourceID="AllDrugGroupsDataSource"
                    CssClass="table table-bordered table-striped table-hover" OnRowDeleted="AllDrugGroupsGridView_RowDeleted" OnRowUpdated="AllDrugGroupsGridView_RowUpdated">
                    <Columns>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name"
                             HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description"
                             HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server" Rows="6"
                                    Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="UpdateButton" runat="server" Text="Update" CommandName="Update"
                                    CssClass="btn btn-primary" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="EditButton" runat="server" Text="Edit" CommandName="Edit"
                                    CssClass="btn btn-primary" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="CancelButton" runat="server" Text="Cancel" CommandName="Cancel"
                                    CssClass="btn btn-primary" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete" CommandName="Delete"
                                    CssClass="btn btn-danger" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <asp:LinqDataSource ID="AllDrugGroupsDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="DrugGroups">
                </asp:LinqDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

