<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewDrugGroup.aspx.cs" Inherits="UserAccess_Drugs_AllNewDrugGroup" %>

<%@ Register Src="/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Drug Group
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Drug Group
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:FormView Width="100%" ID="AddNewDrugGroupFormView" runat="server" DefaultMode="Insert" DataKeyNames="ID" DataSourceID="AddNewDrugGroupDataSource" OnItemInserted="AddNewDrugGroupFormView_ItemInserted">

                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Drug Group Information</legend>

                            <div class="form-group">
                                <label for="NameTextBox">Drug Group Name</label>
                                <asp:TextBox CssClass="form-control" Width="70%" ID="NameTextBox"
                                    Text='<%# Bind("Name") %>' runat="server"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Drug Group Name is required"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>

                            <div class="form-group">
                                <label for="DescriptionTextBox">Description</label>
                                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'
                                    TextMode="MultiLine" Rows="10" CssClass="form-control" Width="70%"></asp:TextBox>
                            </div>
                            <p></p>

                            <asp:Button ID="InsertButton" CommandName="Insert" runat="server" Text="Add New Drug Group"
                                CssClass="btn btn-primary" />
                            <asp:Button ID="ClearButton" runat="server" Text="Clear Form" CausesValidation="false"
                                CssClass="btn btn-primary" OnClick="ClearButton_Click" />
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="/UserAccess/Drugs/ViewAllDrugGroups.aspx"
                                runat="server" CssClass="btn btn-primary">Cancel</asp:HyperLink>
                        </fieldset>
                    </InsertItemTemplate>

                </asp:FormView>
                <asp:LinqDataSource ID="AddNewDrugGroupDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="DrugGroups">
                </asp:LinqDataSource>
                <p> </p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>

            
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

