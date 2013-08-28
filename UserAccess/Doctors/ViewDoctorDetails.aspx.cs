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

    protected void DoctorDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessDeleteDoctor] = "yes";
            Response.Redirect("/UserAccess/Doctors/ViewAllDoctors.aspx");
        }
        else
        {
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("error", e.Exception);
        }
    }

    protected void DoctorDetailsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all the dependencies first
        DoctorOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }
}