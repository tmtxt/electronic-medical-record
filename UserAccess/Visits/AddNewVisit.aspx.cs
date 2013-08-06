using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Visits_AddNewVisit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
        if (Request.QueryString["PatientID"] == null)
        {
            // set the session variable
            Session[RedirectConstants.RedirectAddNewVisitSessionName] = "yes";

            // redirect to view all patients
            Response.Redirect("/UserAccess/Patients/ViewAllPatients.aspx");
        }

        // set the target link for cancel button
        var cancelButton = (HyperLink)AddVisitFormView.FindControl("CancelButton");
        cancelButton.NavigateUrl = "ViewVisitsFromPatient.aspx?PatientID=" + Request.QueryString["PatientID"];
    }

    protected void ICDChapterDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // rebind data for the ICD drop down list
        var dl = (DropDownList)AddVisitFormView.FindControl("ICDDropdownList");
        dl.DataBind();
    }

    protected void AddVisitDataSource_Inserting(object sender, LinqDataSourceInsertEventArgs e)
    {
        // get the new visit to be inserted
        var newVisit = (Visit)e.NewObject;

        // get the value from the formview
        var icd = ((DropDownList)AddVisitFormView.FindControl("ICDDropdownList")).SelectedValue;
        var date = ((TemplateControls_DatePicker)AddVisitFormView.FindControl("DatePicker")).SelectedDate;
        var patientID = ((HiddenField)AddVisitFormView.FindControl("PatientIDField")).Value;

        // set the new value
        newVisit.ICDID = long.Parse(icd);
        newVisit.Date = date;
        newVisit.PatientID = long.Parse(patientID);
    }

    protected void AddVisitFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        // print the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Visit inserted successfully!", e.Exception);
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ((TemplateControls_DatePicker)AddVisitFormView.FindControl("DatePicker")).SelectedDate = DateTime.Now.Ticks;
        ((DropDownList)AddVisitFormView.FindControl("HospitalsDropdownList")).SelectedIndex = 0;
        ((DropDownList)AddVisitFormView.FindControl("DoctorsDropdownList")).SelectedIndex = 0;
        ((DropDownList)AddVisitFormView.FindControl("ICDChapterDropdownList")).SelectedIndex = 0;
        ((DropDownList)AddVisitFormView.FindControl("OutcomeDropdownList")).SelectedIndex = 0;
    }
}