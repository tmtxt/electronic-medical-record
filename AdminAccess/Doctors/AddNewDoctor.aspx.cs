using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Doctors_AddNewDoctor : System.Web.UI.Page
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
        ((TextBox)AddDoctorFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)AddDoctorFormView.FindControl("LicenseTextBox")).Text = "";
        ((TextBox)AddDoctorFormView.FindControl("AddressTextBox")).Text = "";
        ((DropDownList)AddDoctorFormView.FindControl("GenderDropdownList")).SelectedIndex = 0;
        ((TemplateControls_DatePicker)AddDoctorFormView.FindControl("DateOfBirthDatePicker"))
            .SelectedDate = DateTime.Now.Ticks;
    }

    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserAccess/Doctors/ViewAllDoctors.aspx");
    }

    protected void AddDoctorFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        
    }

    protected void AddDoctorFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        // redirect to view patient detail if successful
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessAddDoctor] = "yes";
            Response.Redirect("/UserAccess/Doctors/ViewDoctorDetails.aspx?ID=" + InsertedDoctor.ID);
        }
        else
        {
            // display the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Patient inserted successfully!", e.Exception);
        }
    }

    private Doctor InsertedDoctor;

    protected void AddDoctorDataSource_Inserted(object sender, LinqDataSourceStatusEventArgs e)
    {
        InsertedDoctor = (Doctor)e.Result;
    }

    protected void AddDoctorDataSource_Inserting(object sender, LinqDataSourceInsertEventArgs e)
    {
        // get the date picker
        var datePicker = ((TemplateControls_DatePicker)AddDoctorFormView.FindControl("DateOfBirthDatePicker"));

        // set the date of birth
        ((Doctor)e.NewObject).DateOfBirth = datePicker.SelectedDate;
    }
}