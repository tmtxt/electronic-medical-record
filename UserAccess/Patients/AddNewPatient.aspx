<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewPatient.aspx.cs" Inherits="UserAccess_Patients_AddNewPatient" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add Patient
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Add New Patient
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:FormView Width="100%" ID="AddPatientFormView" runat="server" DataKeyNames="ID" DataSourceID="AddPatientDataSource" OnItemInserted="AddPatientFormView_ItemInserted" DefaultMode="Insert" OnItemInserting="AddPatientFormView_ItemInserting">

                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Patient Information</legend>
                            <div class="form-group">
                                <label for="NameTextBox">Name</label>
                                <asp:TextBox CausesValidation="true" CssClass="form-control" ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Patient Name is required" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="GenderDropdownList">Gender</label>
                                <asp:DropDownList ID="GenderDropdownList" SelectedValue='<%# Bind("Gender") %>' runat="server">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Gay</asp:ListItem>
                                    <asp:ListItem>Les</asp:ListItem>
                                    <asp:ListItem>Bi</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="AddressTextbox">Address</label>
                                <asp:TextBox CausesValidation="true" ID="AddressTextbox" runat="server" Text='<%# Bind("Address") %>' TextMode="MultiLine" Rows="3" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AddressTextbox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Patient Address is required"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="DateOfBirthCalendar">Date Of Birth</label>
                                <utmpl:DatePicker IsRequired="true" InitialDate='<%# DateTime.Now.Ticks %>' runat="server" ID="DateOfBirthDatePicker" />
                            </div>

                            <p></p>
                            <asp:Button CssClass="btn btn-primary" ID="InsertButton" runat="server"
                                CausesValidation="True" Text="Add New Patient" CommandName="Insert" />
                            &nbsp;<asp:Button CssClass="btn btn-primary" ID="ClearButton" runat="server"
                                CausesValidation="False" Text="Clear Form" OnClick="ClearButton_Click" />
                            &nbsp;<asp:Button CssClass="btn btn-primary" ID="InsertCancelButton" runat="server"
                                CausesValidation="False" Text="Cancel" OnClick="InsertCancelButton_Click" />

                        </fieldset>
                    </InsertItemTemplate>

                </asp:FormView>
                <asp:LinqDataSource ID="AddPatientDataSource"
                    runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="Patients" OnInserted="AddPatientDataSource_Inserted">
                </asp:LinqDataSource>
                <p>&nbsp;</p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

