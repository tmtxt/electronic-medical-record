using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Visits_ViewVisitsFromPatient : System.Web.UI.Page
{
    protected void RedirectToViewAllPatients()
    {
        // set the session variable for displaying the message
        Session[RedirectConstants.RedirectVisitFromPatientSessionName] = "yes";

        // redirect to view all patients
        Response.Redirect("/UserAccess/Patients/ViewAllPatients.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
        if (Request.QueryString["PatientID"] == null)
        {
            RedirectToViewAllPatients();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["PatientID"], out temp))
            {
                // redirect if patient id not found
                if (new DataClassesDataContext().Patients.Where(p => p.ID == long.Parse(Request.QueryString["PatientID"])).Count() == 0)
                {
                    RedirectToViewAllPatients();
                }
                else
                {
                    // OK
                }
            }
            else
            {
                RedirectToViewAllPatients();
            }
        }

        // display the redirect success alert
        RedirectSuccessAlert.SetAlert("Visit inserted successfully!",
            RedirectSuccessConstants.RedirectSuccessAddVisit);
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

    protected void AddNewButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewVisit.aspx?PatientID=" + Request.QueryString["PatientID"]);
    }
}