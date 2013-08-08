<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewLabOrderDetailInfo.aspx.cs" Inherits="UserAccess_LabOrders_ViewLabOrderDetailInfo" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Lab Order Detail Info
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Lab Order Detail Info
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView Width="100%" ID="LabOrderDetailInfoFormView" runat="server" DataSourceID="LabOrderDetailInfoDataSource">
                    <ItemTemplate>
                        <table style="width: 80%" class="table">
                            <tr>
                                <td style="width: 40%">
                                    <strong>Medical Service</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server"
                                        Text='<%# ((MedicalService)Eval("MedicalService")).Name %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Result</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server"
                                        Text='<%# Eval("Result") %>'></asp:Label>
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="EditButton" runat="server" Text="Edit Prescription Detail"
                                        CssClass="btn btn-primary" CommandName="Edit" />
                                    <asp:Button ID="ViewVisitButton" runat="server" Text="View Visit Details"
                                        CssClass="btn btn-primary" OnClick="ViewVisitButton_Click" />
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete Prescription Detail"
                                        CssClass="btn btn-danger" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this Prescription Details?')" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="LabOrderDetailInfoDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="LabOrderDetails" Where="ID == @ID">
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

