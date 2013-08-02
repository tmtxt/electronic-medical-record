using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_MedicalServices_AddNewMedicalServiceGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ClearFormButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void ClearForm()
    {
        ((TextBox)AddNewMedicalServiceGroupFormView.FindControl("NameTextBox"))
            .Text = "";
        ((TextBox)AddNewMedicalServiceGroupFormView.FindControl("DescriptionTextBox"))
            .Text = "";
    }

    protected void AddNewMedicalServiceGroupFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {

    }
}