using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_MedicalServices_ViewAllMedicalServices : System.Web.UI.Page
{
    //protected void BindData()
    //{
    //    var dataContext = new DataClassesDataContext();
    //    var allMedicalServicesQuery =
    //        from m in dataContext.MedicalServices
    //        from mg in dataContext.MedicalServiceGroups
    //        where m.MedicalServiceGroupID == mg.ID
    //        select new
    //        {
    //            ID = m.ID,
    //            Name = m.Name,
    //            Price = m.Price,
    //            MedicalServiceGroupID = m.MedicalServiceGroupID,
    //            MedicalServiceGroupName = mg.Name
    //        };

    //    // bind to the grid view
    //    AllMedicalServicesGridView.DataSource = allMedicalServicesQuery;
    //    AllMedicalServicesGridView.DataBind();
    //}

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    BindData();
        //}
        
    }

    protected void AllMedicalServicesDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        
    }
    protected void AllMedicalServicesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete its dependencies first
        MedicalServiceOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));

        //// delete the medical service
        //var ctx = new DataClassesDataContext();
        //var itemToDelete = from ms in ctx.MedicalServices
        //                   where ms.ID == long.Parse(e.Keys["ID"].ToString())
        //                   select ms;
        //ctx.MedicalServices.DeleteAllOnSubmit(itemToDelete);
        //try
        //{
        //    ctx.SubmitChanges();
        //    ResultAlert.SetResultAlertReturn("Medical Services deleted successfully!", null);
        //}
        //catch (Exception ex)
        //{
        //    ResultAlert.SetResultAlertReturn("Medical Services deleted successfully!", ex);
        //}
        //BindData();
    }

    protected void AllMedicalServicesGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        var medicalServiceNames = from m in new DataClassesDataContext().MedicalServices
                                  where m.Name.Contains(prefixText)
                                  select m.Name;
        return medicalServiceNames.ToArray();
    }
    
    protected void FindMedicalServiceButton_Click(object sender, EventArgs e)
    {
        AllMedicalServicesGridView.DataBind();
    }
}