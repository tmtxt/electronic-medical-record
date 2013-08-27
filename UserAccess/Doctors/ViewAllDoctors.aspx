<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllDoctors.aspx.cs" Inherits="UserAccess_Doctors_ViewAllDoctors" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>


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
                <asp:GridView ID="AllDoctorsGridView" runat="server"
                     CssClass="gridview table table-bordered table-striped table-hover"
                    AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True" PageSize="5" DataSourceID="AllDoctorsDataSource">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
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
</asp:Content>

