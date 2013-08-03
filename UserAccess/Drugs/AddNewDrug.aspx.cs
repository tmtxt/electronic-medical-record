using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Drugs_AddNewDrug : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ClearForm()
    {
        ((TextBox)AddNewDrugFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)AddNewDrugFormView.FindControl("GenericNameTextBox")).Text = "";
        ((TextBox)AddNewDrugFormView.FindControl("UnitTextBox")).Text = "";
        ((TextBox)AddNewDrugFormView.FindControl("PriceTextBox")).Text = "";
        ((DropDownList)AddNewDrugFormView.FindControl("DrugGroupDropdownList")).SelectedIndex = 0;
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void AddNewDrugFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Drug inserted successfully!", e.Exception);
    }
}