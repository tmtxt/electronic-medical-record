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

        // redirect to view patient detail if successful
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessAddDrug] = "yes";
            Response.Redirect("/UserAccess/Drugs/ViewDrugDetails.aspx?ID=" + insertedDrug.ID);
        }
        else
        {
            // display the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Drug inserted successfully!", e.Exception);
        }
    }

    private Drug insertedDrug;

    protected void AddNewDrugDataSource_Inserted(object sender, LinqDataSourceStatusEventArgs e)
    {
        insertedDrug = (Drug)e.Result;
    }
}