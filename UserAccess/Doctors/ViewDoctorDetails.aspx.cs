using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Doctors_ViewDoctorsDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
        if (Request.QueryString["ID"] == null)
        {
            RedirectToViewAllDoctors();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["ID"], out temp))
            {
                // redirect if patient not found
                if (new DataClassesDataContext().Doctors.Where(p => p.ID == long.Parse(Request.QueryString["ID"])).Count() == 0)
                {
                    RedirectToViewAllDoctors();
                }
                else
                {
                    // OK
                }
            }
            else
            {
                RedirectToViewAllDoctors();
            }
        }

        RedirectSuccessAlert.SetAlert("Doctor inserted successfully!",
            RedirectSuccessConstants.RedirectSuccessAddDoctor);
    }

    private void RedirectToViewAllDoctors()
    {
        // set the session variable
        Session[RedirectConstants.RedirectDoctorDetailsSessionName] = "yes";

        Response.Redirect("/UserAccess/Doctors/ViewAllDoctors.aspx");
    }
}