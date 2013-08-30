<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllDrugGroups.aspx.cs" Inherits="UserAccess_Drugs_ViewAllDrugGroups" %>

<%@ Register Src="/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/RedirectSuccessAlert.ascx" TagPrefix="utmpl" TagName="RedirectSuccessAlert" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Drug Groups
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    All Drug Groups
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <utmpl:RedirectSuccessAlert runat="server" ID="RedirectSuccessAlert" />

                <div class="control-group">
                    <asp:Label CssClass="label_filter" ID="Label3" runat="server"
                        Text="Filter Drug Group by Name"></asp:Label>
                    <asp:TextBox ID="FindDrugGroupTextBox" runat="server"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindDrugGroupTextBox"
                        runat="server" UseContextKey="True" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>
                    <asp:Button ID="FindDrugGroupButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="FindDrugGroupButton_Click" />
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Cancel" OnClick="Button1_Click" />
                </div>

                <asp:GridView ID="AllDrugGroupsGridView" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ID" DataSourceID="AllDrugGroupsDataSource"
                    CssClass="table table-bordered table-striped table-hover" OnRowDeleted="AllDrugGroupsGridView_RowDeleted" OnRowUpdated="AllDrugGroupsGridView_RowUpdated" OnRowDeleting="AllDrugGroupsGridView_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name"
                            HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%">
                            <EditItemTemplate>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Drug Group Name is required" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Width="40%" />
                            <HeaderStyle Width="40%" />
                            <ItemStyle Width="40%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description"
                            HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server" Rows="6"
                                    Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Width="40%" />
                            <HeaderStyle Width="40%" />
                            <ItemStyle Width="40%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">
                            <EditItemTemplate>
                                <asp:Button ID="UpdateButton" runat="server" Text="Update" CommandName="Update"
                                    CssClass="btn btn-primary" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <% if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
                                   {%>
                                <asp:Button ID="EditButton" runat="server" Text="Edit" CommandName="Edit"
                                    CssClass="btn btn-primary" />
                                <%
                                   } else {%>
                                <asp:Label ID="Label4" runat="server" Text="Not Allow" CssClass="label label-important"></asp:Label>
                                <%
                                   } %>
                                
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <EditItemTemplate>
                                <asp:Button ID="CancelButton" runat="server" Text="Cancel" CommandName="Cancel"
                                    CssClass="btn btn-primary" CausesValidation="False" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <% if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
                                   {%>
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete" CommandName="Delete"
                                    CssClass="btn btn-danger"
                                    OnClientClick="return confirm('Are you sure you want to delete this Drug Group?\n\nAll Drugs belong to this Group as well as All Prescription Details associated with those Drugs will be deleted, too.')" />
                                <%
                                   } else {%>
                                <asp:Label ID="Label5" runat="server" Text="Not Allow" CssClass="label label-important"></asp:Label>
                                <%
                                   } %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <asp:LinqDataSource ID="AllDrugGroupsDataSource" runat="server" ContextTypeName="DataClassesDataContext"
                    EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="DrugGroups"
                    Where="Name.Contains(@NamePart)">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="FindDrugGroupTextBox"
                            ConvertEmptyStringToNull="False" Name="NamePart" PropertyName="Text" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
    <% if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
       {%>
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
        NavigateUrl="/AdminAccess/Drugs/AddNewDrugGroup.aspx">
        Add New Drug Group</asp:HyperLink>
    <%
       } %>
</asp:Content>

