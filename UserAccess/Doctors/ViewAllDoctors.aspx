<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllDoctors.aspx.cs" Inherits="UserAccess_Doctors_ViewAllDoctors" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/RedirectAlert.ascx" TagPrefix="utmpl" TagName="RedirectAlert" %>
<%@ Register Src="~/TemplateControls/RedirectSuccessAlert.ascx" TagPrefix="utmpl" TagName="RedirectSuccessAlert" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Doctors List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Doctors List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <utmpl:RedirectAlert runat="server" ID="RedirectAlert" />
                <utmpl:RedirectSuccessAlert runat="server" ID="RedirectSuccessAlert" />

                <asp:GridView ID="AllDoctorsGridView" runat="server"
                     CssClass="gridview table table-bordered table-striped table-hover"
                    AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True" PageSize="20"
                    DataSourceID="AllDoctorsDataSource">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Birthdate">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# DateTime.FromBinary(long.Parse(Eval("DateOfBirth").ToString())).ToShortDateString() %>'></asp:Label>
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
                            DataNavigateUrlFormatString="ViewDoctorDetails.aspx?ID={0}" Text="Details">
                            <ControlStyle CssClass="btn btn-small btn-primary" />
                        </asp:HyperLinkField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="AllDoctorsDataSource" runat="server" SelectMethod="GetAllDoctors"
                    EnablePaging="true" TypeName="DoctorData" MaximumRowsParameterName="pageSize"
                    StartRowIndexParameterName="startIndex" SortParameterName="sortBy"
                    SelectCountMethod="GetTotalDoctorsCount"></asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
    <asp:HyperLink CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            ID="HyperLink1" runat="server" NavigateUrl="/UserAccess/Doctors/AddNewDoctor.aspx">
            Add New Doctor</asp:HyperLink>
</asp:Content>

