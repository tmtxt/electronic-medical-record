<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/TemplateControls/BannerImage.ascx" TagPrefix="utmpl" TagName="BannerImage" %>





<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="Server">
    Electronic Medical Record
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <utmpl:BannerImage runat="server" ID="BannerImage" />

    <h2>Patients and Visits</h2>

    <table class="table">
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Patients/ViewAllPatients.aspx">View Patients</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Patients/AddNewPatient.aspx">Add Patient</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Visits/ViewAllVisits.aspx">View Visits</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Visits/AddNewVisit.aspx">Add Visit</a>
            </td>
        </tr>
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Prescriptions/AddNewPrescription.aspx">Add Prescription</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Prescriptions/AddNewPrescriptionDetail.aspx">Add Prescription Detail</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/UserAccess/LabOrders/AddNewLabOrder.aspx">Add Lab Order</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/UserAccess/LabOrders/AddNewLabOrderDetail.aspx">Add Lab Order Detail</a>
            </td>
        </tr>
    </table>

    <h2>Doctors and Hospitals</h2>

    <table class="table">
        <tr>
            <td style="width:50%">
                <a class="btn btn-primary" href="/UserAccess/Doctors/ViewAllDoctors.aspx">View Doctors</a>
            </td>
            <td style="width:50%">
                <a class="btn btn-primary" href="/UserAccess/Hospitals/ViewAllHospitals.aspx">View Hospitals</a>
            </td>
        </tr>
    </table>

    <h2>ICD</h2>

    <table class="table">
        <tr>
            <td style="width:50%">
                <a class="btn btn-primary" href="/UserAccess/ICDs/ViewAllICDChapters.aspx">View ICD Chapter</a>
            </td>
            <td style="width:50%">
                <a class="btn btn-primary" href="/UserAccess/ICDs/ViewAllICD.aspx">View ICD</a>
            </td>
        </tr>
    </table>

    <h2>Drugs</h2>

    <table class="table">
        <tr>
            <td style="width:50%">
                <a class="btn btn-primary" href="/UserAccess/Drugs/ViewAllDrugGroups.aspx">View Drug Groups</a>
            </td>
            <td style="width:50%">
                <a class="btn btn-primary" href="/UserAccess/Drugs/ViewAllDrugs.aspx">View Drugs</a>
            </td>
        </tr>
    </table>

    <h2>Medical Services</h2>

    <table class="table">
        <tr>
            <td style="width:50%">
                <a class="btn btn-primary" href="/UserAccess/MedicalServices/ViewAllMedicalServiceGroups.aspx">View Medical Service Groups</a>
            </td>
            <td style="width:50%">
                <a class="btn btn-primary" href="/UserAccess/MedicalServices/ViewAllMedicalServices.aspx">View Medical Services</a>
            </td>
        </tr>
    </table>
</asp:Content>

