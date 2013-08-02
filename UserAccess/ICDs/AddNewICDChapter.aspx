<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewICDChapter.aspx.cs" Inherits="UserAccess_ICDs_AddNewICDChapter" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add ICD Chapter
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Add New ICD Chapter
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:FormView Width="100%" DataSourceID="AddNewICDChapterDataSource"
                    ID="AddNewICDChapterFormView" runat="server" DefaultMode="Insert"
                    DataKeyNames="ID" OnItemInserted="AddNewICDChapterFormView_ItemInserted">
                        
                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter ICD Chapter information</legend>
                            <div class="form-group">
                                <label for="NameTextBox">ICD Chapter Name *</label>
                                <asp:TextBox CssClass="form-control" Text='<%# Bind("Name") %>' ID="NameTextBox" runat="server" Width="70%"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="DescriptionTextBox">ICD Chapter Description</label>
                                <asp:TextBox Text='<%# Bind("Description") %>' CssClass="form-control"
                                    ID="DescriptionTextBox" runat="server" TextMode="MultiLine" Rows="10" Width="70%"></asp:TextBox>
                            </div>
                            <p></p>
                            <asp:Button ID="Button1" runat="server" Text="Add New ICD Chapter" CommandName="Insert" CssClass="btn btn-primary" />
                            <asp:Button ID="Button2" runat="server" Text="Clear Form" CssClass="btn btn-primary" CausesValidation="False" OnClick="Button2_Click" />
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl="~/UserAccess/ICDs/ViewAllICDChapters.aspx">Cancel</asp:HyperLink>
                        </fieldset>
                    </InsertItemTemplate>

                </asp:FormView>
                <asp:LinqDataSource ID="AddNewICDChapterDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="ICDChapters">
                </asp:LinqDataSource>
                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

