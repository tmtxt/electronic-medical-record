using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Prescriptions_ViewPrescriptionDetail : System.Web.UI.Page
{
    private long VisitID { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if error
        if (Request.QueryString["ID"] == null)
        {
            // redirect
            RedirectToViewAllVisits();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["ID"], out temp))
            {
                // redirect if ID not found
                if (new DataClassesDataContext().Prescriptions.Where(p => p.ID == long.Parse(Request.QueryString["ID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisits();
                }
                else
                {
                    // OK, set the visit ID into the property
                    VisitID = new DataClassesDataContext().Visits.Where(v => v.Prescriptions.First().ID == long.Parse(Request.QueryString["ID"])).First().ID;

                }
            }
            else
            {
                // redirect
                RedirectToViewAllVisits();
            }
        }
    }

    protected void RedirectToViewAllVisits()
    {
        // set the session variable
        Session["RedirectPrescriptionDetailsSessionName"] = "yes";

        // redirect to view all visits page
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void PrescriptionDetailsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all this prescription's dependencies
        PrescriptionOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void PrescriptionDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        // redirect to the view visit detail page
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessDeletePrescription] = "yes";
            Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
        }
        else
        {
            // display the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Prescription deleted successfully!", e.Exception);
        }
    }

    protected void ViewVisitButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
    }
}