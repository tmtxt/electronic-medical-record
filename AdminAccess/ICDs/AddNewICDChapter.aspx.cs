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
    protected void AddNewICDChapterFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessAddICDChapter] = "yes";
            Response.Redirect("/UserAccess/ICDs/ViewAllICDChapters.aspx");
        }
        else
        {
            ResultAlert.SetResultAlert(e.Exception.Message,
                TemplateControls_ResultAlert.AlertTypeError);
            e.ExceptionHandled = true;
        }
    }

    private ICDChapter insertedChapter;

    protected void AddNewICDChapterDataSource_Inserted(object sender, LinqDataSourceStatusEventArgs e)
    {
        var inserted = (ICDChapter)e.Result;
        this.insertedChapter = inserted;
    }
}