<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllWarehouses.aspx.cs" Inherits="UserAccess_Warehouses_ViewAllWarehouses" %>

<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Warehouses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Warehouses List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView DataKeyNames="ID" CssClass="gridview table table-bordered table-striped table-hover" ID="AllWarehousesGridView" runat="server" AutoGenerateColumns="False" DataSourceID="AllWarehousesDataSource" OnRowCancelingEdit="AllWarehousesGridView_RowCancelingEdit" OnRowDeleted="AllWarehousesGridView_RowDeleted" OnRowEditing="AllWarehousesGridView_RowEditing" OnRowUpdated="AllWarehousesGridView_RowUpdated">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID"
                    ItemStyle-Width="5%" HeaderStyle-Width="5%" FooterStyle-Width="5%" HeaderStyle-HorizontalAlign="Center">
                    <FooterStyle Width="5%"></FooterStyle>
                    <HeaderStyle HorizontalAlign="Center" Width="5%"></HeaderStyle>
                    <ItemStyle Width="5%"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="WarehouseNameTextbox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="WarehouseNameValidator" runat="server" ControlToValidate="WarehouseNameTextbox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Warehouse name is required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle Width="30%" />
                    <HeaderStyle HorizontalAlign="Center" Width="30%" />
                    <ItemStyle Width="30%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="AddressTextbox" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ControlToValidate="AddressTextbox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Warehouse address is required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle Width="40%" />
                    <HeaderStyle HorizontalAlign="Center" Width="40%" />
                    <ItemStyle Width="40%" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Edit" CssClass="btn btn-primary" CommandName="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="Button3" runat="server" Text="Update" CssClass="btn btn-primary" CommandName="Update" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="btn btn-primary" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this warehouse?')" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="Button4" runat="server" Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel" CausesValidation="False" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <utmpl:ResultAlert runat="server" ID="ResultAlert" />
        <asp:LinqDataSource ID="AllWarehousesDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="ID" TableName="Warehouses">
        </asp:LinqDataSource>

    </form>
</asp:Content>

