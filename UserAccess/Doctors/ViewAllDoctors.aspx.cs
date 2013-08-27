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
        //var service = new DoctorServiceReference.DoctorServiceSoapClient();
        //var doctorsList = service.GetAllDoctors(0, 10);
        //AllDoctorsGridView.DataSource = doctorsList;
        var service = new DoctorServiceReference.DoctorServiceSoapClient();
        DoctorServiceReference.SerializableDoctor[] doctorList = service.GetAllDoctors(0, 10);
        AllDoctorsGridView.DataSource = doctorList;
        AllDoctorsGridView.DataBind();
    }
}