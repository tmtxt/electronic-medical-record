using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Prescriptions_AddNewPrescription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if error happens
        if (Request.QueryString["VisitID"] == null)
        {
            // redirect
            Session[RedirectConstants.RedirectAddNewPrescriptionSessionName] = "yes";
            Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
        }
        else
        {
            var visit = new DataClassesDataContext().Visits.Where(v => v.ID == long.Parse(Request.QueryString["VisitID"]));
            if (visit.Count() == 0)
            {
                // redirect
                Session[RedirectConstants.RedirectAddNewPrescriptionSessionName] = "yes";
                Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
            }
            else if (visit.First().Prescriptions.Count() > 0)
            {
                // redirect
                Session[RedirectConstants.RedirectAddNewPrescriptionExistSessionName] = "yes";
                Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
            }
        }
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        // redirect back to view visit details
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID="
            + Request.QueryString["VisitID"]);
    }

    protected void AddPrescriptionDataSource_Inserting(object sender, LinqDataSourceInsertEventArgs e)
    {
        var newPrescription = (Prescription)e.NewObject;

        // set the prescription date
        newPrescription.Date = ((TemplateControls_DatePicker)AddPrescriptionFormView.FindControl("DatePicker")).SelectedDate;

        // set doctor ID
        newPrescription.DoctorID = long.Parse(((DropDownList)AddPrescriptionFormView.FindControl("DoctorsDropdownList")).SelectedValue);
    }

    protected void AddPrescriptionFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Prescription inserted successfully!", e.Exception);
    }

    protected void AddPrescriptionFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values["VisitID"] = long.Parse(Request.QueryString["VisitID"]);
        e.Values["Date"] = ((TemplateControls_DatePicker)AddPrescriptionFormView.FindControl("DatePicker")).SelectedDate;
        e.Values["DoctorID"] = long.Parse(((DropDownList)AddPrescriptionFormView.FindControl("DoctorsDropdownList")).SelectedValue);
    }
}