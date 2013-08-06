<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewVisit.aspx.cs" Inherits="UserAccess_Visits_AddNewVisit" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add Visit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Add New Visit
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView Width="100%" ID="AddVisitFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="AddVisitDataSource" DefaultMode="Insert" OnItemInserted="AddVisitFormView_ItemInserted">

                    <InsertItemTemplate>
                        <table class="table table-hover">
                            <tr>
                                <td>
                                    <strong>Patient</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server"
                                        Text='<%# (new DataClassesDataContext().Patients).Where(p => p.ID == long.Parse(Request.QueryString["PatientID"])).Select(p => p.Name).First().ToString() %>'></asp:Label>
                                    <asp:HiddenField ID="PatientIDField" runat="server"
                                        Value='<%# Request.QueryString["PatientID"] %>' />
                                </td>
                                <td>
                                    <p></p>
                                    <strong>Date</strong>
                                </td>
                                <td>
                                    <utmpl:DatePicker runat="server" ID="DatePicker"
                                        IsRequired="true" InitialDate='<%# DateTime.Now.Ticks %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p></p>
                                    <strong>Hospital</strong>
                                </td>
                                <td>
                                    <asp:DropDownList ID="HospitalsDropdownList" runat="server"
                                        DataSourceID="HospitalsDataSource" DataTextField="Name"
                                        DataValueField="ID" SelectedValue='<%# Bind("HospitalID") %>'>
                                    </asp:DropDownList>
                                    <asp:LinqDataSource ID="HospitalsDataSource" runat="server"
                                        ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                        OrderBy="Name" Select="new (ID, Name)" TableName="Hospitals">
                                    </asp:LinqDataSource>
                                </td>
                                <td>
                                    <p></p>
                                    <strong>Doctor</strong>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DoctorsDropdownList" runat="server"
                                        DataSourceID="DoctorsDataSource" DataTextField="Name"
                                        DataValueField="ID" SelectedValue='<%# Bind("DoctorID") %>'>
                                    </asp:DropDownList>
                                    <asp:LinqDataSource ID="DoctorsDataSource" runat="server"
                                        ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                        OrderBy="Name" Select="new (ID, Name)" TableName="Doctors">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p></p>
                                    <strong>Diagnosis</strong>
                                </td>
                                <td>
                                    <p>
                                        <asp:DropDownList ID="ICDChapterDropdownList" runat="server"
                                            DataSourceID="ICDChaptersDataSource" DataTextField="Name"
                                            DataValueField="ID"
                                            OnSelectedIndexChanged="ICDChapterDropdownList_SelectedIndexChanged"
                                            AutoPostBack="True"></asp:DropDownList>
                                        <asp:LinqDataSource ID="ICDChaptersDataSource" runat="server"
                                            ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                            OrderBy="Name" Select="new (ID, Name)" TableName="ICDChapters">
                                        </asp:LinqDataSource>
                                    </p>
                                    <p>
                                        <asp:DropDownList ID="ICDDropdownList" runat="server"
                                            DataSourceID="ICDDataSource" DataTextField="DisplayName"
                                            DataValueField="ID"></asp:DropDownList>
                                        <asp:LinqDataSource ID="ICDDataSource" runat="server"
                                            ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                            OrderBy="Code" Select='new (ID, Code, (Code + " - " + Name) as DisplayName)'
                                            TableName="ICDs" Where="ICDChapterID == @ICDChapterID">
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ICDChapterDropdownList"
                                                    Name="ICDChapterID" PropertyName="SelectedValue"
                                                    Type="Int64" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </p>
                                </td>
                                <td>
                                    <p></p>
                                    <strong>Outcome</strong>
                                </td>
                                <td>
                                    <asp:DropDownList ID="OutcomeDropdownList" runat="server"
                                        SelectedValue='<%# Bind("Outcome") %>'>
                                        <asp:ListItem>Increased</asp:ListItem>
                                        <asp:ListItem>Decreased</asp:ListItem>
                                        <asp:ListItem>Unchanged</asp:ListItem>
                                        <asp:ListItem>Cured</asp:ListItem>
                                        <asp:ListItem>Dead</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="InsertButton" runat="server" Text="Add New Visit"
                                        CssClass="btn btn-primary" CommandName="Insert" />
                                    <asp:Button ID="ClearButton" runat="server" Text="Clear"
                                        CssClass="btn btn-primary" />
                                    <asp:HyperLink ID="CancelButton" runat="server" CssClass="btn btn-primary">
                                        Cancel</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>

                </asp:FormView>

                <asp:LinqDataSource ID="AddVisitDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName=""
                    TableName="Visits" OnInserting="AddVisitDataSource_Inserting">
                    
                </asp:LinqDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

