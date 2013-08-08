using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_LabOrders_ViewLabOrderInfo : System.Web.UI.Page
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
                // redirect if ID not found
                if (new DataClassesDataContext().LabOrders.Where(l => l.ID == long.Parse(Request.QueryString["ID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisits();
                }
                else
                {
                    // OK, set the visit ID to the property
                    VisitID = new DataClassesDataContext().Visits.Where(v => v.LabOrders.First().ID == long.Parse(Request.QueryString["ID"])).First().ID;
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
        Session[RedirectConstants.RedirectViewLabOrderSessionName] = "yes";
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void ViewVisitButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
    }

    protected void LabOrderInfoDataSource_Updating(object sender, LinqDataSourceUpdateEventArgs e)
    {
        var labOrder = (LabOrder)e.NewObject;

        // set the order date
        var date = ((TemplateControls_DatePicker)LabOrderInfoFormView.FindControl("DatePicker")).SelectedDate;
        labOrder.Date = date;
    }

    protected void LabOrderInfoFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Lab Order updated successfully!", e.Exception);
    }

    protected void LabOrderInfoFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all this lab order's dependencies
        LabOrderOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void LabOrderInfoFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        // redirect to the view visit detail page
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessDeleteLabOrder] = "yes";
            Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + VisitID.ToString());
        }
        else
        {
            // display the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("error", e.Exception);
        }
    }
}