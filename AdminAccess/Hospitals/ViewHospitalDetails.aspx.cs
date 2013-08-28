using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAccess_Hospitals_ViewHospitalDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
        if (Request.QueryString["ID"] == null)
        {
            RedirectToViewAllHospitals();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["ID"], out temp))
            {
                // redirect if patient not found
                if (new DataClassesDataContext().Hospitals.Where(h => h.ID == long.Parse(Request.QueryString["ID"])).Count() == 0)
                {
                    RedirectToViewAllHospitals();
                }
                else
                {
                    // OK
                }
            }
            else
            {
                RedirectToViewAllHospitals();
            }
        }

        RedirectSuccessAlert.SetAlert("Hospital inserted successfully!",
            RedirectSuccessConstants.RedirectSuccessAddHospital);
    }

    private void RedirectToViewAllHospitals()
    {
        // set the session variable
        Session[RedirectConstants.RedirectHospitalDetailsSessionName] = "yes";

        Response.Redirect("/AdminAccess/Hospitals/ViewAllHospitals.aspx");
    }

    protected void HospitalDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessDeleteHospital] = "yes";
            Response.Redirect("/AdminAccess/Hospitals/ViewAllHospitals.aspx");
        }
        else
        {
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("error", e.Exception);
        }
    }

    protected void HospitalDetailsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all the dependencies first
        HospitalOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    private void ClearForm()
    {
        ((TextBox)HospitalDetailsFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)HospitalDetailsFormView.FindControl("AddressTextBox")).Text = "";
        ((TextBox)HospitalDetailsFormView.FindControl("LicenseTextBox")).Text = "";
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void HospitalDetailsFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {

    }

    protected void HospitalDetailsFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        if (e.Exception == null)
        {
            ResultAlert.SetResultAlert("Hospital updated successfully!",
                TemplateControls_ResultAlert.AlertTypeSuccess);
        }
        else
        {
            ResultAlert.SetResultAlert(e.Exception.Message,
                TemplateControls_ResultAlert.AlertTypeError);
            e.ExceptionHandled = true;
        }
    }

    protected void HospitalDetailsDataSource_Updating(object sender, LinqDataSourceUpdateEventArgs e)
    {
    }
}