using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Drugs_ViewAllDrugGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AllDrugGroupsGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        // set the result alert
        ResultAlert.SetResultAlertReturn("Drug Group updated successfully!", e.Exception);
    }

    protected void AllDrugGroupsGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        // set the result alert
        ResultAlert.SetResultAlertReturn("Drug Group delete successfully!", e.Exception);
    }
}