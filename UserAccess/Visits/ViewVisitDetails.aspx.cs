using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Visits_ViewVisitDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void VisitDetailsFormView_ModeChanging(object sender, FormViewModeEventArgs e)
    {

    }

    protected void VisitDetailsFormView_PageIndexChanged(object sender, EventArgs e)
    {

    }

    protected void VisitDetailsFormView_ModeChanged(object sender, EventArgs e)
    {

        //if (VisitDetailsFormView.CurrentMode == FormViewMode.Edit)
        //{
        //    VisitDetailsFormView.DataBind();


        //}
    }

    protected void ICDChapterDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // get the ICD drop down list
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // rebind data for it
        dl.DataBind();
    }

    protected void ICDDropdownList_DataBound(object sender, EventArgs e)
    {
        // get the linq data source of the ICD drop down list
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // set the selected value of the ICD drop down list
        // dl.SelectedValue = ((Visit)VisitDetailsFormView.DataItem).ICDID.ToString();
        if (VisitDetailsFormView.DataItem != null)
        {
            if (dl.Items.FindByValue(((Visit)VisitDetailsFormView.DataItem).ICDID.ToString()) == null)
            {
                // do nothing, leave the selected value by default
            }
            else
            {
                dl.Items.FindByValue(((Visit)VisitDetailsFormView.DataItem).ICDID.ToString()).Selected = true;
            }
        }

    }

    protected void VisitDetailsFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // get the ICD drop down list from the formview
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // set the ICDID for the new object to be updated
        e.NewValues["ICDID"] = dl.SelectedValue;
    }
}