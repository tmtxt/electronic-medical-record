using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Drugs_ViewAllDrugs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AllDrugGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Drug deleted successfully!", e.Exception);
    }
}