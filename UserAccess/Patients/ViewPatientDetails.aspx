<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPatientDetails.aspx.cs" Inherits="UserAccess_Patients_ViewPatientDetails" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Patient Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Patient Detail
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <%--<asp:ScriptManager ID="PatientDetailScriptManager" runat="server"></asp:ScriptManager>--%>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="PatientDetailUpdatePanel" runat="server">
        
            <ContentTemplate>
                <asp:FormView DataKeyNames="ID" ID="PatientDetailFormView" runat="server" DataSourceID="PatientDetailDataSource" OnItemDeleted="PatientDetailFormView_ItemDeleted" OnItemDeleting="PatientDetailFormView_ItemDeleting" OnItemUpdated="PatientDetailFormView_ItemUpdated" OnModeChanged="PatientDetailFormView_ModeChanged">
                    <ItemTemplate>
                        <%-- patient name as title --%>
                        <h3><%# Eval("Name") %></h3>
                        <table style="width: 100%" class="table table-hover">
                            <tr>
                                <td><strong>Name</strong></td>
                                <td><%# Eval("Name") %></td>
                                <td colspan="2" rowspan="2">
                                    <p><strong>Address</strong></p>
                                    <p><%# Eval("Address") %></p>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Gender</strong></td>
                                <td><%# Eval("Gender") %></td>
                            </tr>
                            <tr>
                                <td><strong>Birthdate</strong></td>
                                <td><%# DateTime.FromBinary(long.Parse(Eval("DateOfBirth").ToString())).ToLongDateString() %></td>
                                <td><strong>Number of visits</strong></td>
                                <td>number</td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="DeleteButton" CommandName="Delete" runat="server" Text="Delete Patient"
                                        CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete this patient?\nAll visits belong to this patient will be deleted, too!')" />
                                    <asp:Button ID="EditButton" runat="server" Text="Edit Patient" CommandName="Edit"
                                        CssClass="btn btn-primary" />
                                    <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary" runat="server" NavigateUrl="/UserAccess/Patients/AddNewPatient.aspx">
                                        View Patient's Visits
                                    </asp:HyperLink>
                                </td>
                            </tr>
                        </table>

                    </ItemTemplate>
                    <EditItemTemplate>

                        <h3><%# Eval("Name") %></h3>
                        <table style="width: 100%" class="table table-hover">
                            <tr>
                                <td><strong>Name</strong></td>
                                <td>
                                    <asp:TextBox ID="NameTextBox" Text='<%# Bind("Name") %>' runat="server"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Patient Name is required"></asp:RequiredFieldValidator>
                                </td>
                                <td colspan="2" rowspan="2">
                                    <p><strong>Address</strong></p>
                                    <p>
                                        <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Text='<%# Bind("Address") %>' runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AddressTextBox" CssClass="label label-important" Display="Dynamic" ErrorMessage="Patient Address is required"></asp:RequiredFieldValidator>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Gender</strong></td>
                                <td>
                                    <asp:DropDownList SelectedValue='<%# Bind("Gender") %>' ID="GenderDropdownList" runat="server">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        <asp:ListItem>Gay</asp:ListItem>
                                        <asp:ListItem>Les</asp:ListItem>
                                        <asp:ListItem>Bi</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td><strong>Birthdate</strong></td>
                                <td>
                                    <%--<asp:TextBox Text='<%# DateTime.FromBinary(long.Parse(Eval("DateOfBirth").ToString())).ToString("dd/MMM/yyyy") %>' ID="DateOfBirthTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="DateOfBirthCalendarExtender" TargetControlID="DateOfBirthTextBox" Format="dd/MMM/yyyy" runat="server" >
                                    </asp:CalendarExtender>--%>
                                    <utmpl:DatePicker IsRequired="true" InitialDate='<%# long.Parse(Eval("DateOfBirth").ToString()) %>' runat="server" ID="DateOfBirthDatePicker" />
                                </td>
                                <td><strong>Number of visits</strong></td>
                                <td>number</td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="UpdateButton" CommandName="Update" runat="server" Text="Update Patient"
                                        CssClass="btn btn-primary" />
                                    <asp:Button ID="ClearButton" runat="server" Text="Clear Form"
                                        CssClass="btn btn-primary" CausesValidation="False" OnClick="ClearButton_Click" />
                                    <asp:Button ID="CancelButton" runat="server" Text="Cancel Editting" CommandName="Cancel"
                                        CssClass="btn btn-primary" CausesValidation="False" />
                                </td>
                            </tr>
                        </table>

                    </EditItemTemplate>
                </asp:FormView>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <p></p>


            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <asp:LinqDataSource
            ID="PatientDetailDataSource"
            runat="server"
            ContextTypeName="DataClassesDataContext"
            EnableDelete="True"
            EnableUpdate="True"
            EntityTypeName=""
            TableName="Patients"
            Where="ID == @ID" OnUpdating="PatientDetailDataSource_Updating" OnSelected="PatientDetailDataSource_Selected">
            <WhereParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:HyperLink ID="AddNewButton" CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign" runat="server" NavigateUrl="/UserAccess/Patients/AddNewPatient.aspx">
                                        Add New Patient
        </asp:HyperLink>
    </form>
</asp:Content>

