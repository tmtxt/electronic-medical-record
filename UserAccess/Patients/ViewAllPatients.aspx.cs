using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Patients_ViewAllPatient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // display the redirect alert
        var redirectMessage = new Dictionary<string, string>();
        redirectMessage.Add(RedirectConstants.RedirectPatientDetailsSessionName,
            "You need to select a Patient to view details");
        redirectMessage.Add(RedirectConstants.RedirectVisitFromPatientSessionName,
            "You need to select a Patient's details to view that Patient's Visits");
        redirectMessage.Add(RedirectConstants.RedirectVisitDetailsSessionName,
            "You need to select a Patient's details to view that Patient's Visit details");
        redirectMessage.Add(RedirectConstants.RedirectAddNewVisitSessionName,
            "You need to select a Patient's details to add a new Visit");
        RedirectAlert.SetAlert(redirectMessage);
        
        // display the redirect success alert
        RedirectSuccessAlert.SetAlert("Patient deleted successfully!",
            RedirectSuccessConstants.RedirectSuccessDeletePatient);

    }
    protected void AllPatientsGridview_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        // Display whether the delete operation succeeded.
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Patient deleted successfully!", e.Exception);
    }
    protected void AllPatientsGridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all the dependencies of this patients
        PatientOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void FindPatientButton_Click(object sender, EventArgs e)
    {
        AllPatientsGridview.DataBind();
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        var patientNameDataSource = (from p in new DataClassesDataContext().Patients
                                     where p.Name.Contains(prefixText)
                                     select p.Name).ToArray();
        return patientNameDataSource;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        FindPatientTextBox.Text = "";
        AllPatientsGridview.DataBind();
    }
}