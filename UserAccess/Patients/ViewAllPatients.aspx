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
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="AllPatientsUpdatePanel" runat="server">
            <ContentTemplate>
                <div class="text-center">
                    <asp:Label CssClass="label_filter" ID="Label3" runat="server" Text="Filter Patients by Name"></asp:Label>
                    <asp:TextBox ID="FindPatientTextBox" runat="server"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindPatientTextBox" runat="server" ServiceMethod="GetCompletionList" UseContextKey="True"></asp:AutoCompleteExtender>
                    
                    <asp:Button ID="FindPatientButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="FindPatientButton_Click" />
                </div>

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
                                <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="btn btn-small btn-primary" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this patient?\nAll visits belong to this patient will be deleted, too!')" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>

        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <asp:LinqDataSource ID="AllPatientsDataSource" runat="server" ContextTypeName="DataClassesDataContext"
            EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Patients"
            Where="Name.Contains(@NamePart)" >
            <WhereParameters>
                
                <asp:ControlParameter ControlID="FindPatientTextBox" ConvertEmptyStringToNull="False" Name="NamePart" PropertyName="Text" />
                
            </WhereParameters>
        </asp:LinqDataSource>
    </form>
    <asp:HyperLink CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            ID="HyperLink1" runat="server" NavigateUrl="/UserAccess/Patients/AddNewPatient.aspx">
            Add New Patient</asp:HyperLink>
</asp:Content>

