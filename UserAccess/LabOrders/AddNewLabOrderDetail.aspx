<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewLabOrderDetail.aspx.cs" Inherits="UserAccess_LabOrders_AddNewLabOrderDetail" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Lab Order Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    Add Lab Order Detail
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:FormView Width="100%" ID="AddLabOrderDetailFormView" runat="server" DataKeyNames="ID" DataSourceID="AddlabOrderDetailDataSource" DefaultMode="Insert">
                    <InsertItemTemplate>
                        <fieldset>
                            <legend>Enter Lab Order Detail Information</legend>
                            <div class="form-group">
                                <label>Medical Service Group</label>
                                <asp:DropDownList ID="MedicalServiceGroupsDropdownList" Width="70%" runat="server"
                                    DataSourceID="MedicalServiceGroupsDataSource" DataTextField="Name"
                                    DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:LinqDataSource ID="MedicalServiceGroupsDataSource" runat="server"
                                    ContextTypeName="DataClassesDataContext" EntityTypeName="" OrderBy="Name"
                                    Select="new (ID, Name)" TableName="MedicalServiceGroups">
                                </asp:LinqDataSource>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label>Medical Service</label>
                                <asp:DropDownList ID="MedicalServicesDropdownList" Width="70%" runat="server"
                                    DataSourceID="MedicalServicesDataSource" DataTextField="Name"
                                    DataValueField="ID"></asp:DropDownList>
                                <asp:LinqDataSource ID="MedicalServicesDataSource" runat="server"
                                    ContextTypeName="DataClassesDataContext" EntityTypeName=""
                                    OrderBy="Name" Select="new (ID, Name)" TableName="MedicalServices"
                                    Where="MedicalServiceGroupID = @MedicalServiceGroupID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="MedicalServiceGroupsDropdownList"
                                            Name="MedicalServiceGroupID" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label>Result</label>
                                <asp:TextBox ID="ResultTextBox" Width="70%" runat="server" placeholder="Result"></asp:TextBox>
                            </div>
                            <p></p>
                            <asp:Button ID="InsertButton" runat="server" Text="Add Lab Order Detail"
                                CssClass="btn btn-primary" CommandName="Insert" />
                            <asp:Button ID="ClearForm" runat="server" Text="ClearForm"
                                CssClass="btn btn-primary" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel"
                                CssClass="btn btn-primary" />
                        </fieldset>
                    </InsertItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="AddlabOrderDetailDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EnableInsert="True" EntityTypeName=""
                    TableName="LabOrderDetails">
                </asp:LinqDataSource>

                <p></p>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <p></p>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>

