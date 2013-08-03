using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Drugs_ViewAllDrugGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AllDrugGroupsGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        // set the result alert
        ResultAlert.SetResultAlertReturn("Drug Group updated successfully!", e.Exception);
    }

    protected void AllDrugGroupsGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        // set the result alert
        ResultAlert.SetResultAlertReturn("Drug Group delete successfully!", e.Exception);
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        var findDrugGroupDataSource = (from dg in new DataClassesDataContext().DrugGroups
                                       where dg.Name.Contains(prefixText)
                                       select dg.Name).ToArray();
        return findDrugGroupDataSource;
    }

    protected void FindDrugGroupButton_Click(object sender, EventArgs e)
    {
        AllDrugGroupsGridView.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        FindDrugGroupTextBox.Text = "";
        AllDrugGroupsGridView.DataBind();
    }

    protected void AllDrugGroupsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // delete all this drug group's dependencies
        DrugGroupOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }
}