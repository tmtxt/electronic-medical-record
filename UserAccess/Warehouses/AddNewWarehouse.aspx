<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewWarehouse.aspx.cs" Inherits="UserAccess_Warehouses_AddNewWarehouse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Warehouse
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Warehouse
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form id="form1" runat="server">
    <asp:DetailsView ID="AddNewWarehouseDetailView" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="WarehousesDataSource" AutoGenerateInsertButton="True">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
        </Fields>
        </asp:DetailsView>
        <asp:LinqDataSource ID="WarehousesDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="Warehouses">
        </asp:LinqDataSource>
    </form>
</asp:Content>

