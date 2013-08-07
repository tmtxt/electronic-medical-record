using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_LabOrders_AddNewLabOrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if query string not found
        if (Request.QueryString["LabOrderID"] == null)
        {
            RedirectToViewAllVisits();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["LabOrderID"], out temp))
            {
                // check if the order id exists
                if (new DataClassesDataContext().LabOrders.Where(l => l.ID == long.Parse(Request.QueryString["LabOrderID"])).Count() == 0)
                {
                    RedirectToViewAllVisits();
                }
                else
                {
                    // success, do nothing
                }
            }
            else
            {
                RedirectToViewAllVisits();
            }
        }
    }

    protected void RedirectToViewAllVisits()
    {
        Session[RedirectConstants.RedirectAddLabOrderDetailSessionName] = "yes";
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        var visit = new DataClassesDataContext().Visits.Where(v => v.LabOrders.First().ID == long.Parse(Request.QueryString["LabOrderID"])).First();
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + visit.ID.ToString());
    }

    protected void ClearForm_Click(object sender, EventArgs e)
    {
        ((DropDownList)AddLabOrderDetailFormView.FindControl("MedicalServiceGroupsDropdownList")).SelectedIndex = 0;
        ((TextBox)AddLabOrderDetailFormView.FindControl("ResultTextBox")).Text = "";
    }

    protected void AddlabOrderDetailDataSource_Inserting(object sender, LinqDataSourceInsertEventArgs e)
    {
        // get the new object to be inserted
        var labOrderDetail = (LabOrderDetail)e.NewObject;

        // set the lab order ID
        labOrderDetail.LabOrderID = long.Parse(Request.QueryString["LabOrderID"]);

        // set the medical service ID
        var dl = (DropDownList)AddLabOrderDetailFormView.FindControl("MedicalServicesDropdownList");
        labOrderDetail.MedicalServiceID = long.Parse(dl.SelectedValue);
    }

    protected void AddLabOrderDetailFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // redirect if successfull
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessAddLabOrderDetail] = "yes";
            var visit = new DataClassesDataContext().Visits.Where(v => v.LabOrders.First().ID == long.Parse(Request.QueryString["LabOrderID"])).First();
            Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + visit.ID.ToString());
        }
        else
        {
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("error", e.Exception);
        }
    }
}