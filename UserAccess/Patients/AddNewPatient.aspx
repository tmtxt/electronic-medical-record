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
                <asp:FormView Width="100%" ID="AddPatientFormView" runat="server" DataKeyNames="ID" DataSourceID="AddPatientDataSource">

                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Patient Information</legend>
                            <div class="row-fluid">
                                <div class="span6">
                                    <div class="form-group">
                                        <label for="NameTextBox">Name</label>
                                        <asp:TextBox CssClass="form-control" ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
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
                                        <asp:TextBox ID="AddressTextbox" runat="server" Text='<%# Bind("Address") %>' TextMode="MultiLine" Rows="3" />
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

                            <asp:LinkButton CssClass="btn btn-primary" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton CssClass="btn btn-primary" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </fieldset>
                    </InsertItemTemplate>

                </asp:FormView>
                <asp:LinqDataSource ID="AddPatientDataSource"
                    runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="Patients">
                </asp:LinqDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

