<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllDrugs.aspx.cs" Inherits="UserAccess_Drugs_ViewAllDrugs" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/RedirectAlert.ascx" TagPrefix="utmpl" TagName="RedirectAlert" %>
<%@ Register Src="~/TemplateControls/RedirectSuccessAlert.ascx" TagPrefix="utmpl" TagName="RedirectSuccessAlert" %>





<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Drugs List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Drugs List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <utmpl:RedirectAlert runat="server" ID="RedirectAlert" />
                <utmpl:RedirectSuccessAlert runat="server" ID="RedirectSuccessAlert" />

                <div class="control-group">
                    <strong><asp:Label CssClass="label_filter" ID="Label3" runat="server" Text="Filter by Name"></asp:Label></strong>&nbsp;
                    <asp:TextBox ID="FindDrugTextBox" runat="server" placeholder="Enter Drug Name"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindDrugTextBox"
                        runat="server" UseContextKey="True" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>
                    <asp:Button ID="FindDrugButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="FindDrugButton_Click" />
                    <asp:Button ID="CancelFindButton" runat="server" CssClass="btn btn-primary" Text="Cancel" OnClick="CancelFindButton_Click" />
                </div>

                <asp:GridView ID="AllDrugGridView" runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="ID" DataSourceID="AllDrugsDataSource"
                    CssClass="gridview table table-bordered table-striped table-hover" AllowPaging="True" OnRowDeleted="AllDrugGridView_RowDeleted" OnRowDeleting="AllDrugGridView_RowDeleting">

                    <Columns>
                        <asp:TemplateField HeaderText="Drug Name" SortExpression="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Generic Name" SortExpression="GenericName">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("GenericName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Drug Group" SortExpression="DrugGroupID">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"
                                    Text='<%# (new DataClassesDataContext()).DrugGroups
                                .Where(g => g.ID == long.Parse(Eval("DrugGroupID").ToString()))
                                .Select(g => g.Name).First().ToString() %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="ID" Text="Details"
                            DataNavigateUrlFormatString="ViewDrugDetails.aspx?ID={0}">
                            <ControlStyle CssClass="btn btn-small btn-primary" />
                        </asp:HyperLinkField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete"
                                    CommandName="Delete" CssClass="btn btn-danger btn-small"
                                    OnClientClick="return confirm('Are you sure you want to delete this Drug?\n\nAll Prescription Details associated with this Drug will be deleted, too!')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <pagertemplate>
                        <ul class="pager">
                            <li>
                                <asp:LinkButton CommandName="Page" CommandArgument="First" ID="HyperLink2" runat="server">
                                    First
                                </asp:LinkButton>
                                <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="LinkButton1" runat="server">
                                    Previous
                                </asp:LinkButton>
                                <asp:Label ID="Label4" runat="server" Text="Label">
                                    Page <%= AllDrugGridView.PageIndex + 1 %> of <%= AllDrugGridView.PageCount %>
                                </asp:Label>
                                <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="LinkButton2" runat="server">
                                    Next
                                </asp:LinkButton>
                                <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="LinkButton3" runat="server">
                                    Last
                                </asp:LinkButton>
                            </li>
                        </ul>
                    </pagertemplate>
                </asp:GridView>

                <asp:LinqDataSource ID="AllDrugsDataSource" runat="server" ContextTypeName="DataClassesDataContext"
                    EnableDelete="True" EntityTypeName="" TableName="Drugs" Where="Name.Contains(@NamePart)">
                    
                    <WhereParameters>
                        <asp:ControlParameter ControlID="FindDrugTextBox" Name="NamePart" PropertyName="Text"
                            ConvertEmptyStringToNull="false" />
                    </WhereParameters>
                    
                </asp:LinqDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <p></p>
        <asp:HyperLink ID="AddNewButton" CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            runat="server" NavigateUrl="/UserAccess/Drugs/AddNewDrug.aspx">
                                        Add New Drug
        </asp:HyperLink>
    </form>
</asp:Content>

