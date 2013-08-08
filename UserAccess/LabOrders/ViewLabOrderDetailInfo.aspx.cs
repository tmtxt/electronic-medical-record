using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_LabOrders_ViewLabOrderDetailInfo : System.Web.UI.Page
{
    private long VisitID { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
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
                // redirect if id not found

                if (new DataClassesDataContext().LabOrderDetails.Where(l => l.ID == long.Parse(Request.QueryString["ID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisits();
                }
                else
                {
                    // OK
                    // store the visit ID
                    VisitID = (new DataClassesDataContext()).LabOrderDetails.Where(l => l.ID == long.Parse(Request.QueryString["ID"])).First().LabOrder.VisitID;
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
        Session[RedirectConstants.RedirectLabOrderInfoSessionName] = "yes";
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void ViewVisitButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
    }
}