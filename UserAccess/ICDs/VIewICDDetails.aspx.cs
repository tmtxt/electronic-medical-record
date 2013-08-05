using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_ICDs_VIewICDDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("ViewAllICD.aspx");
        }
    }

    protected void ICDDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("ICD deleted successfully!", e.Exception);
    }

    protected void ICDDetailsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all its dependencies
        ICDOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }
}