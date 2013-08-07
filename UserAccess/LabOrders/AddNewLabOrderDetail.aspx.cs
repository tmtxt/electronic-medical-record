using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_LabOrders_AddNewLabOrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
        if (Request.QueryString["LabOrderID"] == null)
        {
            RedirectToViewAllVisits();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["LabOrderID"], out temp))
            {
                // check if the order id exists
                if (new DataClassesDataContext().LabOrders.Where(l => l.ID == long.Parse(Request.QueryString["LabOrderID"])).Count() == 0)
                {
                    RedirectToViewAllVisits();
                }
                else
                {
                    // success, do nothing
                }
            }
            else
            {
                RedirectToViewAllVisits();
            }
        }
    }

    protected void RedirectToViewAllVisits()
    {
        Session[RedirectConstants.RedirectAddLabOrderDetailSessionName] = "yes";
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }
}