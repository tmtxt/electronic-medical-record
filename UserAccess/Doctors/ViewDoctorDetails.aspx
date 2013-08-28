<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewDoctorDetails.aspx.cs" Inherits="UserAccess_Doctors_ViewDoctorsDetails" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/RedirectSuccessAlert.ascx" TagPrefix="utmpl" TagName="RedirectSuccessAlert" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Doctor Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Doctor Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <utmpl:RedirectSuccessAlert runat="server" ID="RedirectSuccessAlert" />

                <asp:FormView ID="DoctorDetailsFormView" runat="server" DataKeyNames="ID" DataSourceID="DoctorDetailsDataSource" OnItemDeleted="DoctorDetailsFormView_ItemDeleted" OnItemDeleting="DoctorDetailsFormView_ItemDeleting" OnItemUpdated="DoctorDetailsFormView_ItemUpdated" OnItemUpdating="DoctorDetailsFormView_ItemUpdating">

                    <ItemTemplate>
                        <%-- doctor name as title --%>
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
                                <td><strong>License Number</strong></td>
                                <td>
                                    <asp:Label ID="Label1" runat="server"
                                        Text='<%# Eval("LicenseNumber") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="DeleteButton" CommandName="Delete" runat="server" Text="Delete Doctor"
                                        CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete this doctor?\nAll visits belong to this doctor will be deleted, too!')" />
                                    <asp:Button ID="EditButton" runat="server" Text="Edit Doctor" CommandName="Edit"
                                        CssClass="btn btn-primary" />
                                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-primary"
                                        NavigateUrl="/UserAccess/Doctors/ViewAllDoctors.aspx">
                                        View All Doctor</asp:HyperLink>
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
                                    <asp:TextBox ID="NameTextBox" Text='<%# Bind("Name") %>' runat="server">
                                    </asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="NameTextBox" CssClass="label label-important"
                                        Display="Dynamic" ErrorMessage="Doctor Name is required">
                                    </asp:RequiredFieldValidator>
                                </td>
                                <td colspan="2" rowspan="2">
                                    <p><strong>Address</strong></p>
                                    <p>
                                        <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Text='<%# Bind("Address") %>'
                                            runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ControlToValidate="AddressTextBox" CssClass="label label-important"
                                            Display="Dynamic" ErrorMessage="Doctor Address is required">
                                        </asp:RequiredFieldValidator>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Gender</strong></td>
                                <td>
                                    <asp:DropDownList SelectedValue='<%# Bind("Gender") %>' ID="GenderDropdownList"
                                        runat="server">
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
                                    <utmpl:DatePicker IsRequired="true"
                                        InitialDate='<%# long.Parse(Eval("DateOfBirth").ToString()) %>'
                                        runat="server" ID="DateOfBirthDatePicker" />
                                </td>
                                <td><strong>License Number</strong></td>
                                <td>
                                    <asp:TextBox ID="LicenseTextBox" Text='<%# Bind("LicenseNumber") %>' runat="server">
                                    </asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="LicenseTextBox" CssClass="label label-important"
                                        Display="Dynamic" ErrorMessage="License Number is required">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="UpdateButton" CommandName="Update" runat="server"
                                        Text="Update Doctor"
                                        CssClass="btn btn-primary" />
                                    <asp:Button ID="ClearButton" runat="server" Text="Clear Form"
                                        CssClass="btn btn-primary" CausesValidation="False" OnClick="ClearButton_Click" />
                                    <asp:Button ID="CancelButton" runat="server" Text="Cancel Editting"
                                        CommandName="Cancel"
                                        CssClass="btn btn-primary" CausesValidation="False" />
                                </td>
                            </tr>
                        </table>

                    </EditItemTemplate>

                </asp:FormView>
                <asp:LinqDataSource ID="DoctorDetailsDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Doctors" Where="ID == @ID" OnUpdating="DoctorDetailsDataSource_Updating">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <p></p>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <asp:HyperLink ID="AddNewButton"
            CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            runat="server" NavigateUrl="/UserAccess/Doctors/AddNewDoctor.aspx">
                                        Add New Doctor
        </asp:HyperLink>
    </form>
</asp:Content>

