<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewICD.aspx.cs" Inherits="UserAccess_ICDs_AddNewICD" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add ICD
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Add New ICD
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView ID="AddNewICDFormView" runat="server" DataKeyNames="ID" DataSourceID="AddNewICDDataSource" DefaultMode="Insert" OnItemInserted="AddNewICDFormView_ItemInserted" OnItemInserting="AddNewICDFormView_ItemInserting">

                    <InsertItemTemplate>
                        <h4>Enter ICD Information</h4>
                        <table class="table table-hover">
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="CodeTextBox">ICD Code *</label>
                                        <asp:TextBox ID="CodeTextBox" runat="server"
                                            Text='<%# Bind("Code") %>'></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CodeTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="ICD Code is required"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                                <td rowspan="3">
                                    <div class="form-group">
                                        <label for="DescriptionTextBox">Description</label>
                                        <asp:TextBox ID="DescriptionTextBox" runat="server" TextMode="MultiLine"
                                            Rows="9" Text='<%# Bind("Description") %>'></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="NameTextBox">ICD Name *</label>
                                        <asp:TextBox ID="NameTextBox" runat="server"
                                            Text='<%# Bind("Name") %>'></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="ICD Name is required"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ICDChapterDropdownList">ICD Chapter</label>
                                    <asp:DropDownList ID="ICDChapterDropdownList" runat="server"
                                        SelectedValue='<%# Bind("ICDChapterID") %>' DataSourceID="ICDChaptersDataSource" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:LinqDataSource ID="ICDChaptersDataSource" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="ICDChapters">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="InsertButton" runat="server" Text="Add New ICD"
                                        CommandName="Insert" CssClass="btn btn-primary" CausesValidation="true" />
                                    <asp:Button ID="ClearButton" runat="server" Text="Clear Form"
                                         CssClass="btn btn-primary" CausesValidation="false" OnClick="ClearButton_Click" />
                                    <asp:HyperLink ID="HyperLink1" runat="server"  CssClass="btn btn-primary"
                                        NavigateUrl="/UserAccess/ICDs/ViewAllICD.aspx">
                                        Cancel
                                    </asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>

                </asp:FormView>

                <asp:LinqDataSource ID="AddNewICDDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="ICDs">
                </asp:LinqDataSource>
                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

