using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Drugs_AllNewDrugGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ClearForm()
    {
        ((TextBox)AddNewDrugGroupFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)AddNewDrugGroupFormView.FindControl("DescriptionTextBox")).Text = "";
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
    protected void AddNewDrugGroupFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Drug Group inserted successfully!", e.Exception);
    }
}