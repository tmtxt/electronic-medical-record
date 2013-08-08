using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Visits_ViewVisitDetails : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        // redirect if no query string found
        if (Request.QueryString["ID"] == null)
        {
            // set the session variable
            Session[RedirectConstants.RedirectVisitDetailsSessionName] = "yes";

            // redirect to view all patients page
            Response.Redirect("/UserAccess/Visits/ViewAllVisits.aspx");
        }

        Dictionary<string, string> successDictionary = new Dictionary<string, string>();
        successDictionary.Add(RedirectSuccessConstants.RedirectSuccessAddNewPrescription,
            "Prescription inserted successfully!");
        successDictionary.Add(RedirectSuccessConstants.RedirectSuccessAddPrescriptionDetail,
            "Prescription Detail inserted successfully!");
        successDictionary.Add(RedirectSuccessConstants.RedirectSuccessDeletePrescription,
            "Prescription deleted successfully!");
        successDictionary.Add(RedirectSuccessConstants.RedirectSuccessDeletePrescriptionDetail,
            "Prescription Detail deleted successfully!");
        successDictionary.Add(RedirectSuccessConstants.RedirectSuccessAddLabOrder,
            "Lab Order inserted successfully!");
        successDictionary.Add(RedirectSuccessConstants.RedirectSuccessAddLabOrderDetail,
            "Lab Order Detail inserted successfuly!");
        successDictionary.Add(RedirectSuccessConstants.RedirectSuccessDeleteLabOrderDetail,
            "Lab Order Detail deleted successfully!");
        successDictionary.Add(RedirectSuccessConstants.RedirectSuccessDeleteLabOrder,
            "Lab Order deleted successfully!");
        RedirectSuccessAlert.SetAlert(successDictionary);

        Dictionary<string, string> infoDictionary = new Dictionary<string, string>();
        infoDictionary.Add(RedirectConstants.RedirectVisitDetailAddLabOrderDetailSessionName,
            "You need to add Lab Order before adding Lab Order Detail");
        infoDictionary.Add(RedirectConstants.RedirectVisitDetailAddPrescriptionDetailSessionName,
            "You need to add Prescription before adding Prescription Detail");
        RedirectAlert.SetAlert(infoDictionary);

    }

    protected void VisitDetailsFormView_ModeChanging(object sender, FormViewModeEventArgs e)
    {

    }

    protected void VisitDetailsFormView_PageIndexChanged(object sender, EventArgs e)
    {

    }

    protected void VisitDetailsFormView_ModeChanged(object sender, EventArgs e)
    {

        //if (VisitDetailsFormView.CurrentMode == FormViewMode.Edit)
        //{
        //    VisitDetailsFormView.DataBind();


        //}
    }

    protected void ICDChapterDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // get the ICD drop down list
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // rebind data for it
        dl.DataBind();
    }

    protected void ICDDropdownList_DataBound(object sender, EventArgs e)
    {
        // get the linq data source of the ICD drop down list
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // set the selected value of the ICD drop down list
        // dl.SelectedValue = ((Visit)VisitDetailsFormView.DataItem).ICDID.ToString();
        if (VisitDetailsFormView.DataItem != null)
        {
            if (dl.Items.FindByValue(((Visit)VisitDetailsFormView.DataItem).ICDID.ToString()) == null)
            {
                // do nothing, leave the selected value by default
            }
            else
            {
                dl.Items.FindByValue(((Visit)VisitDetailsFormView.DataItem).ICDID.ToString()).Selected = true;
            }
        }

    }

    protected void VisitDetailsFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
    }

    protected void VisitDetailsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // delete all its dependencies first
        VisitOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void VisitDetailsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        // print the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Visit deleted successfully!", e.Exception);
    }

    protected void VisitDetailsFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Visit updated successfully!", e.Exception);
    }

    protected void VisitDetailsDataSource_Updating(object sender, LinqDataSourceUpdateEventArgs e)
    {
        var newObject = (Visit)e.NewObject;

        // get the ICD drop down list from the formview
        var dl = (DropDownList)VisitDetailsFormView.FindControl("ICDDropdownList");

        // set the ICDID for the new object to be updated
        newObject.ICDID = long.Parse(dl.SelectedValue);

        // get the date picker from the formview
        var date = ((TemplateControls_DatePicker)VisitDetailsFormView.FindControl("DatePicker")).SelectedDate;

        // set the new date for the visit
        newObject.Date = date;
    }

    protected void AddNewButton_Click(object sender, EventArgs e)
    {
        var patientID = ((HiddenField)VisitDetailsFormView.FindControl("PatientIDField")).Value;
        Response.Redirect("AddNewVisit.aspx?PatientID=" + patientID);
    }

    protected void PrescriptionDetailsGridView_DataBinding(object sender, EventArgs e)
    {
        // set the where condition for the prescription details grid view
        if (VisitDetailsFormView.DataItem == null)
        {
            PrescriptionDetailsDataSource.Where = "PrescriptionID = 0";
        }
        else
        {
            if (PrescriptionFormView.DataItem == null)
            {
                PrescriptionDetailsDataSource.Where = "PrescriptionID = 0";
            }
            else
            {
                var prescription = (Prescription)PrescriptionFormView.DataItem;
                PrescriptionDetailsDataSource.Where = "PrescriptionID = " + prescription.ID;
            }
        }
    }

    protected void PrescriptionFormView_DataBound(object sender, EventArgs e)
    {
        var myctx = new DataClassesDataContext();
        if (PrescriptionFormView.DataItem == null)
        {
            // just do nothing
        }
        else
        {
            var lbl = (Label)PrescriptionFormView.FindControl("TotalDrugPriceLabel");
            var prescription = (Prescription)PrescriptionFormView.DataItem;

            if (prescription.PrescriptionDetails.Count() == 0)
            {
                lbl.Text = "0 USD";
            }
            else
            {
                var prescriptionID = prescription.ID;
                
                var totalPrice = (from p in myctx.PrescriptionDetails
                                  join d in myctx.Drugs
                                  on p.DrugID equals d.ID
                                  where p.PrescriptionID == prescriptionID
                                  group p by p.ID into g
                                  select new { SumEach = g.Sum(p => p.Quantity * p.Drug.Price) })
                                 .Sum(p => p.SumEach).ToString();
                lbl.Text = totalPrice + " USD";
            }
        }
        
    }

    protected void LabOrderFormView_DataBound(object sender, EventArgs e)
    {
        var myctx = new DataClassesDataContext();
        if (LabOrderFormView.DataItem == null)
        {
            // just do nothing
        }
        else
        {
            var lbl = (Label)LabOrderFormView.FindControl("TotalLabOrderPriceLabel");
            var labOrder = (LabOrder)LabOrderFormView.DataItem;

            if (labOrder.LabOrderDetails.Count() == 0)
            {
                lbl.Text = "0 USD";
            }
            else
            {
                var labOrderID = labOrder.ID;

                var totalPrice = (from l in myctx.LabOrderDetails
                                  join m in myctx.MedicalServices
                                  on l.MedicalServiceID equals m.ID
                                  where l.LabOrderID == labOrderID
                                  group l by l.ID into g
                                  select new { SumEach = g.Sum(l => l.MedicalService.Price) })
                                 .Sum(l => l.SumEach).ToString();
                lbl.Text = totalPrice + " USD";
            }
        }
    }

    protected void LabOrderDetailsGridView_DataBinding(object sender, EventArgs e)
    {
        // set the where condition for the lab order details grid view
        if (VisitDetailsFormView.DataItem == null)
        {
            LabOrderDetailsDataSource.Where = "LabOrderID = 0";
        }
        else
        {
            if (LabOrderFormView.DataItem == null)
            {
                LabOrderDetailsDataSource.Where = "LabOrderID = 0";
            }
            else
            {
                var labOrder = (LabOrder)LabOrderFormView.DataItem;
                LabOrderDetailsDataSource.Where = "LabOrderID = " + labOrder.ID;
            }
        }
    }

    protected void AddNewPrescriptionButton_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)
        {
            // do nothing
        }
        else
        {
            var visitID = Request.QueryString["ID"];
            Response.Redirect("/UserAccess/Prescriptions/AddNewPrescription.aspx?VisitID=" + visitID);
        }
    }

    protected void AddNewPrescriptionDetailButton_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)
        {
            // do nothing
        }
        else
        {
            // get prescription belong to this visit
            var prescriptions = new DataClassesDataContext().Prescriptions.Where(p => p.VisitID == long.Parse(Request.QueryString["ID"]));
            if (prescriptions.Count() == 0)
            {
                // display the alert that user need to add prescription first
                Session[RedirectConstants.RedirectVisitDetailAddPrescriptionDetailSessionName] = "yes";

                // redirect to itself
                Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + Request.QueryString["ID"]);
            }
            else
            {
                // redirect to to add new prescription detail page
                Response.Redirect("/UserAccess/Prescriptions/AddNewPrescriptionDetail.aspx?PrescriptionID=" + prescriptions.First().ID);
            }
        }
    }

    protected void DetailsButton_Click(object sender, EventArgs e)
    {
        // get the prescription ID from the visit
        var prescriptionID = new DataClassesDataContext().Prescriptions.Where(p => p.VisitID == long.Parse(Request.QueryString["ID"])).First().ID;
        

        // redirect to the prescription detail page
        Response.Redirect("/UserAccess/Prescriptions/ViewPrescriptionInfo.aspx?ID=" + prescriptionID.ToString());
    }

    protected void PrescriptionFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        // rebind the data for the prescription detail grid view
        PrescriptionDetailsGridView.DataBind();

        // display the result alert
        e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Prescription deleted successfully!", e.Exception);
    }

    protected void PrescriptionFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // delete all this prescription's dependencies
        PrescriptionOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void AddNewLabOrderButton_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)
        {
            // do nothing
        }
        else
        {
            var visitID = Request.QueryString["ID"];
            Response.Redirect("/UserAccess/LabOrders/AddNewLabOrder.aspx?VisitID=" + visitID);
        }
    }

    protected void DetailsLabOrderButton_Click(object sender, EventArgs e)
    {
        // get the lab order ID from the visit
        var labOrderID = new DataClassesDataContext().LabOrders.Where(l => l.VisitID == long.Parse(Request.QueryString["ID"])).First().ID;


        // redirect to the prescription detail page
        Response.Redirect("/UserAccess/LabOrders/ViewLabOrderInfo.aspx?ID=" + labOrderID.ToString());
    }

    protected void AddLabOrderDetailButton_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)
        {
            // do nothing
        }
        else
        {
            // get lab order belong to this visit
            var laborders = new DataClassesDataContext().LabOrders.Where(l => l.VisitID == long.Parse(Request.QueryString["ID"]));
            if (laborders.Count() == 0)
            {
                // display the alert that user need to add lab order first
                Session[RedirectConstants.RedirectVisitDetailAddLabOrderDetailSessionName] = "yes";

                // redirect to itself
                Response.Redirect("/UserAccess/Visits/ViewVisitDetails.aspx?ID=" + Request.QueryString["ID"]);
            }
            else
            {
                // redirect to to add new lab order detail page
                Response.Redirect("/UserAccess/LabOrders/AddNewLabOrderDetail.aspx?LabOrderID=" + laborders.First().ID);
            }
        }
    }

    protected void LabOrderFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // delete all this lab order dependencies
        LabOrderOperations.DeleteDependencies(long.Parse(e.Keys["ID"].ToString()));
    }

    protected void LabOrderFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        // rebind data for the lab order detail grid view
        LabOrderDetailsGridView.DataBind();

        // display the result alert
        e.ExceptionHandled = ResultAlertBottom.SetResultAlertReturn("Lab Order deleted successfully!", e.Exception);
    }
}