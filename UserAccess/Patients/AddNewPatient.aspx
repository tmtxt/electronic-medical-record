<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewPatient.aspx.cs" Inherits="UserAccess_Patients_AddNewPatient" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add Patient
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Add New Patient
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:FormView Width="100%" ID="AddPatientFormView" runat="server" DataKeyNames="ID" DataSourceID="AddPatientDataSource" OnItemInserted="AddPatientFormView_ItemInserted">

                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Patient Information</legend>
                            <div class="row-fluid">
                                <div class="span6">
                                    <div class="form-group">
                                        <label for="NameTextBox">Name</label>
                                        <asp:TextBox CausesValidation="true" CssClass="form-control" ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Patient Name is required" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <p></p>
                                    </div>
                                    <div class="form-group">
                                        <label for="GenderDropdownList">Gender</label>
                                        <asp:DropDownList ID="GenderDropdownList" DataValueField='<%# Bind("Gender") %>' runat="server">
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
                                </div>
                                <div class="span6">
                                    <div class="form-group">
                                        <label for="DateOfBirthCalendar">Date Of Birth</label>
                                        <asp:Calendar ID="DateOfBirthCalendar"
                                            runat="server">

                                        </asp:Calendar>
                                    </div>
                                </div>
                            </div>
                            
                            <asp:LinkButton CssClass="btn btn-primary" ID="InsertButton" runat="server"
                                CausesValidation="True" Text="Insert" OnClick="InsertButton_Click" />
                            &nbsp;<asp:LinkButton CssClass="btn btn-primary" ID="ClearButton" runat="server"
                                CausesValidation="False" Text="Clear Form" OnClick="ClearButton_Click" />
                            &nbsp;<asp:LinkButton CssClass="btn btn-primary" ID="InsertCancelButton" runat="server"
                                CausesValidation="False" Text="Cancel" OnClick="InsertCancelButton_Click" />
                            
                        </fieldset>
                    </InsertItemTemplate>

                </asp:FormView>
                <asp:LinqDataSource ID="AddPatientDataSource"
                    runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="Patients">
                </asp:LinqDataSource>
                <p>&nbsp;</p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

