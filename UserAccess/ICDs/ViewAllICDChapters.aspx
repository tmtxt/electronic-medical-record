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
                    <asp:Label CssClass="label_filter" ID="Label3" runat="server" Text="Filter Patients by Name"></asp:Label>
                    
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindICDChapterTextBox"
                        runat="server" UseContextKey="True" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>
                    <asp:TextBox ID="FindICDChapterTextBox" runat="server"></asp:TextBox>
                    <asp:Button ID="FindICDChapterButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="FindICDChapterButton_Click" />
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Cancel" />
                </div>

                <asp:GridView CssClass="table table-bordered table-striped table-hover" ID="AllICDChaptersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AllICDChaptersDataSource" OnRowDeleted="AllICDChaptersGridView_RowDeleted" OnRowDeleting="AllICDChaptersGridView_RowDeleting" OnRowUpdated="AllICDChaptersGridView_RowUpdated" OnRowUpdating="AllICDChaptersGridView_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%" HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%" HeaderText="Description" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Rows="6" TextMode="MultiLine" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="10%" FooterStyle-Width="10%" ItemStyle-Width="10%">
                            <EditItemTemplate>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-primary" Text="Update" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-primary" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="10%" FooterStyle-Width="10%" ItemStyle-Width="10%">
                            <EditItemTemplate>
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-primary" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-danger" Text="Delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this ICD Chapter?\nAll ICDs belong to this Chapter and All Visits associated with those ICDs will be deleted, too!')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
</asp:Content>

