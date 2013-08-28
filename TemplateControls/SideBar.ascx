<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SideBar.ascx.cs" Inherits="Template_SideBar" %>


<div class="well" style="padding: 8px 0;">
    <ul class="nav nav-list" id="sidebar-nav">
        <li class="nav-header">Home</li>
        <li><a href="/UserAccess/Default.aspx">Home</a></li>

        <li class="nav-header">Patients</li>
        <li><a href="/UserAccess/Patients/ViewAllPatients.aspx">View Patients</a></li>
        <li class="hide-accordingly"><a href="/UserAccess/Patients/ViewPatientDetails.aspx">Patient Details</a></li>
        <li><a href="/UserAccess/Patients/AddNewPatient.aspx">Add New Patient</a></li>

        <li class="nav-header">Doctors</li>
        <li><a href="/UserAccess/Doctors/ViewAllDoctors.aspx">View Doctors</a></li>
        <li class="hide-accordingly"><a href="/UserAccess/Doctors/ViewDoctorDetails.aspx">Doctor Details</a></li>
        <li><a href="/UserAccess/Doctors/AddNewDoctor.aspx">Add New Doctor</a></li>

        <li class="nav-header">Visits</li>
        <li><a href="/UserAccess/Visits/ViewAllVisits.aspx">View All Visits</a></li>
        <li><a href="/UserAccess/Visits/ViewVisitsFromPatient.aspx">Visits from Patient</a></li>
        <li class="hide-accordingly"><a href="/UserAccess/Visits/ViewVisitDetails.aspx">Visit Details</a></li>
        <li><a href="/UserAccess/Visits/AddNewVisit.aspx">Add New Visit</a></li>

        <li class="nav-header">Prescriptions</li>
        <li><a href="/UserAccess/Prescriptions/ViewPrescriptionInfo.aspx">Prescription Info</a></li>
        <li><a href="/UserAccess/Prescriptions/ViewPrescriptionDetailInfo.aspx">Prescription Details Info</a></li>
        <li><a href="/UserAccess/Prescriptions/AddNewPrescription.aspx">Add Prescription</a></li>
        <li><a href="/UserAccess/Prescriptions/AddNewPrescriptionDetail.aspx">Add Prescription Details</a></li>

        <li class="nav-header">Lab Orders</li>
        <li><a href="/UserAccess/LabOrders/ViewLabOrderInfo.aspx">Lab Order Info</a></li>
        <li><a href="/UserAccess/LabOrders/ViewLabOrderDetailInfo.aspx">Lab Order Detail Info</a></li>
        <li><a href="/UserAccess/LabOrders/AddNewLabOrder.aspx">Add Lab Order</a></li>
        <li><a href="/UserAccess/LabOrders/AddNewLabOrderDetail.aspx">Add Lab Order Detail</a></li>

        <li class="nav-header">ICD</li>
        <li><a href="/UserAccess/ICDs/ViewAllICDChapters.aspx">ICD Chapters</a></li>
        <li><a href="/UserAccess/ICDs/AddNewICDChapter.aspx">Add New ICD Chapter</a></li>
        <li><a href="/UserAccess/ICDs/ViewAllICD.aspx">ICD List</a></li>
        <li class="hide-accordingly"><a href="/UserAccess/ICDs/ViewICDDetails.aspx">ICD Details</a></li>
        <li><a href="/UserAccess/ICDs/AddNewICD.aspx">Add New ICD</a></li>

        <li class="nav-header">Drugs</li>
        <li><a href="/UserAccess/Drugs/ViewAllDrugGroups.aspx">Drug Groups</a></li>
        <li><a href="/UserAccess/Drugs/AddNewDrugGroup.aspx">Add New Drug Group</a></li>
        <li><a href="/UserAccess/Drugs/ViewAllDrugs.aspx">Drugs</a></li>
        <li class="hide-accordingly"><a href="/UserAccess/Drugs/ViewDrugDetails.aspx">Drug Details</a></li>
        <li><a href="/UserAccess/Drugs/AddNewDrug.aspx">Add New Drug</a></li>

        <li class="nav-header">Medical Services</li>
        <li><a href="/UserAccess/MedicalServices/ViewAllMedicalServiceGroups.aspx">Medical Service Groups</a></li>
        <li><a href="/UserAccess/MedicalServices/AddNewMedicalServiceGroup.aspx">Add Medical Service Group</a></li>
        <li><a href="/UserAccess/MedicalServices/ViewAllMedicalServices.aspx">Medical Services</a></li>
        <li class="hide-accordingly"><a href="/UserAccess/MedicalServices/ViewMedicalServiceDetails.aspx">Medical Service Details</a></li>
        <li><a href="/UserAccess/MedicalServices/AddNewMedicalService.aspx">Add New Medical Service</a></li>

        <%-- this section is for admin only --%>
        <%
        if(System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
        {
        %>  
        <li class="nav-header">Users</li>
        <li><a href="/AdminAccess/ViewAllUsers.aspx">View all users</a></li>
        <li><a href="/AdminAccess/AddNewUser.aspx">Add new user</a></li>
        <%
        }
        %>
        <%-- this section is for admin only --%>
    </ul>
</div>

<%-- code for highlighting the current link in sidebar --%>
<script type="text/javascript">
    // highlight current item in nav bar
    // hide the li tag with class hide-accordingly, show only if it's the current address

    // get the list of li tags
    var sidebar_nav = document.getElementById("sidebar-nav");
    var li_list = sidebar_nav.getElementsByTagName("li");

    // loop through all li tags
    for (var i = 0; i < li_list.length; i++) {
        // check if it contains a child node
        if (li_list[i].getElementsByTagName("a").length > 0) {
            // check if the current item is the current page address
            if (li_list[i].getElementsByTagName("a")[0].getAttribute("href") == window.location.pathname) {
                // set class to active
                li_list[i].setAttribute("class", "active");
            } else {
                // check if the current li tag has the class hide-accordingly
                if (li_list[i].classList.contains("hide-accordingly")) {
                    // hide the current li tag
                    li_list[i].setAttribute("style", "display: none");
                }
            }
        }
    }


    
</script>
