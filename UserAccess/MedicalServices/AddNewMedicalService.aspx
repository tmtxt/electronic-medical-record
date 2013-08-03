<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewMedicalService.aspx.cs" Inherits="UserAccess_MedicalServices_AddNewMedicalService" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Medical Service
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Medical Service
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:FormView Width="100%" ID="AddNewMedicalServiceFormView" runat="server" DefaultMode="Insert" DataKeyNames="ID" DataSourceID="AddNewMedicalServiceDataSource" OnItemInserting="AddNewMedicalServiceFormView_ItemInserting" OnItemInserted="AddNewMedicalServiceFormView_ItemInserted">
                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Medical Service Information</legend>
                            <div class="form-group">
                                <label for="NameTextBox">Medical Service Name *</label>
                                <asp:TextBox Text='<%# Bind("Name") %>' ID="NameTextBox" runat="server"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Medical Service Name is required"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="PriceTextBox">Price *</label>
                                <asp:TextBox ID="PriceTextBox" Text='<%# Bind("Price") %>' runat="server"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PriceTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Medical Service Price is required"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="PriceTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Price must be a number" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="MedicalServiceGroupNameDropdownList">
                                    Medical Service Group
                                </label>
                                <asp:DropDownList ID="MedicalServiceGroupNameDropdownList" runat="server"
                                    DataSourceID="MedicalServiceGroupDataSource" DataTextField="Name"
                                    DataValueField="ID">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="MedicalServiceGroupDataSource" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="MedicalServiceGroups">
                                </asp:LinqDataSource>
                            </div>
                            <asp:Button ID="AddButton" runat="server" Text="Add New Medical Service"
                                CommandName="Insert" CausesValidation="true" CssClass="btn btn-primary" />
                            <asp:Button ID="ClearButton" runat="server" Text="Clear Form"
                                CausesValidation="false" CssClass="btn btn-primary" OnClick="ClearButton_Click" />
                            <asp:HyperLink CssClass="btn btn-primary" ID="CancelButton"
                                NavigateUrl="/UserAccess/MedicalServices/ViewAllMedicalServices.aspx" runat="server">
                                Cancel
                            </asp:HyperLink>
                        </fieldset>
                    </InsertItemTemplate>
                </asp:FormView>
                <asp:LinqDataSource ID="AddNewMedicalServiceDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="MedicalServices">
                </asp:LinqDataSource>
                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

