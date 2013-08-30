<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllMedicalServices.aspx.cs" Inherits="UserAccess_MedicalServices_ViewAllMedicalServices" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/RedirectAlert.ascx" TagPrefix="utmpl" TagName="RedirectAlert" %>
<%@ Register Src="~/TemplateControls/RedirectSuccessAlert.ascx" TagPrefix="utmpl" TagName="RedirectSuccessAlert" %>





<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Medical Services
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    All Medical Services
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <utmpl:RedirectAlert runat="server" ID="RedirectAlert" />
                <utmpl:RedirectSuccessAlert runat="server" ID="RedirectSuccessAlert" />

                <div class="control-group">
                    <strong><asp:Label CssClass="label_filter" ID="Label3" runat="server" Text="Filter"></asp:Label></strong>&nbsp;
                    <asp:TextBox placeholder="Medical Service Name" ID="FindMedicalServiceTextBox" runat="server"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindMedicalServiceTextBox"
                        runat="server" UseContextKey="True" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>
                    
                    <asp:Button ID="FindMedicalServiceButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="FindMedicalServiceButton_Click"/>
                    <asp:Button ID="CancelFindButton" runat="server" CssClass="btn btn-primary" Text="Cancel" OnClick="CancelFindButton_Click" />
                </div>

                <asp:GridView ID="AllMedicalServicesGridView" runat="server"
                    DataKeyNames="ID" AutoGenerateColumns="False"
                    CssClass="gridview table table-bordered table-striped table-hover"
                    OnRowDeleted="AllMedicalServicesGridView_RowDeleted"
                    OnRowDeleting="AllMedicalServicesGridView_RowDeleting"
                    AllowPaging="True" DataSourceID="AllMedicalServicesDataSource" PageSize="20">

                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price (USD)">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Group">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"
                                    Text='<%# (new DataClassesDataContext()).MedicalServiceGroups.Where(g => g.ID == long.Parse(Eval("MedicalServiceGroupID").ToString())).Select(g => g.Name).First().ToString() %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField HeaderStyle-Width="10%" FooterStyle-Width="10%"
                            ItemStyle-Width="10%" DataNavigateUrlFields="ID" HeaderText="Details"
                            DataNavigateUrlFormatString="ViewMedicalServiceDetails.aspx?ID={0}"
                            Text="Details">
                            <ControlStyle CssClass="btn btn-primary btn-small" />
                        <FooterStyle Width="10%" />
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                        </asp:HyperLinkField>
                        <asp:TemplateField HeaderStyle-Width="10%" HeaderText="Delete"
                            FooterStyle-Width="10%" ItemStyle-Width="10%">
                            <ItemTemplate>
                                <% if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
                                   {%>
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete"
                                    CommandName="Delete" CssClass="btn btn-danger btn-small"
                                    OnClientClick="return confirm('Are you sure to you want to delete this Medical Service?\n\nAll Lab Order Details associated with this Medical Service will be deleted, too!')" />
                                <%
                                   } else {%>
                                <asp:Label ID="Label5" runat="server" Text="Not Allow" CssClass="label label-important"></asp:Label>
                                <%
                                   } %>
                            </ItemTemplate>
                            <FooterStyle Width="10%" />
                            <HeaderStyle Width="10%" />
                            <ItemStyle Width="10%" />
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
                                    Page <%= AllMedicalServicesGridView.PageIndex + 1 %> of <%= AllMedicalServicesGridView.PageCount %>
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

                <asp:LinqDataSource ID="AllMedicalServicesDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EnableDelete="True"
                    EntityTypeName="" TableName="MedicalServices" Where="Name.Contains(@NamePart)">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="FindMedicalServiceTextBox" ConvertEmptyStringToNull="False" Name="NamePart" PropertyName="Text" />
                    </WhereParameters>
                </asp:LinqDataSource>

                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <% if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
           {%>
        <asp:HyperLink ID="AddNewButton" CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            runat="server" NavigateUrl="/AdminAccess/MedicalServices/AddNewMedicalService.aspx">
                                        Add New Medical Service
        </asp:HyperLink>
        <%
           } %>
        
    </form>
</asp:Content>

