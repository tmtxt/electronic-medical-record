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

    /// <summary>
    /// talk the to the web service to update the data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        AllDoctorsGridView.DataBind();
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        var doctorNameDataSource = (from d in new DataClassesDataContext().Doctors
                                     where d.Name.Contains(prefixText)
                                     select d.Name).ToArray();
        return doctorNameDataSource;
    }

    protected void FindPatientButton_Click(object sender, EventArgs e)
    {
        // set the search criteria
        SetSearchCriteria();

        // rebind the data
        AllDoctorsGridView.DataBind();
    }

    /// <summary>
    /// Set the search criteria for doctor list
    /// </summary>
    protected void SetSearchCriteria()
    {
        DoctorData.SearchDoctorName = FindDoctorTextBox.Text;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        // empty the textbox
        FindDoctorTextBox.Text = "";

        // set the search criteria
        SetSearchCriteria();

        // rebind the data
        AllDoctorsGridView.DataBind();
    }
}