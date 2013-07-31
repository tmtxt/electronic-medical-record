<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPatientDetails.aspx.cs" Inherits="UserAccess_Patients_ViewPatientDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Patient Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Patient Detail
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:FormView ID="PatientDetailFormView" runat="server" DataSourceID="PatientDetailDataSource">
            <ItemTemplate>
                <%-- patient name as title --%>
                <h3><%# Eval("Name") %></h3>
                <table style="width:100%" class="table table-hover">
                    <tr>
                        <td><strong>Name</strong></td>
                        <td><%# Eval("Name") %></td>
                        <td colspan="2" rowspan="2">
                            <p><strong>Address</strong></p>
                            <p><%# Eval("Address") %></p>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Gender</strong></td>
                        <td><%# Eval("Gender") %></td>
                    </tr>
                    <tr>
                        <td><strong>Birthdate</strong></td>
                        <td><%# DateTime.FromBinary(long.Parse(Eval("DateOfBirth").ToString())).ToLongDateString() %></td>
                        <td><strong>Number of visits</strong></td>
                        <td>number</td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:LinqDataSource ID="PatientDetailDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Patients" Where="ID == @ID">
            <WhereParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
            </WhereParameters>
        </asp:LinqDataSource>
    </form>
</asp:Content>

