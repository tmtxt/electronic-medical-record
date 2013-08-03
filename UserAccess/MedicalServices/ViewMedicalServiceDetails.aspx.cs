using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_MedicalServices_ViewMedicalServiceDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("/UserAccess/MedicalServices/ViewAllMedicalServices.aspx");
        }
        //if (!IsPostBack)
        //{

        //    BindData();
        //}
    }

    protected void BindData()
    {
        long ID = long.Parse(Request.QueryString["ID"]);

        // select the medical service from database
        var ctx = new DataClassesDataContext();
        var medicalService = from m in ctx.MedicalServices
                             join g in ctx.MedicalServiceGroups
                             on m.MedicalServiceGroupID equals g.ID
                             where m.ID == ID
                             select new
                             {
                                 ID = m.ID,
                                 Name = m.Name,
                                 Price = m.Price,
                                 Group = g.Name
                             };

        MedicalServiceDetailsFormView.DataSource = medicalService;
        MedicalServiceDetailsFormView.DataBind();
    }
    protected void MedicalServiceDetailsFormView_ModeChanging(object sender, FormViewModeEventArgs e)
    {

    }
    protected void MedicalServiceDetailsFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        
    }
    protected void MedicalServiceDetailsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        

    }
    protected void MedicalServiceDetailsFormView_DataBound(object sender, EventArgs e)
    {
        //// select the right group name
        //var ctx = new DataClassesDataContext();
        //var groupName = from g in ctx.MedicalServiceGroups
        //                where g.ID == ((MedicalService)MedicalServiceDetailsFormView.DataItem).MedicalServiceGroupID
        //                select g.Name;

        ////
        //var groupLabel = (Label)MedicalServiceDetailsFormView.FindControl("MedicalServiceGroupLabel");
        //groupLabel.Text = groupName.First();
        
    }
}