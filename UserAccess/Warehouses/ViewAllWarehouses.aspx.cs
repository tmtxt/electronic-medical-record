using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Warehouses_ViewAllWarehouses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void AllWarehousesGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        // Display whether the delete operation succeeded.
        if (e.Exception == null)
        {
            ResultAlert.SetResultAlert("Warehouse deleted successfully!", TemplateControls_ResultAlert.AlertTypeSuccess);
        }
        else
        {
            ResultAlert.SetResultAlert("An error occured! Please try again later!",
                TemplateControls_ResultAlert.AlertTypeError);
            e.ExceptionHandled = true;
        }

    }
    protected void AllWarehousesGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        // Display whether the delete operation succeeded.
        if (e.Exception == null)
        {
            ResultAlert.SetResultAlert("Warehouse updated successfully!", TemplateControls_ResultAlert.AlertTypeSuccess);
        }
        else
        {
            ResultAlert.SetResultAlert("An error occured! Please try again later!",
                TemplateControls_ResultAlert.AlertTypeError);
            e.ExceptionHandled = true;
        }
    }
    protected void AllWarehousesGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ResultAlert.ClearResultAlert();
    }

    protected void AllWarehousesGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ResultAlert.ClearResultAlert();
    }
}