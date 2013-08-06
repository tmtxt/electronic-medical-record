using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Visits_ViewAllVisits : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ClearForm();
        }
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetPatientNamesCompletionList(string prefixText, int count, string contextKey)
    {
        var patientNamesDataSource = (from p in new DataClassesDataContext().Patients
                                     where p.Name.Contains(prefixText)
                                     select p.Name).ToArray();
        return patientNamesDataSource;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetDoctorNamesCompletionList(string prefixText, int count, string contextKey)
    {
        var doctorNamesDataSource = (from d in new DataClassesDataContext().Doctors
                                     where d.Name.Contains(prefixText)
                                     select d.Name).ToArray();
        return doctorNamesDataSource;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetHospitalNamesCompletionList(string prefixText, int count, string contextKey)
    {
        var hospitalNameseDataSource = (from h in new DataClassesDataContext().Hospitals
                                     where h.Name.Contains(prefixText)
                                     select h.Name).ToArray();
        return hospitalNameseDataSource;
    }

    protected void FindPatientButton_Click(object sender, EventArgs e)
    {
        // set the search criteria
        SetSearchCriteria();

        // rebind the data
        AllVisitsGridView.DataBind();
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void ClearForm()
    {
        // clear all the textboxes
        FindDoctorNameTextBox.Text = "";
        FindHospitalNameTextBox.Text = "";
        FindPatientNameTextBox.Text = "";

        // set the search criteria
        SetSearchCriteria();

        // rebind the data
        AllVisitsGridView.DataBind();
    }

    protected void SetSearchCriteria()
    {
        // set the search criteria
        VisitsData.SetDoctorName(FindDoctorNameTextBox.Text);
        VisitsData.SetPatientName(FindPatientNameTextBox.Text);
        VisitsData.SetHospitalName(FindHospitalNameTextBox.Text);
    }
}