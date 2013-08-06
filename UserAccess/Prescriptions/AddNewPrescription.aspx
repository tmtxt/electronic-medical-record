<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewPrescription.aspx.cs" Inherits="UserAccess_Prescriptions_AddNewPrescription" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Prescription
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add New Prescription
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:FormView ID="AddPrescriptionFormView" runat="server" DataKeyNames="ID" DataSourceID="AddPrescriptionDataSource" DefaultMode="Insert" OnItemInserted="AddPrescriptionFormView_ItemInserted" OnItemInserting="AddPrescriptionFormView_ItemInserting">

                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Prescription Information</legend>
                            <div class="form-group">
                                <label>Prescription Date</label>
                                <utmpl:DatePicker runat="server" ID="DatePicker"
                                    IsRequired="true"
                                    InitialDate='<%# new DataClassesDataContext().Visits.Where(v => v.ID == long.Parse(Request.QueryString["VisitID"])).Select(v => v.Date).First() %>' />
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label>Prescribed Doctor</label>
                                <asp:DropDownList ID="DoctorsDropdownList" runat="server"
                                    DataSourceID="DoctorsDataSource" DataTextField="Name"
                                    SelectedValue='<%# new DataClassesDataContext().Visits.Where(v => v.ID == long.Parse(Request.QueryString["VisitID"])).Select(v => v.DoctorID).First() %>'
                                    DataValueField="ID"></asp:DropDownList>
                                <asp:LinqDataSource ID="DoctorsDataSource" runat="server"
                                    ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                    OrderBy="Name" Select="new (ID, Name)" TableName="Doctors">
                                </asp:LinqDataSource>
                            </div>
                            <p></p>
                            <asp:Button ID="InsertButton" runat="server" Text="Add New Prescription"
                                CommandName="Insert" CssClass="btn btn-primary" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary" CausesValidation="False" OnClick="CancelButton_Click" />
                        </fieldset>
                        
                    </InsertItemTemplate>
                    

                </asp:FormView>
                <asp:LinqDataSource ID="AddPrescriptionDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName=""
                    TableName="Prescriptions" OnInserting="AddPrescriptionDataSource_Inserting">
                </asp:LinqDataSource>
                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

