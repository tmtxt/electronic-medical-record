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
        if (Request.QueryString["ID"] == null)
        {
            Session[RedirectConstants.RedirectDrugDetails] = "yes";
            Response.Redirect("ViewAllDrugs.aspx");
            
        }
    }

    protected void DrugDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // print the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Drug deleted successfully!", e.Exception);
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