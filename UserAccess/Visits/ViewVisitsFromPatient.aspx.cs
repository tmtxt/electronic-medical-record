using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Visits_ViewVisitsFromPatient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PatientID"] == null)
        {
            // set the session variable for displaying the message
            Session[RedirectConstants.RedirectVisitFromPatientSessionName] = "yes";

            // redirect to view all patients
            Response.Redirect("/UserAccess/Patients/ViewAllPatients.aspx");
        }
    }

    protected void VisitsFromPatientGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all its dependencies
        VisitOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void VisitsFromPatientGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Visit deleted successfully", e.Exception);
    }
}