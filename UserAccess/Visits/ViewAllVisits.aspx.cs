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

        // set the alert
        var dic = new Dictionary<string, string>();
        dic.Add(RedirectConstants.RedirectVisitDetailsSessionName,
            "You need to select a Visit to view its details");
        dic.Add(RedirectConstants.RedirectAddNewPrescriptionSessionName,
            "You need to view a Visit details to add new Prescription");
        dic.Add(RedirectConstants.RedirectAddNewPrescriptionExistSessionName,
            "You need to select a Visit details with no Prescription");
        dic.Add(RedirectConstants.RedirectAddPrescriptionDetailSessionName,
            "You need to view a Visit details to add Prescription Detail");
        dic.Add(RedirectConstants.RedirectPrescriptionDetailsSessionName,
            "You need to select a Visit details to view Prescription Info");
        dic.Add(RedirectConstants.RedirectPrescriptionDetailInfoSessionName,
            "You need to select a Visit details to view Prescription Details Info");
        dic.Add(RedirectConstants.RedirectAddLabOrderSessionName,
            "You need to view a Visit details to add new Lab Order");
        dic.Add(RedirectConstants.RedirectViewLabOrderSessionName,
            "You need to select a Visit details to view Lab Order Info");
        dic.Add(RedirectConstants.RedirectAddLabOrderDetailSessionName,
            "You need to view a Visit details to add Lab Order Detail");
        dic.Add(RedirectConstants.RedirectLabOrderInfoSessionName,
            "You need to select a Visit details to view Lab Order Details Info");
        RedirectAlert.SetAlert(dic);
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
        RangeDatePicker.ClearForm();

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
        VisitsData.SetStartDate(RangeDatePicker.StartDate);
        VisitsData.SetEndDate(RangeDatePicker.EndDate);
    }
}