<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllMedicalServiceGroups.aspx.cs" Inherits="UserAccess_MedicalServices_ViewAllMedicalServiceGroups" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Medical Service Groups
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
    All Medical Service Groups
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="control-group">
                    <asp:Label CssClass="label_filter" ID="Label3" runat="server" Text="Filter Medical Service Groups by Name"></asp:Label>
                    <asp:TextBox ID="FindMedicalServiceGroupTextBox" runat="server"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindMedicalServiceGroupTextBox"
                        runat="server" UseContextKey="True" ServiceMethod="GetCompletionList">
                    </asp:AutoCompleteExtender>

                    <asp:Button ID="FindMedicalServiceGroupButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="FindMedicalServiceGroupButton_Click"/>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Cancel" OnClick="Button1_Click" />
                </div>

                <asp:GridView ID="AllMedicalServiceGroupsGridView"  CssClass="table table-bordered table-striped table-hover"
                    runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                    DataSourceID="AllMedicalServiceGroupsDataSource" OnRowDeleted="AllMedicalServiceGroupsGridView_RowDeleted" OnRowUpdated="AllMedicalServiceGroupsGridView_RowUpdated">
                    <Columns>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name"
                             HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%">
                            <EditItemTemplate>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Medical Service Group Name is required" ControlToValidate="NameTextBox" CssClass="label label-important" Display="Dynamic"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Width="40%" />
                            <HeaderStyle Width="40%" />
                            <ItemStyle Width="40%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description"
                             HeaderStyle-Width="40%" FooterStyle-Width="40%" ItemStyle-Width="40%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'
                                    TextMode="MultiLine" Rows="6"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Width="40%" />
                            <HeaderStyle Width="40%" />
                            <ItemStyle Width="40%" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="UpdateButton" CssClass="btn btn-primary" runat="server"
                                    Text="Update" CommandName="Update" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="EditButton" CssClass="btn btn-primary" runat="server"
                                    Text="Edit" CommandName="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="CancelButton" CssClass="btn btn-primary" runat="server"
                                    Text="Cancel" CommandName="Cancel" CausesValidation="False" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="DeleteButton" CssClass="btn btn-danger" runat="server"
                                    Text="Delete" CommandName="Delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this Medical Service Group?\nAll Medical Services belong to this group as well as Lab Order Detail associated with those Medical Services will be deleted, too.')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
                <asp:LinqDataSource ID="AllMedicalServiceGroupsDataSource" runat="server"
                    ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableUpdate="True"
                    EntityTypeName="" TableName="MedicalServiceGroups"
                    Where="Name.Contains(@NamePart)">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="FindMedicalServiceGroupTextBox"
                            ConvertEmptyStringToNull="False" Name="NamePart" PropertyName="Text" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-large btn-primary glyphicon glyphicon-plus-sign" NavigateUrl="/UserAccess/MedicalServices/AddNewMedicalServiceGroup.aspx">Add New Medical Service Group</asp:HyperLink>
</asp:Content>

