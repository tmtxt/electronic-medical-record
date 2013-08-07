<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewLabOrder.aspx.cs" Inherits="UserAccess_LabOrders_AddNewLabOrder" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add Lab Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Add Lab Order
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView ID="AddLabOrderFormView" runat="server" DataKeyNames="ID" DataSourceID="AddLabOrderDataSource" DefaultMode="Insert">

                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Lab Order Information</legend>
                            <div class="form-group">
                                <label for="DatePicker">Order Date</label>
                                <utmpl:DatePicker runat="server" IsRequired="true" ID="DatePicker"
                                    InitialDate='<%# new DataClassesDataContext().Visits.Where(v => v.ID == long.Parse(Request.QueryString["VisitID"])).Select(v => v.Date).First() %>' />
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="DoctorsDropdownList">Order Doctor</label>
                                <asp:DropDownList ID="DoctorsDropdownList" runat="server"
                                    DataSourceID="DoctorsDataSource" DataTextField="Name"
                                    SelectedValue='<%# new DataClassesDataContext().Visits.Where(v => v.ID == long.Parse(Request.QueryString["VisitID"])).Select(v => v.DoctorID).First() %>'
                                    DataValueField="ID"></asp:DropDownList>
                                <asp:LinqDataSource ID="DoctorsDataSource" runat="server"
                                    ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="Name"
                                    Select="new (ID, Name)" TableName="Doctors">
                                </asp:LinqDataSource>
                            </div>
                            <p></p>
                            <asp:Button ID="InsertButton" runat="server" Text="Add New Lab Order"
                                CommandName="Insert" CssClass="btn btn-primary" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                CausesValidation="False" />
                            <p></p>
                        </fieldset>
                    </InsertItemTemplate>

                </asp:FormView>

                <asp:LinqDataSource ID="AddLabOrderDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName="" TableName="LabOrders">
                </asp:LinqDataSource>

                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

