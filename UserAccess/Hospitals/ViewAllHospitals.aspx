<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllHospitals.aspx.cs" Inherits="AdminAccess_Hospitals_ViewAllHospitals" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/RedirectAlert.ascx" TagPrefix="utmpl" TagName="RedirectAlert" %>
<%@ Register Src="~/TemplateControls/RedirectSuccessAlert.ascx" TagPrefix="utmpl" TagName="RedirectSuccessAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Hospitals List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Hospitals List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form id="Form1" runat="server" class="form-horizontal">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <utmpl:RedirectAlert runat="server" ID="RedirectAlert" />
                <utmpl:RedirectSuccessAlert runat="server" ID="RedirectSuccessAlert" />

                <div class="control-group">
                    <asp:Label CssClass="label_filter" ID="Label3" runat="server"
                        Text="Filter Hospitals by Name"></asp:Label>
                    <asp:TextBox ID="FindHospitalTextBox" runat="server"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindHospitalTextBox"
                        runat="server" ServiceMethod="GetCompletionList" UseContextKey="True">
                    </asp:AutoCompleteExtender>

                    <asp:Button ID="FindHospitalButton" CssClass="btn btn-primary" runat="server"
                        Text="Search" OnClick="FindHospitalButton_Click" />
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" Text="Cancel"
                        OnClick="Button3_Click" />
                </div>

                <asp:GridView ID="AllHospitalsGridView" runat="server"
                    CssClass="gridview table table-bordered table-striped table-hover"
                    AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True" PageSize="20"
                    DataSourceID="AllHospitalsDataSource">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="License Number">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("LicenseNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="ID" HeaderText="Details"
                            DataNavigateUrlFormatString="ViewHospitalDetails.aspx?ID={0}" Text="Details">
                            <ControlStyle CssClass="btn btn-small btn-primary" />
                        </asp:HyperLinkField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="AllHospitalsDataSource" runat="server" SelectMethod="GetAllHospitals"
                    EnablePaging="true" TypeName="HospitalData" MaximumRowsParameterName="pageSize"
                    StartRowIndexParameterName="startIndex" SortParameterName="sortBy"
                    SelectCountMethod="GetTotalHospitalsCount"></asp:ObjectDataSource>
                <asp:Timer ID="Timer1" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
    <%
        if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
        {
    %>
    <asp:HyperLink CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
        ID="HyperLink1" runat="server" NavigateUrl="/AdminAccess/Hospitals/AddNewHospital.aspx">
            Add New Hospital</asp:HyperLink>
    <%
            }
    %>
</asp:Content>

