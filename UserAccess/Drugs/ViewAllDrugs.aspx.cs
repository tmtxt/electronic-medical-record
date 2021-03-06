﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Drugs_ViewAllDrugs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // set the redirect alert
        RedirectAlert.SetAlert("You need to select a Drug to view its details",
            RedirectConstants.RedirectDrugDetailsSessionName);

        // set the redirect success alert
        RedirectSuccessAlert.SetAlert("Drug deleted successfully",
            RedirectSuccessConstants.RedirectSuccessDeleteDrug);
    }

    protected void AllDrugGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Drug deleted successfully!", e.Exception);
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        var drugNames = from d in new DataClassesDataContext().Drugs
                        where d.Name.Contains(prefixText)
                        select d.Name;
        return drugNames.ToArray();
    }

    protected void CancelFindButton_Click(object sender, EventArgs e)
    {
        FindDrugTextBox.Text = "";
        AllDrugGridView.DataBind();
    }

    protected void FindDrugButton_Click(object sender, EventArgs e)
    {
        AllDrugGridView.DataBind();
    }

    protected void AllDrugGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // delete all this drug's dependencies
        DrugOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }
}