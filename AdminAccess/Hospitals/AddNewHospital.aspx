<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewHospital.aspx.cs" Inherits="AdminAccess_Hospitals_AddNewHospital" %>
<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Hospital
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Hospital
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form id="Form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:FormView ID="AddHospitalFormView" runat="server" Width="100%" DataKeyNames="ID"
                    DataSourceID="AddHospitalDataSource" DefaultMode="Insert"
                    OnItemInserted="AddHospitalFormView_ItemInserted"
                    OnItemInserting="AddHospitalFormView_ItemInserting">

                    
                    <InsertItemTemplate>
                        <fieldset>
                            <legend>
                                Enter Hospital Information
                            </legend>
                            <div class="form-group">
                                <label for="NameTextBox">Name</label>
                                <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Hospital Name is required" ControlToValidate="NameTextBox"
                                    CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="LicenseTextBox">License Number</label>
                                <asp:TextBox ID="LicenseTextBox" runat="server" CssClass="form-control"
                                    Text='<%# Bind("LicenseNumber") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="LicenseTextBox" CssClass="label label-important"
                                    Display="Dynamic" ErrorMessage="License Number is required">
                                </asp:RequiredFieldValidator>
                                <p></p>
                            </div>
                            <div class="form-group">
                                <label for="AddressTextbox">Address</label>
                                <asp:TextBox CausesValidation="true" ID="AddressTextbox" runat="server"
                                    Text='<%# Bind("Address") %>' TextMode="MultiLine" Rows="3" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="AddressTextbox" CssClass="label label-important"
                                    Display="Dynamic" ErrorMessage="Hospital Address is required">
                                </asp:RequiredFieldValidator>
                                <p></p>
                            </div>

                            <p></p>

                            <asp:Button CssClass="btn btn-primary" ID="InsertButton" runat="server"
                                CausesValidation="True" Text="Add New Doctor" CommandName="Insert" />
                            &nbsp;<asp:Button CssClass="btn btn-primary" ID="ClearButton" runat="server"
                                CausesValidation="False" Text="Clear Form" OnClick="ClearButton_Click" />
                            &nbsp;<asp:Button CssClass="btn btn-primary" ID="InsertCancelButton" runat="server"
                                CausesValidation="False" Text="Cancel" OnClick="InsertCancelButton_Click" />
                        </fieldset>
                    </InsertItemTemplate>
                    

                </asp:FormView>
                <asp:LinqDataSource ID="AddHospitalDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName=""
                    TableName="Hospitals" OnInserted="AddHospitalDataSource_Inserted"
                    OnInserting="AddHospitalDataSource_Inserting">
                </asp:LinqDataSource>
                <p>&nbsp;</p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

