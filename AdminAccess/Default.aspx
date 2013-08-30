<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="AdminAccess_Default" %>

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
            <td>
                <a class="btn btn-primary" href="/UserAccess/Doctors/ViewAllDoctors.aspx">View Doctors</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/Doctors/AddNewDoctor.aspx">Add Doctor</a>
            </td>
        </tr>
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Hospitals/ViewAllHospitals.aspx">View Hospitals</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/Hospitals/AddNewHospital.aspx">Add Hospital</a>
            </td>
        </tr>
    </table>

    <h2>ICD</h2>

    <table class="table">
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/ICDs/ViewAllICDChapters.aspx">View ICD Chapter</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/ICDs/AddNewICDChapter.aspx">Add ICD Chapter</a>
            </td>
        </tr>
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/ICDs/ViewAllICD.aspx">View ICD</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/ICDs/AddNewICD.aspx">Add ICD</a>
            </td>
        </tr>
    </table>

    <h2>Drugs</h2>

    <table class="table">
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Drugs/ViewAllDrugGroups.aspx">View Drug Groups</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/Drugs/AddNewDrugGroup.aspx">Add Drug Group</a>
            </td>
        </tr>
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/Drugs/ViewAllDrugs.aspx">View Drugs</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/Drugs/AddNewDrug.aspx">Add Drug</a>
            </td>
        </tr>
    </table>

    <h2>Medical Services</h2>

    <table class="table">
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/MedicalServices/ViewAllMedicalServiceGroups.aspx">View Medical Service Groups</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/MedicalServices/AddNewMedicalServiceGroup.aspx">Add Medical Service Group</a>
            </td>
        </tr>
        <tr>
            <td>
                <a class="btn btn-primary" href="/UserAccess/MedicalServices/ViewAllMedicalServices.aspx">View Medical Services</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/MedicalServices/AddNewMedicalService.aspx">Add Medical Service</a>
            </td>
        </tr>
    </table>

    <h2>Users</h2>

    <table class="table">
        <tr>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/Users/ViewAllUsers.aspx">View Users</a>
            </td>
            <td>
                <a class="btn btn-primary" href="/AdminAccess/Users/AddNewUser.aspx">Add User</a>
            </td>
        </tr>
    </table>
</asp:Content>

