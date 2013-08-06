using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Prescriptions_AddNewPrescription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if error happens
        if (Request.QueryString["VisitID"] == null)
        {
            // redirect
            Session[RedirectConstants.RedirectAddNewPrescriptionSessionName] = "yes";
            Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
        }
        else
        {
            if (new DataClassesDataContext().Visits.Where(v => v.ID == long.Parse(Request.QueryString["VisitID"])).Count() == 0)
            {
                // redirect
                Session[RedirectConstants.RedirectAddNewPrescriptionSessionName] = "yes";
                Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
            }
        }
    }
}