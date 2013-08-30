<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewDrug.aspx.cs" Inherits="UserAccess_Drugs_AddNewDrug" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Drug
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Drug
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView Width="100%" ID="AddNewDrugFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="AddNewDrugDataSource" DefaultMode="Insert" OnItemInserted="AddNewDrugFormView_ItemInserted">
                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Drug information</legend>
                            <div class="form-group">
                                <label for="NameTextBox">Drug Name *</label>
                                <asp:TextBox ID="NameTextBox" runat="server"
                                    Text='<%# Bind("Name") %>'></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Drug Name is required" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="GenericNameTextBox">Generic Name *</label>
                                <asp:TextBox ID="GenericNameTextBox" runat="server"
                                    Text='<%# Bind("GenericName") %>'></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Generic Name is required" ControlToValidate="GenericNameTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="UnitTextBox">Unit *</label>
                                <asp:TextBox ID="UnitTextBox" runat="server"
                                    Text='<%# Bind("Unit") %>'></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Unit is required" ControlToValidate="UnitTextBox" CssClass="label label-important"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="PriceTextBox">Price *</label>
                                <asp:TextBox ID="PriceTextBox" runat="server"
                                    Text='<%# Bind("Price") %>'></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Drug Price is required" ControlToValidate="PriceTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Price must be a number" ControlToValidate="PriceTextBox" CssClass="label label-important" Display="Dynamic" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="DrugGroupDropdownList">Drug Group</label>
                                <asp:DropDownList ID="DrugGroupDropdownList" runat="server"
                                    DataSourceID="DrugGroupDataSource" DataTextField="Name"
                                    DataValueField="ID"
                                    SelectedValue='<%# Bind("DrugGroupID") %>'></asp:DropDownList>
                                <asp:LinqDataSource ID="DrugGroupDataSource" runat="server"
                                    ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                    TableName="DrugGroups">
                                </asp:LinqDataSource>
                            </div>
                            <p></p>
                            <asp:Button ID="AddButton" runat="server" Text="Add New Drug"
                                CommandName="Insert" CausesValidation="true" CssClass="btn btn-primary" />
                            <asp:Button ID="ClearButton" runat="server" Text="Clear Form"
                                CausesValidation="false" CssClass="btn btn-primary" OnClick="ClearButton_Click" />
                            <asp:HyperLink CssClass="btn btn-primary" ID="CancelButton"
                                NavigateUrl="/UserAccess/Drugs/ViewAllDrugs.aspx" runat="server">
                                Cancel
                            </asp:HyperLink>
                        </fieldset>
                    </InsertItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="AddNewDrugDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="Drugs">
                </asp:LinqDataSource>

                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

