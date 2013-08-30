using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Drugs_ViewDrugDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
        if (Request.QueryString["ID"] == null)
        {
            RedirectToViewAllDrugs();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["ID"], out temp))
            {
                // redirect if drug not found
                if (new DataClassesDataContext().Drugs.Where(p => p.ID == long.Parse(Request.QueryString["ID"])).Count() == 0)
                {
                    RedirectToViewAllDrugs();
                }
                else
                {
                    // OK
                }
            }
            else
            {
                RedirectToViewAllDrugs();
            }
        }

        // display the redirect success alert
        RedirectSuccessAlert.SetAlert("Drug inserted successfully",
            RedirectSuccessConstants.RedirectSuccessAddDrug);
    }

    private void RedirectToViewAllDrugs()
    {
        // set the session value to display the message
        Session[RedirectConstants.RedirectDrugDetailsSessionName] = "yes";

        // redirect to view all drugs page
        Response.Redirect("ViewAllDrugs.aspx");
    }

    protected void DrugDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessDeleteDrug] = "yes";
            Response.Redirect("/UserAccess/Drugs/ViewAllDrugs.aspx");
        }
        else
        {
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("ICD deleted successfully!", e.Exception);
        }
    }

    protected void DrugDetailsFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // print the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Drug updated successfully!", e.Exception);
    }

    protected void DrugDetailsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // delete all this drug's dependencies
        DrugOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }
}