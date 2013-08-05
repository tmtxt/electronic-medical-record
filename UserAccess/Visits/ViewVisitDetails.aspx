<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewVisitDetails.aspx.cs" Inherits="UserAccess_Visits_ViewVisitDetails" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Visit Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Visit Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView Width="100%" ID="VisitDetailsFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="VisitDetailsDataSource">
                    <ItemTemplate>
                        <table class="table table-hover">
                            <tr>
                                <td>
                                    <strong>Date</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server"
                                        Text='<%# DateTime.FromBinary(long.Parse(Eval("Date").ToString())).ToLongDateString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <strong>Patient</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server"
                                        Text='<%# ((Patient)Eval("Patient")).Name %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Hospotal</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server"
                                        Text='<%# ((Hospital)Eval("Hospital")).Name %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <strong>Doctor</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server"
                                        Text='<%# ((Doctor)Eval("Doctor")).Name %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Diagnosis</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server"
                                        Text='<%# ((ICD)Eval("ICD")).Name %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <strong>Outcome</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server"
                                        Text='<%# Eval("Outcome") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete"
                                        CssClass="btn btn-danger" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this Visit?\n\nAll Prescriptions, Prescription Details as well as Lab Orders, Lab Order Details belong to this visit will be deleted, too!')" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="VisitDetailsDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Visits" Where="ID == @ID">
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

