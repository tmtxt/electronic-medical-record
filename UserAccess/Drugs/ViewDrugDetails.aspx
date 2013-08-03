<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewDrugDetails.aspx.cs" Inherits="UserAccess_Drugs_ViewDrugDetails" %>

<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Drug Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Drug Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:FormView ID="DrugDetailsFormView" runat="server" DataKeyNames="ID" DataSourceID="DrugDetailDataSource" OnItemDeleted="DrugDetailsFormView_ItemDeleted" OnItemUpdated="DrugDetailsFormView_ItemUpdated">
                    <EditItemTemplate>

                        <h3><%# Eval("Name") %></h3>
                        <table class="table table-hover">
                            <tr>
                                <td>
                                    <strong>ID</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Name</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="NameTextBox" Text='<%# Bind("Name") %>' runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Drug Name is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Generic Name</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="GenericName" Text='<%# Bind("GenericName") %>' runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="GenericName" CssClass="label label-important" Display="Dynamic" ErrorMessage="Generic Name is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Unit</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="UnitTextBox" Text='<%# Bind("Unit") %>' runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UnitTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Unit is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Price (USD)</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="PriceTextBox" Text='<%# Bind("Price") %>' runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PriceTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Drug Price is required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="PriceTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Price must be a number" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Drug Group</strong>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DrugGroupDropdownList" runat="server"
                                        DataSourceID="DrugGroupDataSource" DataTextField="Name"
                                        DataValueField="ID" SelectedValue='<%# Bind("DrugGroupID") %>'></asp:DropDownList>
                                    <asp:LinqDataSource ID="DrugGroupDataSource" runat="server"
                                        ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                        TableName="DrugGroups">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">

                                    <asp:Button ID="UpdateButton" runat="server" Text="Update"
                                        CommandName="Update" CssClass="btn btn-primary" />
                                    <asp:Button ID="ClearButton" CausesValidation="false" runat="server" Text="Clear Form"
                                        CssClass="btn btn-primary" />
                                    <asp:Button ID="CancelButton" CausesValidation="false" runat="server" Text="Cancel"
                                        CommandName="Cancel" CssClass="btn btn-primary" />
                                </td>
                            </tr>
                        </table>

                    </EditItemTemplate>

                    <ItemTemplate>

                        <h3><%# Eval("Name") %></h3>
                        <table class="table table-hover">
                            <tr>
                                <td>
                                    <strong>ID</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Name</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Generic Name</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("GenericName") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Unit</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Price (USD)</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Drug Group</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text='<%# ((Drug)DrugDetailsFormView.DataItem).DrugGroup.Name %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete Drug"
                                        CommandName="Delete" CssClass="btn btn-danger"
                                        OnClientClick="return confirm('Are you sure you want to delete this Drug?\n\nAll Prescription Details associated with this Drug will be deleted, too!')" />
                                    <asp:Button ID="EditButton" runat="server" Text="Edit Drug"
                                        CommandName="Edit" CssClass="btn btn-primary" />
                                    <asp:HyperLink ID="ViewAllDrugsButton" runat="server" CssClass="btn btn-primary"
                                        NavigateUrl="~/UserAccess/Drugs/ViewAllDrugs.aspx">
                                        View All Drugs
                                    </asp:HyperLink>
                                </td>
                            </tr>
                        </table>


                    </ItemTemplate>
                </asp:FormView>
                <asp:LinqDataSource ID="DrugDetailDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Drugs" Where="ID == @ID">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <p></p>
        <asp:HyperLink ID="AddNewButton" CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            runat="server" NavigateUrl="/UserAccess/Drugs/AddNewDrug.aspx">
                                        Add New Drug
        </asp:HyperLink>
    </form>
</asp:Content>

