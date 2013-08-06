<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RangeDatePicker.ascx.cs" Inherits="TemplateControls_RangeDatePicker" %>

<asp:TextBox ID="StartDateTextBox" placeholder="Start Date" runat="server"></asp:TextBox>
<asp:CalendarExtender ID="StartDateCalendarExtender" TargetControlID="StartDateTextBox"
    Format="dd/MMM/yyyy" runat="server">
</asp:CalendarExtender>

<asp:TextBox ID="EndDateTextBox" placeholder="End Date" runat="server"></asp:TextBox>
<asp:CalendarExtender ID="EndDateCalendarExtender" TargetControlID="EndDateTextBox"
    Format="dd/MMM/yyyy" runat="server">
</asp:CalendarExtender>