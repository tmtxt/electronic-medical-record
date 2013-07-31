<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllWarehouses.aspx.cs" Inherits="UserAccess_Warehouses_ViewAllWarehouses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Warehouses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Warehouses List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="AllWarehousesGridView" runat="server" AutoGenerateColumns="False" DataSourceID="AllWarehousesDataSource">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" />
            </Columns>
        </asp:GridView>
        <asp:LinqDataSource ID="AllWarehousesDataSource" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="ID" Select="new (ID, Name, Address)" TableName="Warehouses">
        </asp:LinqDataSource>
    </form>
</asp:Content>

