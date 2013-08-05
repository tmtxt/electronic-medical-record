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

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ((TextBox)ICDDetailsFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)ICDDetailsFormView.FindControl("CodeTextBox")).Text = "";
        ((TextBox)ICDDetailsFormView.FindControl("DescriptionTextBox")).Text = "";
        ((DropDownList)ICDDetailsFormView.FindControl("ICDChapterDropdownList")).SelectedIndex = 0;
    }


    protected void ICDDetailsFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
    }

    protected void ICDDetailsFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("ICD updated successfully!", e.Exception);
    }
}