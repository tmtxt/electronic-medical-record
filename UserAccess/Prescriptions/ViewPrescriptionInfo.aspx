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
    <form runat="server" class="form-horizontal">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView ID="PrescriptionDetailsFormView" runat="server" DataKeyNames="ID" DataSourceID="PrescriptionInfoDataSource" OnItemDeleted="PrescriptionDetailsFormView_ItemDeleted" OnItemDeleting="PrescriptionDetailsFormView_ItemDeleting">
                    <EditItemTemplate>
                        
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
                                OnClientClick="return confirm('Are you sure you want to delete this Prescription?\n\nAll Prescription Details belong to this Prescription wiil be deleted, too!')" />
                        </fieldset>
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

