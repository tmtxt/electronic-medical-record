<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPrescriptionInfo.aspx.cs" Inherits="UserAccess_Prescriptions_ViewPrescriptionDetail" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Prescription Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Prescription Information
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView ID="PrescriptionInfoFormView" runat="server" DataKeyNames="ID"
                    DataSourceID="PrescriptionInfoDataSource"
                    OnItemDeleted="PrescriptionDetailsFormView_ItemDeleted"
                    OnItemDeleting="PrescriptionDetailsFormView_ItemDeleting" OnItemUpdated="PrescriptionDetailsFormView_ItemUpdated">
                    <EditItemTemplate>
                        <fieldset>
                            <div class="form-group">
                                <strong>Prescribed Doctor</strong><br />
                                <asp:DropDownList ID="DoctorsDropdownList" runat="server"
                                    DataSourceID="DoctorsDataSource" DataTextField="Name"
                                    DataValueField="ID"
                                    SelectedValue='<%# Bind("DoctorID") %>'></asp:DropDownList>
                                <asp:LinqDataSource ID="DoctorsDataSource" runat="server"
                                    ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="Name"
                                    Select="new (ID, Name)" TableName="Doctors">
                                </asp:LinqDataSource>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    Display="Dynamic" CssClass="label label-important"
                                    ControlToValidate="DoctorsDropdownList"
                                    ErrorMessage="Prescribed Doctor is required"></asp:RequiredFieldValidator>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <strong>Prescribed Date</strong><br />
                                <utmpl:DatePicker runat="server" ID="DatePicker" IsRequired="true"
                                    InitialDate='<%# long.Parse(Eval("Date").ToString()) %>' />
                            </div>
                            <p></p>
                            <asp:Button ID="UpdateButton" runat="server" Text="Update"
                                CssClass="btn btn-primary" CommandName="Update" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel"
                                CssClass="btn btn-primary" CommandName="Cancel" CausesValidation="false" />
                        </fieldset>
                    </EditItemTemplate>
                    
                    <ItemTemplate>
                        <fieldset>
                            <div class="form-group">
                                <strong>Prescribed Doctor</strong>:<br />
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%# ((Doctor)Eval("Doctor")).Name %>'></asp:Label>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <strong>Prescribed Date</strong>:<br />
                                <asp:Label ID="Label2" runat="server"
                                    Text='<%# DateTime.FromBinary(long.Parse(Eval("Date").ToString())).ToLongDateString() %>'>
                                </asp:Label>
                            </div>
                            <p></p>
                            <asp:Button ID="EditButton" runat="server" Text="Edit"
                                CssClass="btn btn-primary" CommandName="Edit" />
                            <asp:Button ID="ViewVisitButton" runat="server" Text="View Visit"
                                CssClass="btn btn-primary" OnClick="ViewVisitButton_Click" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Delete"
                                CssClass="btn btn-danger" CommandName="Delete"
                                OnClientClick="return confirm('Are you sure you want to delete this Prescription?\n\nAll Prescription Details belong to this Prescription will be deleted, too!')" />
                        </fieldset>
                    </ItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="PrescriptionInfoDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Prescriptions" Where="ID == @ID" OnUpdating="PrescriptionInfoDataSource_Updating">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <p></p>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

