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

    protected void AddNewMedicalServiceFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // set the MedicalServiceGroupID for the new object
        // get the control from the form view
        var dropdownList = (DropDownList)AddNewMedicalServiceFormView.FindControl("MedicalServiceGroupNameDropdownList");
        // set the value
        e.Values["MedicalServiceGroupID"] = dropdownList.SelectedValue;
    }

    protected void AddNewMedicalServiceFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Medical Service inserted successfully!", e.Exception);
    }
}