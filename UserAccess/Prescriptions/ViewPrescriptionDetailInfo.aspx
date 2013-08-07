<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPrescriptionDetailInfo.aspx.cs" Inherits="UserAccess_Prescriptions_ViewPrescriptionDetailInfo" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Prescription Details Info
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Prescription Details Info
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView ID="PrescriptionDetailInfoFormView" runat="server" DataKeyNames="ID" DataSourceID="PrescriptionDetailInfoDataSource">
                    <EditItemTemplate>
                        <fieldset>
                            <div class="form-group">
                                <strong>Drug</strong>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="form-group">
                                <strong>Drug</strong>
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="form-group">
                                <strong>Drug</strong>
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="form-group">
                                <strong>Drug</strong>
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            </div>
                        </fieldset>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <table class="table">
                            <tr>
                                <td>
                                    <strong>Drug</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server"
                                        Text='<%# ((Drug)Eval("Drug")).Name %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Quantity</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server"
                                        Text='<%# Eval("Quantity") %>'></asp:Label>
                                    <asp:Label ID="Label7" runat="server"
                                        Text='<%# ((Drug)Eval("Drug")).Unit %>'></asp:Label>(s)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Dose</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label8" runat="server"
                                        Text='<%# Eval("Dose") %>'></asp:Label>
                                    <asp:Label ID="Label9" runat="server"
                                        Text='<%# ((Drug)Eval("Drug")).Unit %>'></asp:Label>(s) / day
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Special Instruction</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label10" runat="server"
                                        Text='<%# Eval("SpecialInstruction") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="EditButton" runat="server" Text="Edit"
                                        CssClass="btn btn-primary" CommandName="Edit" />
                                    <asp:Button ID="ViewVisitButton" runat="server" Text="View Visit Details"
                                        CssClass="btn btn-primary" />
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete"
                                        CssClass="btn btn-danger" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this Prescription Details?')" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="PrescriptionDetailInfoDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="PrescriptionDetails" Where="ID == @ID">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <p></p>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

