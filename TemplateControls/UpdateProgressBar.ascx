<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UpdateProgressBar.ascx.cs" Inherits="TemplateControls_UpdateProgressBar" %>

<asp:UpdateProgress ID="CustomUpdateProgress" runat="server">
    <ProgressTemplate>
        <img src="/Assets/Default/images/ajax-loader.gif" />
    </ProgressTemplate>
</asp:UpdateProgress>