<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllICDChapters.aspx.cs" Inherits="UserAccess_ICD_ViewAllICDChapter" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    ICD Chapters
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    ICD Chapters List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="control-group">
                    <asp:Label CssClass="label_filter" ID="Label3" runat="server" Text="Filter ICD Chapter by Name"></asp:Label>
                    
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindICDChapterTextBox"
                        runat="server" UseContextKey="True" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>
                    <asp:TextBox ID="FindICDChapterTextBox" runat="server"></asp:TextBox>
                    <asp:Button ID="FindICDChapterButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="FindICDChapterButton_Click" />
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Cancel" />
                </div>

                <asp:GridView CssClass="table table-bordered table-striped table-hover" ID="AllICDChaptersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AllICDChaptersDataSource" OnRowDeleted="AllICDChaptersGridView_RowDeleted" OnRowDeleting="AllICDChaptersGridView_RowDeleting" OnRowUpdated="AllICDChaptersGridView_RowUpdated" OnRowUpdating="AllICDChaptersGridView_RowUpdating" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%" HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="ICD Chapter Name is required"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label><br />
                                
                            </ItemTemplate>
                            <FooterStyle Width="40%" />
                            <HeaderStyle Width="40%" />
                            <ItemStyle Width="40%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%" HeaderText="Description" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Rows="6" TextMode="MultiLine" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Width="40%" />
                            <HeaderStyle Width="40%" />
                            <ItemStyle Width="40%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="10%" HeaderText="Edit"
                            FooterStyle-Width="10%" ItemStyle-Width="10%">
                            <EditItemTemplate>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-primary" Text="Update" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <% if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
                                   {%>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-primary" Text="Edit" />
                                <%
                                   } else {%>
                                <asp:Label ID="Label6" runat="server" Text="Not Allow" CssClass="label label-important"></asp:Label>
                                <%
                                   } %>
                                
                               
                            </ItemTemplate>
                            <FooterStyle Width="10%" />
                            <HeaderStyle Width="10%" />
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="10%" HeaderText="Delete"
                            FooterStyle-Width="10%" ItemStyle-Width="10%">
                            <EditItemTemplate>
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-primary" Text="Cancel" CausesValidation="False" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <% if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
                                   {%>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-danger" Text="Delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this ICD Chapter?\n\nAll ICDs belong to this Chapter and All Visits associated with those ICDs will be deleted, too!')" />
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
                                    Page <%= AllICDChaptersGridView.PageIndex + 1 %> of <%= AllICDChaptersGridView.PageCount %>
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
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                
                <asp:LinqDataSource ID="AllICDChaptersDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True"
                    EntityTypeName="" TableName="ICDChapters" Where="Name.Contains(@NamePart)">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="FindICDChapterTextBox"
                            ConvertEmptyStringToNull="False" Name="NamePart" PropertyName="Text" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />

    </form>
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign" NavigateUrl="~/UserAccess/ICDs/AddNewICDChapter.aspx">Add New ICD Chapter</asp:HyperLink>
</asp:Content>

