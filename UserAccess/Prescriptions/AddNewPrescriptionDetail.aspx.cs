using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Prescriptions_AddNewPrescriptionDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if error
        if (Request.QueryString["PrescriptionID"] == null)
        {
            // redirect
            RedirectToViewAllVisit();
        }
        else
        {
            long temp;
            // if parse error
            if (long.TryParse(Request.QueryString["PrescriptionID"], out temp))
            {
                // parse success, check if the prescription id exists
                if (new DataClassesDataContext().Prescriptions.Where(p => p.ID == long.Parse(Request.QueryString["PrescriptionID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisit();
                }
                else
                {
                    // success, do nothing
                }
            }
            else
            {
                // can not parse, redirect
                RedirectToViewAllVisit();
            }
        }
    }

    protected void RedirectToViewAllVisit()
    {
        // set the session variable
        Session[RedirectConstants.RedirectAddPrescriptionDetailSessionName] = "yes";

        // redirect
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ((DropDownList)AddPrescriptionDetailFormView.FindControl("DrugGroupsDropdownList")).SelectedIndex = 0;
        ((TextBox)AddPrescriptionDetailFormView.FindControl("QuantityTextBox")).Text = "";
        ((TextBox)AddPrescriptionDetailFormView.FindControl("DoseTextBox")).Text = "";
        ((TextBox)AddPrescriptionDetailFormView.FindControl("SpecialInstructionTextBox")).Text = "";
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        var visit = new DataClassesDataContext().Visits.Where(v => v.Prescriptions.First().ID == long.Parse(Request.QueryString["PrescriptionID"])).First();
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + visit.ID.ToString());
    }

    protected void AddPrescriptionDetailDataSource_Inserting(object sender, LinqDataSourceInsertEventArgs e)
    {
        // get the new object to be inserted
        var prescriptionDetail = (PrescriptionDetail)e.NewObject;

        // set the prescription ID property for it
        prescriptionDetail.PrescriptionID = long.Parse(Request.QueryString["PrescriptionID"]);

        // set the drug ID property for it
        var dl = (DropDownList)AddPrescriptionDetailFormView.FindControl("DrugsDropdownList");
        prescriptionDetail.DrugID = long.Parse(dl.SelectedValue);
    }

    protected void AddPrescriptionDetailFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // redirect if successful
        if (e.Exception == null)
        {
            // redirect
            Session["RedirectSuccessAddPrescriptionDetail"] = "yes";
            var visit = new DataClassesDataContext().Visits.Where(v => v.Prescriptions.First().ID == long.Parse(Request.QueryString["PrescriptionID"])).First();
            Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + visit.ID.ToString());
        }
        else
        {
            // set the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Prescription Detail inserted successfully!", e.Exception);
        }

        
    }
}