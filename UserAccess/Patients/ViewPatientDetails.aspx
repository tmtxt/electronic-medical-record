<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPatientDetails.aspx.cs" Inherits="UserAccess_Patients_ViewPatientDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Patient Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Patient Detail
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form id="PatientDetailForm" runat="server">
        <asp:FormView ID="PatientDetailFormView" runat="server" DataSourceID="PatientDetailDataSource">
            <ItemTemplate>
                <%-- patient name as title --%>
                <h2><%# Eval("Name") %></h2>
                <hr />

                Name: <%# Eval("Name") %>
            </ItemTemplate>
        </asp:FormView>
        <asp:LinqDataSource ID="PatientDetailDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Patients" Where="ID == @ID">
            <WhereParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
            </WhereParameters>
        </asp:LinqDataSource>
    </form>
</asp:Content>

