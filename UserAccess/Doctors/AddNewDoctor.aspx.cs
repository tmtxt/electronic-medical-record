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
}