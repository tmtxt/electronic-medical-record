using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_MedicalServices_ViewAllMedicalServiceGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AllMedicalServiceGroupsGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // set the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Medical Service Group inserted successfully!",
            e.Exception);
    }

    protected void AllMedicalServiceGroupsGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // set the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Medical Service Group deleted successfully!",
            e.Exception);
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        var medicalServiceGroupNamesDataSource =
            (from msg in new DataClassesDataContext().MedicalServiceGroups
             where msg.Name.Contains(prefixText)
             select msg.Name).ToArray();
        return medicalServiceGroupNamesDataSource;
    }

    protected void FindMedicalServiceGroupButton_Click(object sender, EventArgs e)
    {
        AllMedicalServiceGroupsGridView.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        FindMedicalServiceGroupTextBox.Text = "";
        AllMedicalServiceGroupsGridView.DataBind();
    }

    protected void AllMedicalServiceGroupsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // delete the dependencies first
        MedicalServiceGroupOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }
}