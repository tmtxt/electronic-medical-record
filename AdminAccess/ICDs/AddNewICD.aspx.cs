using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_ICDs_AddNewICD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ClearForm()
    {
        ((TextBox)AddNewICDFormView.FindControl("CodeTextBox")).Text = "";
        ((TextBox)AddNewICDFormView.FindControl("DescriptionTextBox")).Text = "";
        ((TextBox)AddNewICDFormView.FindControl("NameTextBox")).Text = "";
        ((DropDownList)AddNewICDFormView.FindControl("ICDChapterDropdownList")).SelectedIndex = 0;
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void AddNewICDFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
    }

    protected void AddNewICDFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        // set the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("ICD inserted successfully!", e.Exception);
    }
}