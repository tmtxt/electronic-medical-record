<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPrescriptionInfo.aspx.cs" Inherits="UserAccess_Prescriptions_ViewPrescriptionDetail" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Prescription Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Prescription Info 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView ID="PrescriptionDetailsFormView" runat="server" DataKeyNames="ID" DataSourceID="PrescriptionInfoDataSource">
                    <EditItemTemplate>
                        ID:
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                        <br />
                        Date:
                        <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                        <br />
                        DoctorID:
                        <asp:TextBox ID="DoctorIDTextBox" runat="server" Text='<%# Bind("DoctorID") %>' />
                        <br />
                        VisitID:
                        <asp:TextBox ID="VisitIDTextBox" runat="server" Text='<%# Bind("VisitID") %>' />
                        <br />
                        PrescriptionDetails:
                        <asp:TextBox ID="PrescriptionDetailsTextBox" runat="server" Text='<%# Bind("PrescriptionDetails") %>' />
                        <br />
                        Visit:
                        <asp:TextBox ID="VisitTextBox" runat="server" Text='<%# Bind("Visit") %>' />
                        <br />
                        Doctor:
                        <asp:TextBox ID="DoctorTextBox" runat="server" Text='<%# Bind("Doctor") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Date:
                        <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                        <br />
                        DoctorID:
                        <asp:TextBox ID="DoctorIDTextBox" runat="server" Text='<%# Bind("DoctorID") %>' />
                        <br />
                        VisitID:
                        <asp:TextBox ID="VisitIDTextBox" runat="server" Text='<%# Bind("VisitID") %>' />
                        <br />
                        PrescriptionDetails:
                        <asp:TextBox ID="PrescriptionDetailsTextBox" runat="server" Text='<%# Bind("PrescriptionDetails") %>' />
                        <br />
                        Visit:
                        <asp:TextBox ID="VisitTextBox" runat="server" Text='<%# Bind("Visit") %>' />
                        <br />
                        Doctor:
                        <asp:TextBox ID="DoctorTextBox" runat="server" Text='<%# Bind("Doctor") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ID:
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        <br />
                        Date:
                        <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date") %>' />
                        <br />
                        DoctorID:
                        <asp:Label ID="DoctorIDLabel" runat="server" Text='<%# Bind("DoctorID") %>' />
                        <br />
                        VisitID:
                        <asp:Label ID="VisitIDLabel" runat="server" Text='<%# Bind("VisitID") %>' />
                        <br />
                        PrescriptionDetails:
                        <asp:Label ID="PrescriptionDetailsLabel" runat="server" Text='<%# Bind("PrescriptionDetails") %>' />
                        <br />
                        Visit:
                        <asp:Label ID="VisitLabel" runat="server" Text='<%# Bind("Visit") %>' />
                        <br />
                        Doctor:
                        <asp:Label ID="DoctorLabel" runat="server" Text='<%# Bind("Doctor") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="PrescriptionInfoDataSource" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Prescriptions" Where="ID == @ID">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <p></p>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

