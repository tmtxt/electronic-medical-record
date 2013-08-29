using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_ICD_ViewAllICDChapter : System.Web.UI.Page
{
    //public GridView MainGridView { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        RedirectSuccessAlert.SetAlert("ICD Chapter inserted successfully",
            RedirectSuccessConstants.RedirectSuccessAddICDChapter);
    }
    protected void AllICDChaptersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        
        // delete all its dependencies
        ICDChapterOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void AllICDChaptersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
    }
    protected void AllICDChaptersGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ResultAlert.SetResultAlert("ICD Updated deleted successfully!",
                TemplateControls_ResultAlert.AlertTypeSuccess);
        }
        else
        {
            ResultAlert.SetResultAlert(e.Exception.Message,
                TemplateControls_ResultAlert.AlertTypeError);
            e.ExceptionHandled = true;
        }
    }

    protected void AllICDChaptersGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            ResultAlert.SetResultAlert("ICD Chapter deleted successfully!",
                TemplateControls_ResultAlert.AlertTypeSuccess);
        }
        else
        {
            ResultAlert.SetResultAlert(e.Exception.Message,
                TemplateControls_ResultAlert.AlertTypeError);
            e.ExceptionHandled = true;
        }
    }
    protected void FindICDChapterButton_Click(object sender, EventArgs e)
    {
        AllICDChaptersGridView.DataBind();
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        var ICDChapterNameDataSource = (from ic in new DataClassesDataContext().ICDChapters
                                        where ic.Name.Contains(prefixText)
                                        select ic.Name).ToArray();
        return ICDChapterNameDataSource;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FindICDChapterTextBox.Text = "";
        AllICDChaptersGridView.DataBind();
    }
}