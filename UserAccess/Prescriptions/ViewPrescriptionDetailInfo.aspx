<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPrescriptionDetailInfo.aspx.cs" Inherits="UserAccess_Prescriptions_ViewPrescriptionDetailInfo" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Prescription Details Info
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Prescription Details Info
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView Width="100%" ID="PrescriptionDetailInfoFormView" runat="server" DataKeyNames="ID" DataSourceID="PrescriptionDetailInfoDataSource" OnItemDeleted="PrescriptionDetailInfoFormView_ItemDeleted" OnItemUpdated="PrescriptionDetailInfoFormView_ItemUpdated" OnItemUpdating="PrescriptionDetailInfoFormView_ItemUpdating">
                    <EditItemTemplate>
                        <fieldset>
                            <legend>Enter Prescription Detail</legend>
                            <div class="form-group">
                                <label for="DrugGroupsDropdownList">Drug Group</label>
                                <asp:DropDownList ID="DrugGroupsDropdownList" runat="server" Width="70%"
                                    AutoPostBack="True" DataSourceID="DrugGroupsDataSource"
                                    DataTextField="Name" DataValueField="ID"
                                    SelectedValue='<%# ((Drug)Eval("Drug")).DrugGroupID %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="DrugGroupsDataSource" runat="server"
                                    ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="Name"
                                    Select="new (ID, Name)" TableName="DrugGroups">
                                </asp:LinqDataSource>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="DrugsDropdownList">Drug Group</label>
                                <asp:DropDownList ID="DrugsDropdownList" runat="server" Width="70%"
                                    DataSourceID="DrugsDataSource" DataTextField="Name" DataValueField="ID" OnDataBound="DrugsDropdownList_DataBound">
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Drug is required&lt;br/&gt;If there is no Drug, please add one."
                                    ControlToValidate="DrugsDropdownList" CssClass="label label-important"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:LinqDataSource ID="DrugsDataSource" runat="server"
                                    ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="Name"
                                    Select="new (ID, Name)" TableName="Drugs" Where="DrugGroupID == @DrugGroupID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="DrugGroupsDropdownList"
                                            Name="DrugGroupID" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label>Quantity</label>
                                <asp:TextBox ID="QuantityTextBox" Width="70%" runat="server"
                                    Text='<%# Bind("Quantity") %>' placeholder='Total Quantity'></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Quantity is required" ControlToValidate="QuantityTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Quantity must be a number" ControlToValidate="QuantityTextBox" CssClass="label label-important" Display="Dynamic" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label>Dose</label>
                                <asp:TextBox ID="DoseTextBox" Width="70%" runat="server"
                                    Text='<%# Bind("Dose") %>' placeholder='Quantity per day'></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Dose is required" ControlToValidate="DoseTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Dose must be a number" ControlToValidate="DoseTextBox" CssClass="label label-important" Display="Dynamic" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Dose must be less than or equal Total Quantity" ControlToCompare="QuantityTextBox" ControlToValidate="DoseTextBox" CssClass="label label-important" Display="Dynamic" Operator="LessThanEqual" Type="Integer"></asp:CompareValidator>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label>Special Instruction</label>
                                <asp:TextBox ID="SpecialInstructionTextBox" runat="server" TextMode="MultiLine"
                                    Text='<%# Bind("SpecialInstruction") %>' Rows="6" Width="70%"
                                    placeholder="Special Instruction"></asp:TextBox>
                            </div>
                            <p></p>
                            <asp:Button ID="UpdateButton" runat="server" Text="Update"
                                CssClass="btn btn-primary" CommandName="Update" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel"
                                CssClass="btn btn-primary" CausesValidation="false" CommandName="Cancel" />
                        </fieldset>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <table style="width: 80%" class="table">
                            <tr>
                                <td style="width: 40%">
                                    <strong>Drug</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server"
                                        Text='<%# ((Drug)Eval("Drug")).Name %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Quantity</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server"
                                        Text='<%# Eval("Quantity") %>'></asp:Label>
                                    <asp:Label ID="Label7" runat="server"
                                        Text='<%# ((Drug)Eval("Drug")).Unit %>'></asp:Label>(s)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Dose</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label8" runat="server"
                                        Text='<%# Eval("Dose") %>'></asp:Label>
                                    <asp:Label ID="Label9" runat="server"
                                        Text='<%# ((Drug)Eval("Drug")).Unit %>'></asp:Label>(s) / day
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Special Instruction</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label10" runat="server"
                                        Text='<%# Eval("SpecialInstruction") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="EditButton" runat="server" Text="Edit Prescription Detail"
                                        CssClass="btn btn-primary" CommandName="Edit" />
                                    <asp:Button ID="ViewVisitButton" runat="server" Text="View Visit Details"
                                        CssClass="btn btn-primary" OnClick="ViewVisitButton_Click" />
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete Prescription Detail"
                                        CssClass="btn btn-danger" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this Prescription Details?')" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="PrescriptionDetailInfoDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="PrescriptionDetails" Where="ID == @ID">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <p></p>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

