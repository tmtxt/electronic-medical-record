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
        // display the redirect alert
        var redirectMessage = new Dictionary<string, string>();
        redirectMessage.Add(RedirectConstants.RedirectDoctorDetailsSessionName,
            "You need to select a Doctor to view details");
        RedirectAlert.SetAlert(redirectMessage);

        // display the redirect success alert
        RedirectSuccessAlert.SetAlert("Doctor deleted successfully!",
            RedirectSuccessConstants.RedirectSuccessDeleteDoctor);
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

    /// <summary>
    /// talk the to the web service to update the data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        AllDoctorsGridView.DataBind();
    }
}