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
        // delete all dependencies of this medical service first
        MedicalServiceOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));

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

    protected void MedicalServiceDetailsFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Medical Service updated successfully!", e.Exception);
    }

    protected void MedicalServiceDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Medical Service deleted successfully!", e.Exception);
    }

    protected void ClearForm()
    {
        ((TextBox)MedicalServiceDetailsFormView.FindControl("NameTextBox")).Text = "";
        ((TextBox)MedicalServiceDetailsFormView.FindControl("PriceTextBox")).Text = "";
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void MedicalServiceDetailsFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // set the MedicalServiceGroupID
        // get the control from the formview
        var groupNameControl = (DropDownList)MedicalServiceDetailsFormView.FindControl("MedicalServiceGroupNameDropdownList");

        // set the value to be updated
        e.NewValues["MedicalServiceGroupID"] = groupNameControl.SelectedValue;
    }
}