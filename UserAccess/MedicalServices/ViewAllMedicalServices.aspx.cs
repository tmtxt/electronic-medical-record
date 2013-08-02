using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_MedicalServices_ViewAllMedicalServices : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        var dataContext = new DataClassesDataContext();
        var allMedicalServicesQuery =
            from m in dataContext.MedicalServices
            from mg in dataContext.MedicalServiceGroups
            where m.MedicalServiceGroupID == mg.ID
            select new
            {
                ID = m.ID,
                Name = m.Name,
                Price = m.Price,
                MedicalServiceGroupID = m.MedicalServiceGroupID,
                MedicalServiceGroupName = mg.Name
            };
        var allMedicalServicesDataSource = allMedicalServicesQuery.ToList();

        // bind to the grid view
        AllMedicalServicesGridView.DataSource = allMedicalServicesDataSource;
        AllMedicalServicesGridView.DataBind();
    }

    protected void AllMedicalServicesDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        
    }
}