<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAllVisits.aspx.cs" Inherits="UserAccess_Visits_ViewAllVisits" %>

<%@ Register Src="~/TemplateControls/UpdateProgressBar.ascx" TagPrefix="utmpl" TagName="UpdateProgressBar" %>
<%@ Register Src="~/TemplateControls/ResultAlert.ascx" TagPrefix="utmpl" TagName="ResultAlert" %>
<%@ Register Src="~/TemplateControls/DatePicker.ascx" TagPrefix="utmpl" TagName="DatePicker" %>
<%@ Register Src="~/TemplateControls/RangeDatePicker.ascx" TagPrefix="utmpl" TagName="RangeDatePicker" %>





<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Visits List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    Visits List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="control-group">
                    <p>
                        <strong>Filter</strong>
                        <utmpl:RangeDatePicker runat="server" ID="RangeDatePicker" />
                    </p>

                    <p>
                        <strong>Filter</strong>
                        <asp:TextBox ID="FindPatientNameTextBox" runat="server"
                            placeholder="Patient Name"></asp:TextBox>
                        <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="FindPatientNameTextBox"
                            runat="server" ServiceMethod="GetPatientNamesCompletionList" UseContextKey="True">
                        </asp:AutoCompleteExtender>
                        <asp:TextBox ID="FindDoctorNameTextBox" runat="server"
                            placeholder="Doctor Name"></asp:TextBox>
                        <asp:AutoCompleteExtender ID="AutoCompleteExtender2" TargetControlID="FindDoctorNameTextBox"
                            runat="server" ServiceMethod="GetDoctorNamesCompletionList" UseContextKey="True">
                        </asp:AutoCompleteExtender>
                    </p>
                    <p>
                        <strong>Filter</strong>
                        <asp:TextBox ID="FindHospitalNameTextBox" runat="server"
                            placeholder="Hospital Name"></asp:TextBox>
                        <asp:AutoCompleteExtender ID="AutoCompleteExtender3" TargetControlID="FindHospitalNameTextBox"
                            runat="server" ServiceMethod="GetHospitalNamesCompletionList" UseContextKey="True">
                        </asp:AutoCompleteExtender>
                        <asp:Button ID="FindPatientButton" CssClass="btn btn-primary" runat="server"
                            Text="Search" OnClick="FindPatientButton_Click" />
                        <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-primary"
                             Text="Cancel" OnClick="CancelButton_Click" />
                    </p>
                    


                </div>

                <asp:GridView ID="AllVisitsGridView" runat="server" DataSourceID="AllVisitsDataSource"
                    DataKeyNames="ID" AllowPaging="true" AutoGenerateColumns="false" AllowSorting="true"
                    PageSize="10" CssClass="gridview table table-bordered table-striped table-hover">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%# DateTime.FromBinary((long)Eval("Date")).ToShortDateString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Patient">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%# ((Patient)Eval("Patient")).Name %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Doctor">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%# ((Doctor)Eval("Doctor")).Name %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hospital">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%# ((Hospital)Eval("Hospital")).Name %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField HeaderText="Details"
                            DataNavigateUrlFormatString="ViewVisitDetails.aspx?ID={0}"
                            DataNavigateUrlFields="ID" Text="Details">
                            <ControlStyle CssClass="btn btn-primary btn-small" />
                        </asp:HyperLinkField>
                    </Columns>
                </asp:GridView>

                <asp:ObjectDataSource ID="AllVisitsDataSource" runat="server" SelectMethod="GetAllVisits"
                    EnablePaging="true" TypeName="VisitsData" MaximumRowsParameterName="pageSize"
                    StartRowIndexParameterName="startIndex" SortParameterName="sortBy"
                    SelectCountMethod="GetTotalVisitsCount"></asp:ObjectDataSource>

                <utmpl:ResultAlert runat="server" ID="ResultAlert" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <utmpl:UpdateProgressBar runat="server" ID="UpdateProgressBar" />
    </form>
</asp:Content>
