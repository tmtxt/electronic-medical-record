<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewHospitalDetails.aspx.cs" Inherits="AdminAccess_Hospitals_ViewHospitalDetails" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/RedirectSuccessAlert.ascx" TagPrefix="utmpl" TagName="RedirectSuccessAlert" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Hospital Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Hospital Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form id="Form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <utmpl:RedirectSuccessAlert runat="server" ID="RedirectSuccessAlert" />

                <asp:FormView ID="HospitalDetailsFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="HospitalDetailsDataSource"
                    OnItemDeleted="HospitalDetailsFormView_ItemDeleted"
                    OnItemDeleting="HospitalDetailsFormView_ItemDeleting"
                    OnItemUpdated="HospitalDetailsFormView_ItemUpdated"
                    OnItemUpdating="HospitalDetailsFormView_ItemUpdating">

                    <ItemTemplate>
                        <%-- Hospital name as title --%>
                        <h3><%# Eval("Name") %></h3>

                        <table style="width: 100%" class="table table-hover">
                            <tr>
                                <td><strong>Name</strong></td>
                                <td><%# Eval("Name") %></td>
                            </tr>
                            <tr>
                                <td><strong>License Number</strong></td>
                                <td><%# Eval("LicenseNumber") %></td>
                            </tr>
                            <tr>
                                <td><strong>Address</strong></td>
                                <td><%# Eval("Address") %></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <%
                                        if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
                                        {
                                    %>
                                    <asp:Button ID="DeleteButton" CommandName="Delete" runat="server"
                                        Text="Delete Hospital" CssClass="btn btn-danger"
                                        OnClientClick="return confirm('Are you sure you want to delete this Hospital?\n\nAll visits belong to this Hospital will be deleted, too!')" />
                                    <asp:Button ID="EditButton" runat="server" Text="Edit Hospital" CommandName="Edit"
                                        CssClass="btn btn-primary" />
                                    <%
                                        }
                                    %>
                                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-primary"
                                        NavigateUrl="/UserAccess/Hospitals/ViewAllHospitals.aspx">
                                        View All Hospitals</asp:HyperLink>
                                    
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
                                        Display="Dynamic" ErrorMessage="Hospital Name is required">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Address</strong></td>
                                <td>
                                    <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Text='<%# Bind("Address") %>'
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="AddressTextBox" CssClass="label label-important"
                                        Display="Dynamic" ErrorMessage="Hospital Address is required">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
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
                                        Text="Update Hospital"
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
                <asp:LinqDataSource ID="HospitalDetailsDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True"
                    EntityTypeName="" TableName="Hospitals" Where="ID == @ID" OnUpdating="HospitalDetailsDataSource_Updating">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <p></p>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
        <%
            if (System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
            {
        %>
        <asp:HyperLink ID="AddNewButton"
            CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign"
            runat="server" NavigateUrl="/AdminAccess/Hospitals/AddNewHospital.aspx">
                                        Add New Hospital
        </asp:HyperLink>
        <%
        }
        %>
        
    </form>
</asp:Content>

