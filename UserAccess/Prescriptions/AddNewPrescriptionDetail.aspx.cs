using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Prescriptions_AddNewPrescriptionDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if error
        if (Request.QueryString["PrescriptionID"] == null)
        {
            // redirect
            RedirectToViewAllVisit();
        }
        else
        {
            long temp;
            // if parse error
            if (long.TryParse(Request.QueryString["PrescriptionID"], out temp))
            {
                // parse success, check if the prescription id exists
                if (new DataClassesDataContext().Prescriptions.Where(p => p.ID == long.Parse(Request.QueryString["PrescriptionID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisit();
                }
                else
                {
                    // success, do nothing
                }
            }
            else
            {
                // can not parse, redirect
                RedirectToViewAllVisit();
            }
        }
    }

    protected void RedirectToViewAllVisit()
    {
        // set the session variable
        Session[RedirectConstants.RedirectAddPrescriptionDetailSessionName] = "yes";

        // redirect
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void DrugGroupsDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}