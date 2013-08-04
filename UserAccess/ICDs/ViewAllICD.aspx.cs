using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_ICDs_ViewAllICD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AllICDGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("ICD deleted successfully", e.Exception);
    }

    protected void AllICDGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all its dependencies first
        ICDOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetICDCodeCompletionList(string prefixText, int count, string contextKey)
    {
        // select the icd codes that contain the string prefix text
        var icdCodes = from i in new DataClassesDataContext().ICDs
                       where i.Code.Contains(prefixText)
                       select i.Code;
        return icdCodes.ToArray();
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetICDNameCompletionList(string prefixText, int count, string contextKey)
    {
        // select the icd names that contain the string prefix text
        var icdNames = from i in new DataClassesDataContext().ICDs
                       where i.Name.Contains(prefixText)
                       select i.Name;
        return icdNames.ToArray();
    }

    protected void FindICDButton_Click(object sender, EventArgs e)
    {
        AllICDGridView.DataBind();
    }

    protected void CancelFindButton_Click(object sender, EventArgs e)
    {
        // remove all search criteria
        FindICDCodeTextBox.Text = "";
        FindICDNameTextBox.Text = "";
        AllICDGridView.DataBind();
    }
}