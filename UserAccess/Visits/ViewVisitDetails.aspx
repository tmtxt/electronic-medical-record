<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewVisitDetails.aspx.cs" Inherits="UserAccess_Visits_ViewVisitDetails" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Visit Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Visit Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:FormView Width="100%" ID="VisitDetailsFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="VisitDetailsDataSource" OnModeChanging="VisitDetailsFormView_ModeChanging" OnModeChanged="VisitDetailsFormView_ModeChanged" OnItemUpdating="VisitDetailsFormView_ItemUpdating" OnItemDeleted="VisitDetailsFormView_ItemDeleted" OnItemDeleting="VisitDetailsFormView_ItemDeleting" OnItemUpdated="VisitDetailsFormView_ItemUpdated">
                    <EmptyDataTemplate>
                        <strong>This Visit is not exist</strong>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <table class="table table-hover">
                            <tr>

                                <td>
                                    <strong>Patient</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server"
                                        Text='<%# ((Patient)Eval("Patient")).Name %>'>
                                    </asp:Label>
                                    <asp:HiddenField ID="PatientIDField" runat="server"
                                        Value='<%# ((Patient)Eval("Patient")).ID %>' />
                                </td>
                                <td>
                                    <strong>Date</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server"
                                        Text='<%# DateTime.FromBinary(long.Parse(Eval("Date").ToString())).ToLongDateString() %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Hospital</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server"
                                        Text='<%# ((Hospital)Eval("Hospital")).Name %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <strong>Doctor</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server"
                                        Text='<%# ((Doctor)Eval("Doctor")).Name %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Diagnosis</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server"
                                        Text='<%# ((ICD)Eval("ICD")).Code %>'>
                                    </asp:Label>
                                    &nbsp;-&nbsp;
                                    <asp:Label ID="Label5" runat="server"
                                        Text='<%# ((ICD)Eval("ICD")).Name %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <strong>Outcome</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server"
                                        Text='<%# Eval("Outcome") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete Visit"
                                        CssClass="btn btn-danger" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this Visit?\n\nAll Prescriptions, Prescription Details as well as Lab Orders, Lab Order Details belong to this visit will be deleted, too!')" />
                                    <asp:Button ID="EditButton" runat="server" Text="Edit Visit"
                                        CssClass="btn btn-primary" CommandName="Edit" />
                                    <asp:HyperLink ID="ViewVisitsButton" runat="server"
                                        CssClass="btn btn-primary"
                                        NavigateUrl='<%# Eval("PatientID","ViewVisitsFromPatient.aspx?PatientID={0}") %>'>
                                        View this Patient's Visits
                                    </asp:HyperLink>
                                    <asp:HyperLink runat="server" ID="ViewAllVisitsButton"
                                        CssClass="btn btn-primary"
                                        NavigateUrl="/UserAccess/Visits/ViewAllVisits.aspx">
                                        View All Visits
                                    </asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table class="table table-hover">
                            <tr>

                                <td>
                                    <strong>Patient</strong>
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server"
                                        Text='<%# ((Patient)Eval("Patient")).Name %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <strong>Date</strong>
                                </td>
                                <td>
                                    <utmpl:DatePicker runat="server" ID="DatePicker" IsRequired="true"
                                        InitialDate='<%# long.Parse(Eval("Date").ToString()) %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Hospital</strong>
                                </td>
                                <td>
                                    <asp:DropDownList ID="HospitalsDropdownList" runat="server"
                                        DataSourceID="HospitalsDataSource" DataTextField="Name"
                                        DataValueField="ID"
                                        SelectedValue='<%# Bind("HospitalID") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Hospital is required.&lt;br/&gt; If there is no Hospital, please add one first" ControlToValidate="HospitalsDropdownList" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:LinqDataSource ID="HospitalsDataSource" runat="server"
                                        ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                        OrderBy="Name" Select="new (ID, Name)" TableName="Hospitals">
                                    </asp:LinqDataSource>
                                </td>
                                <td>
                                    <strong>Doctor</strong>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DoctorsDropdownList" runat="server"
                                        DataSourceID="DoctorsDataSource" DataTextField="Name"
                                        DataValueField="ID"
                                        SelectedValue='<%# Bind("DoctorID") %>'>
                                    </asp:DropDownList><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Doctor is required.&lt;br/&gt; If there is no Doctor, please add one first" ControlToValidate="DoctorsDropdownList" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:LinqDataSource ID="DoctorsDataSource" runat="server"
                                        ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                        OrderBy="Name" Select="new (ID, Name)" TableName="Doctors">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Diagnosis</strong>
                                </td>
                                <td>
                                    <p>
                                        <label for="ICDChapterDropdownList">ICD Chapter</label>
                                        <asp:DropDownList ID="ICDChapterDropdownList" runat="server"
                                            DataSourceID="ICDChapterDataSource" DataTextField="Name"
                                            DataValueField="ID"
                                            SelectedValue='<%# ((ICD)Eval("ICD")).ICDChapter.ID %>'
                                            AutoPostBack="True"
                                            OnSelectedIndexChanged="ICDChapterDropdownList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:LinqDataSource ID="ICDChapterDataSource" runat="server"
                                            ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                            OrderBy="Name" Select="new (ID, Name)" TableName="ICDChapters">
                                        </asp:LinqDataSource>
                                    </p>
                                    <p>
                                        <label for="ICDDropdownList">ICD Code</label>
                                        <asp:DropDownList ID="ICDDropdownList" runat="server"
                                            DataSourceID="ICDDataSource" DataTextField="DisplayName"
                                            DataValueField="ID" OnDataBound="ICDDropdownList_DataBound">
                                        </asp:DropDownList><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ICD Code is required.&lt;br/&gt; If there is no ICD code, please add one." ControlToValidate="ICDDropdownList" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:LinqDataSource ID="ICDDataSource" runat="server"
                                            ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                            Select='new (ID, (Code + " - " + Name) as DisplayName, Code, ICDChapterID)'
                                            TableName="ICDs" OrderBy="Code" Where="ICDChapterID == @ICDChapterID">
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ICDChapterDropdownList"
                                                    Name="ICDChapterID" PropertyName="SelectedValue"
                                                    Type="Int64" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </p>
                                </td>
                                <td>
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
                                    <asp:Button ID="UpdateButton" runat="server" Text="Update Visit"
                                        CssClass="btn btn-primary" CommandName="Update" />
                                    <asp:Button ID="CancelButton" runat="server" Text="Cancel"
                                        CssClass="btn btn-primary" CommandName="Cancel" CausesValidation="False" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </asp:FormView>


                <asp:LinqDataSource ID="VisitDetailsDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Visits" Where="ID == @ID" OnUpdating="VisitDetailsDataSource_Updating">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>

                <asp:FormView Width="100%" ID="PrescriptionFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="PrescriptionDataSource">

                    <EditItemTemplate>
                        
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <h3>Prescription</h3>
                        <table class="table">
                            <tr>
                                <td>
                                    <strong>Date</strong>:&nbsp;&nbsp;
                                    <asp:Label ID="Label8" runat="server"
                                        Text='<%# DateTime.FromBinary((long)Eval("Date")).ToShortDateString() %>'></asp:Label>
                                </td>
                                <td>
                                    <strong>Prescribed Doctor</strong>:&nbsp;&nbsp;
                                    <asp:Label ID="Label9" runat="server"
                                        Text='<%# ((Doctor)Eval("Doctor")).Name %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>

                </asp:FormView>

                <asp:LinqDataSource ID="PrescriptionDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="Prescriptions"
                    Where="VisitID == @VisitID">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="VisitID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />

            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />

        <p></p>
        <asp:Button CausesValidation="false" ID="AddNewButton" CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            runat="server" Text="Add New Visit" OnClick="AddNewButton_Click" />
    </form>
</asp:Content>

