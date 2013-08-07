<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewPrescriptionDetail.aspx.cs" Inherits="UserAccess_Prescriptions_AddNewPrescriptionDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Prescription Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Prescription Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:FormView ID="AddPrescriptionDetailFormView" runat="server" DataKeyNames="ID" DataSourceID="AddPrescriptionDetailDataSource" DefaultMode="Insert">
            
            <InsertItemTemplate>
                
            </InsertItemTemplate>
            

        </asp:FormView>
        <asp:LinqDataSource ID="AddPrescriptionDetailDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="PrescriptionDetails">
        </asp:LinqDataSource>
    </form>
</asp:Content>

