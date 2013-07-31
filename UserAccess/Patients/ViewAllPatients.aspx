<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllPatients.aspx.cs" Inherits="UserAccess_Patients_ViewAllPatient" %>

<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Patients
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Patients List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="AllPatientsScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="AllPatientsUpdatePanel" runat="server">
            <ContentTemplate>
                <asp:GridView CssClass="gridview table table-bordered table-striped table-hover" ID="AllPatientsGridview" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AllPatientsDataSource" OnRowDeleted="AllPatientsGridview_RowDeleted" OnRowDeleting="AllPatientsGridview_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:TemplateField HeaderText="DateOfBirth" SortExpression="DateOfBirth">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# DateTime.FromBinary(long.Parse(Eval("DateOfBirth").ToString())).ToShortDateString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />

                        <%--<asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-small btn-primary" CommandName="Edit"  />
                            </ItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ViewPatientDetails.aspx?ID={0}" Text="Detail">
                            <ControlStyle CssClass="btn btn-small btn-primary" />
                        </asp:HyperLinkField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="btn btn-small btn-primary" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this patient?')" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>

        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <asp:LinqDataSource ID="AllPatientsDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Patients">
        </asp:LinqDataSource>
    </form>
    <asp:HyperLink CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            ID="HyperLink1" runat="server" NavigateUrl="/UserAccess/Patients/AddNewPatient.aspx">
            Add New Patient</asp:HyperLink>
</asp:Content>

