using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Prescriptions_ViewPrescriptionDetailInfo : System.Web.UI.Page
{
    private long VisitID { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
        if (Request.QueryString["ID"] == null)
        {
            // redirect
            RedirectToViewAllVisits();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["ID"], out temp))
            {
                // redirect if id not found

                if (new DataClassesDataContext().PrescriptionDetails.Where(p => p.ID == long.Parse(Request.QueryString["ID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisits();
                }
                else
                {
                    // OK
                    // store the visit ID
                    VisitID = (new DataClassesDataContext()).PrescriptionDetails.Where(pd => pd.ID == long.Parse(Request.QueryString["ID"])).First().Prescription.VisitID;
                }
            }
            else
            {
                // redirect
                RedirectToViewAllVisits();
            }
        }
    }

    protected void RedirectToViewAllVisits()
    {
        Session[RedirectConstants.RedirectPrescriptionDetailInfoSessionName] = "yes";
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void ViewVisitButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
    }

    protected void PrescriptionDetailInfoFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessDeletePrescriptionDetail] = "yes";
            Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
        }
        else
        {
            // print the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("error", e.Exception);
        }
    }

    protected void DrugsDropdownList_DataBound(object sender, EventArgs e)
    {
        // get the drug dropdown list
        var dl = (DropDownList)PrescriptionDetailInfoFormView.FindControl("DrugsDropdownList");

        // set the selected value for the dropdown list
        var drugID = (new DataClassesDataContext()).PrescriptionDetails.Where(p => p.ID == long.Parse(Request.QueryString["ID"])).First().DrugID.ToString();
        if (dl.Items.FindByValue(drugID) == null)
        {
            // do nothing, leave the default selected value
        }
        else
        {
            dl.Items.FindByValue(drugID).Selected = true;
        }
    }
}