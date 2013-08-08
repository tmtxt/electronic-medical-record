using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_LabOrders_ViewLabOrderDetailInfo : System.Web.UI.Page
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

                if (new DataClassesDataContext().LabOrderDetails.Where(l => l.ID == long.Parse(Request.QueryString["ID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisits();
                }
                else
                {
                    // OK
                    // store the visit ID
                    VisitID = (new DataClassesDataContext()).LabOrderDetails.Where(l => l.ID == long.Parse(Request.QueryString["ID"])).First().LabOrder.VisitID;
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
        Session[RedirectConstants.RedirectLabOrderInfoSessionName] = "yes";
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void ViewVisitButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
    }

    protected void LabOrderDetailInfoFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessDeleteLabOrderDetail] = "yes";
            Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
        }
        else
        {
            // print the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("error", e.Exception);
        }
    }

    protected void MedicalServicesDropdownList_DataBound(object sender, EventArgs e)
    {
        // get the medical service dropdown list
        var dl = (DropDownList)LabOrderDetailInfoFormView.FindControl("MedicalServicesDropdownList");

        // set the selected value for the dropdown list
        var medicalServiceID = (new DataClassesDataContext()).LabOrderDetails.Where(l => l.ID == long.Parse(Request.QueryString["ID"])).First().MedicalServiceID.ToString();
        if (dl.Items.FindByValue(medicalServiceID) == null)
        {
            // do nothing, leave the default selected value
        }
        else
        {
            dl.Items.FindByValue(medicalServiceID).Selected = true;
        }
    }

    protected void LabOrderDetailInfoFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // set the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Lab Order Detail updated successfully!", e.Exception);
    }

    protected void LabOrderDetailInfoFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // set the medical service ID for the new object
        var medicalServiceID = long.Parse(((DropDownList)LabOrderDetailInfoFormView.FindControl("MedicalServicesDropdownList")).SelectedValue);
        e.NewValues["MedicalServiceID"] = medicalServiceID;
    }
}