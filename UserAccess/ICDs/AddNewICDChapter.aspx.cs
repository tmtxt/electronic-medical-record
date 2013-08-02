using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_ICDs_AddNewICDChapter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }

    /// <summary>
    /// Clear the form
    /// </summary>
    protected void ClearForm()
    {
        ((TextBox)AddNewICDChapterFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)AddNewICDChapterFormView.FindControl("DescriptionTextBox")).Text = "";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
}