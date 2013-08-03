using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_MedicalServices_AddNewMedicalService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ClearForm()
    {
        ((TextBox)AddNewMedicalServiceFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)AddNewMedicalServiceFormView.FindControl("PriceTextBox")).Text = "";
        ((DropDownList)AddNewMedicalServiceFormView.FindControl("MedicalServiceGroupNameDropdownList")).SelectedIndex = 0;
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
}