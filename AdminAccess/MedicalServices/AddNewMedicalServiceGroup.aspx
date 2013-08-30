<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewMedicalServiceGroup.aspx.cs" Inherits="UserAccess_MedicalServices_AddNewMedicalServiceGroup" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Medical Service Group
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Medical Service Group
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:FormView ID="AddNewMedicalServiceGroupFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="AddNewMedicalServiceGroupDataSource" DefaultMode="Insert" Width="100%" OnItemInserted="AddNewMedicalServiceGroupFormView_ItemInserted">

                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Medical Service Group details</legend>
                            <div class="form-group">
                                <label for="NameTextBox">Medical Service Group Name *</label>
                                <asp:TextBox Width="70%" ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' /><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Medical Service Group Name is required" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="DescriptionTextBox">Description</label>
                                <asp:TextBox Width="70%" ID="DescriptionTextBox" runat="server"
                                    Text='<%# Bind("Description") %>' TextMode="MultiLine" Rows="10" />
                            </div>
                        </fieldset>
                        <asp:Button ID="InsertButton" CssClass="btn btn-primary" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Medical Service Group" />
                        <asp:Button ID="ClearFormButton" CausesValidation="false" CssClass="btn btn-primary" runat="server" Text="Clear Form" OnClick="ClearFormButton_Click" />
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl="/UserAccess/MedicalServices/ViewAllMedicalServiceGroups.aspx">Cancel</asp:HyperLink>
                    </InsertItemTemplate>
                    

                </asp:FormView>
                <asp:LinqDataSource ID="AddNewMedicalServiceGroupDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="MedicalServiceGroups">
                </asp:LinqDataSource>
                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

