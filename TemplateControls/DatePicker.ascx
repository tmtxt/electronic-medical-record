<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatePicker.ascx.cs" Inherits="TemplateControls_DatePicker" %>

<asp:TextBox Text='<%# DateTime.FromBinary(InitialDate).ToString("dd/MMM/yyyy") %>' ID="DateOfBirthTextBox" CssClass="form-control" runat="server"></asp:TextBox>
<asp:CalendarExtender ID="DateOfBirthCalendarExtender" TargetControlID="DateOfBirthTextBox" Format="dd/MMM/yyyy" runat="server">
</asp:CalendarExtender>