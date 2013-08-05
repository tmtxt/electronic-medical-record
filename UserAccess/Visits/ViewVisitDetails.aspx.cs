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

        //    // get the linq data source of the ICD drop down list
        //    var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");
        //    var ds = (LinqDataSource)VisitDetailsFormView.FindControl("ICDDataSource");

        //    // set the where clause
        //    ds.Where = "ICDChapterID = @ICDChapterID";
        //    var a = ((DropDownList)VisitDetailsFormView.FindControl("ICDChapterDropdownList")).SelectedValue;
        //    dl.DataBind();
        //}
    }
}