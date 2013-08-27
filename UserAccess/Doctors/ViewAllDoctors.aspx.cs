using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Doctors_ViewAllDoctors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void BindData()
    {
        // declare the web service
        var service = new DoctorServiceReference.DoctorServiceSoapClient();

        // get current page index, page size, start position
        int pageIndex = AllDoctorsGridView.PageIndex;
        int pageSize = AllDoctorsGridView.PageSize;
        int startIndex = pageIndex * pageSize;

        // get the data
        DoctorServiceReference.SerializableDoctor[] doctorList = service.GetAllDoctors(startIndex, pageSize);
        AllDoctorsGridView.DataSource = doctorList;

        // set the item count
        int itemCount = service.GetITotalDoctorsCount();
        AllDoctorsGridView.VirtualItemCount = itemCount;

        // finally bind the data
        AllDoctorsGridView.DataBind();
    }
}