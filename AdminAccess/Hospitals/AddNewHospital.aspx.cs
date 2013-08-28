using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAccess_Hospitals_AddNewHospital : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    private void ClearForm()
    {
        ((TextBox)AddHospitalFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)AddHospitalFormView.FindControl("LicenseTextBox")).Text = "";
        ((TextBox)AddHospitalFormView.FindControl("AddressTextBox")).Text = "";
    }

    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserAccess/Hospitals/ViewAllHospitals.aspx");
    }

    protected void AddHospitalFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);


    }

    protected void AddHospitalFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        // redirect to view patient detail if successful
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessAddHospital] = "yes";
            Response.Redirect("/UserAccess/Hospitals/ViewHospitalDetails.aspx?ID=" + InsertedHospital.ID);
        }
        else
        {
            // display the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Hospital inserted successfully!", e.Exception);
        }
    }

    private Hospital InsertedHospital;

    protected void AddHospitalDataSource_Inserted(object sender, LinqDataSourceStatusEventArgs e)
    {
        InsertedHospital = (Hospital)e.Result;
    }

    protected void AddHospitalDataSource_Inserting(object sender, LinqDataSourceInsertEventArgs e)
    {
        
    }
}