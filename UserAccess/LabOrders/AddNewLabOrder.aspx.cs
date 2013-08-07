using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_LabOrders_AddNewLabOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if error query string not found
        if (Request.QueryString["VisitID"] == null)
        {
            // redirect
            RedirectToViewAllVisits();
        }
        else
        {
            long temp;
            // redirect if cannot parse
            if (long.TryParse(Request.QueryString["VisitID"], out temp))
            {
                // redirect if visit ID not found
                if ((new DataClassesDataContext()).Visits.Where(v => v.ID == long.Parse(Request.QueryString["VisitID"])).Count() == 0)
                {
                    // redirect
                    RedirectToViewAllVisits();
                }
                else
                {
                    // OK
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
        Session[RedirectConstants.RedirectAddLabOrderSessionName] = "yes";
        Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID="
            + Request.QueryString["VisitID"]);
    }

    protected void AddLabOrderDataSource_Inserting(object sender, LinqDataSourceInsertEventArgs e)
    {
        var labOrder = (LabOrder)e.NewObject;

        // set the visit ID for the new lab order
        labOrder.VisitID = long.Parse(Request.QueryString["VisitID"]);

        // set the order date for the new lab order
        labOrder.Date = ((TemplateControls_DatePicker)AddLabOrderFormView.FindControl("DatePicker")).SelectedDate;
    }

    protected void AddLabOrderFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        if (e.Exception == null)
        {
            // set the session value
            Session[RedirectSuccessConstants.RedirectSuccessAddLabOrder] = "yes";

            Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID="
            + Request.QueryString["VisitID"]);
        }
        else
        {
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Lab Order inserted successfully!", e.Exception);
        }
        
    }

    protected void AddLabOrderFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // set the visit ID for the new lab order
        e.Values["VisitID"] = long.Parse(Request.QueryString["VisitID"]);

        // set the order date for the new lab order
        e.Values["Date"] = ((TemplateControls_DatePicker)AddLabOrderFormView.FindControl("DatePicker")).SelectedDate;

        // set the doctor ID
        e.Values["DoctorID"] = ((DropDownList)AddLabOrderFormView.FindControl("DoctorsDropdownList")).SelectedValue;
    }
}