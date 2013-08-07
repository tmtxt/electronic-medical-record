<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewPrescriptionDetail.aspx.cs" Inherits="UserAccess_Prescriptions_AddNewPrescriptionDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Prescription Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Prescription Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:FormView Width="100%" ID="AddPrescriptionDetailFormView" runat="server" DataKeyNames="ID"
            DataSourceID="AddPrescriptionDetailDataSource" DefaultMode="Insert">
            
            <InsertItemTemplate>
                <fieldset>
                    <legend>Enter Prescription Detail</legend>
                    <div class="form-group">
                        <label for="DrugGroupsDropdownList">Drug</label>
                        <asp:DropDownList ID="DrugGroupsDropdownList" runat="server" Width="70%"
                            AutoPostBack="True" DataSourceID="DrugGroupsDataSource"
                            DataTextField="Name" DataValueField="ID"
                            OnSelectedIndexChanged="DrugGroupsDropdownList_SelectedIndexChanged"></asp:DropDownList>
                        <asp:LinqDataSource ID="DrugGroupsDataSource" runat="server"
                            ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="Name"
                            Select="new (ID, Name)" TableName="DrugGroups">
                        </asp:LinqDataSource>
                        <br />
                        <asp:DropDownList ID="DrugsDropdownList" runat="server" Width="70%"
                            DataSourceID="DrugsDataSource" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Drug is required&lt;br/&gt;If there is no Drug, please add one." ControlToValidate="DrugsDropdownList" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
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
                </fieldset>
            </InsertItemTemplate>

        </asp:FormView>
        <asp:LinqDataSource ID="AddPrescriptionDetailDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="PrescriptionDetails">
        </asp:LinqDataSource>
    </form>
</asp:Content>

