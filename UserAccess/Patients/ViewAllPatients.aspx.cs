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
    }
    protected void AllPatientsGridview_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        // Display whether the delete operation succeeded.
        if (e.Exception == null)
        {
            ResultAlert.SetResultAlert("Patient deleted successfully!", TemplateControls_ResultAlert.AlertTypeSuccess);
        }
        else
        {
            ResultAlert.SetResultAlert("An error occured! Please try again later!",
                TemplateControls_ResultAlert.AlertTypeError);
            e.ExceptionHandled = true;
        }
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