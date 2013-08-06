using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Visits_ViewVisitDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if no query string found
        if (Request.QueryString["ID"] == null)
        {
            // set the session variable
            Session[RedirectConstants.RedirectVisitDetailsSessionName] = "yes";

            // redirect to view all patients page
            Response.Redirect("/UserAccess/Patients/ViewAllPatients.aspx");
        }
    }

    protected void VisitDetailsFormView_ModeChanging(object sender, FormViewModeEventArgs e)
    {

    }

    protected void VisitDetailsFormView_PageIndexChanged(object sender, EventArgs e)
    {

    }

    protected void VisitDetailsFormView_ModeChanged(object sender, EventArgs e)
    {

        //if (VisitDetailsFormView.CurrentMode == FormViewMode.Edit)
        //{
        //    VisitDetailsFormView.DataBind();


        //}
    }

    protected void ICDChapterDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // get the ICD drop down list
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // rebind data for it
        dl.DataBind();
    }

    protected void ICDDropdownList_DataBound(object sender, EventArgs e)
    {
        // get the linq data source of the ICD drop down list
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // set the selected value of the ICD drop down list
        // dl.SelectedValue = ((Visit)VisitDetailsFormView.DataItem).ICDID.ToString();
        if (VisitDetailsFormView.DataItem != null)
        {
            if (dl.Items.FindByValue(((Visit)VisitDetailsFormView.DataItem).ICDID.ToString()) == null)
            {
                // do nothing, leave the selected value by default
            }
            else
            {
                dl.Items.FindByValue(((Visit)VisitDetailsFormView.DataItem).ICDID.ToString()).Selected = true;
            }
        }

    }

    protected void VisitDetailsFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
    }

    protected void VisitDetailsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all its dependencies first
        VisitOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void VisitDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        // print the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Visit deleted successfully!", e.Exception);
    }

    protected void VisitDetailsFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Visit updated successfully!", e.Exception);
    }

    protected void VisitDetailsDataSource_Updating(object sender, LinqDataSourceUpdateEventArgs e)
    {
        var newObject = (Visit)e.NewObject;

        // get the ICD drop down list from the formview
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // set the ICDID for the new object to be updated
        newObject.ICDID = long.Parse(dl.SelectedValue);

        // get the date picker from the formview
        var date = ((TemplateControls_DatePicker)VisitDetailsFormView.FindControl("DatePicker")).SelectedDate;

        // set the new date for the visit
        newObject.Date = date;
    }

    protected void AddNewButton_Click(object sender, EventArgs e)
    {
        var patientID = ((HiddenField)VisitDetailsFormView.FindControl("PatientIDField")).Value;
        Response.Redirect("AddNewVisit.aspx?PatientID=" + patientID);
    }
}