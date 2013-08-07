using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_LabOrders_AddNewLabOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if error query string not found
        if (Request.QueryString["VisitID"] == null)
        {
            // redirect
            RedirectToViewAllVisits();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["VisitID"], out temp))
            {
                // redirect if visit ID not found
                if ((new DataClassesDataContext()).Visits.Where(v => v.ID == long.Parse(Request.QueryString["VisitID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisits();
                }
                else
                {
                    // OK
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
        Session[RedirectConstants.RedirectAddLabOrderSessionName] = "yes";
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }
}