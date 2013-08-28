using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAccess_Hospitals_ViewAllHospitals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// talk the to the web service to update the data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        AllHospitalsGridView.DataBind();
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        var hospitalNameDataSource = (from h in new DataClassesDataContext().Hospitals
                                    where h.Name.Contains(prefixText)
                                    select h.Name).ToArray();
        return hospitalNameDataSource;
    }

    protected void FindHospitalButton_Click(object sender, EventArgs e)
    {
        // set the search criteria
        SetSearchCriteria();

        // rebind the data
        AllHospitalsGridView.DataBind();
    }

    /// <summary>
    /// Set the search criteria for doctor list
    /// </summary>
    protected void SetSearchCriteria()
    {
        HospitalData.SearchHospitalName = FindHospitalTextBox.Text;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        // empty the textbox
        FindHospitalTextBox.Text = "";

        // set the search criteria
        SetSearchCriteria();

        // rebind the data
        AllHospitalsGridView.DataBind();
    }
}