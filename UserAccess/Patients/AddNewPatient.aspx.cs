using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Patients_AddNewPatient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void InsertButton_Click(object sender, EventArgs e)
    {

        var patientName = ((TextBox)AddPatientFormView.FindControl("NameTextBox")).Text;
        var patientGender = ((DropDownList)AddPatientFormView.FindControl("GenderDropdownList")).SelectedValue;
        var patientAddress = ((TextBox)AddPatientFormView.FindControl("AddressTextbox")).Text;
        var patientDateOfBirth =
            ((TemplateControls_DatePicker)AddPatientFormView.FindControl("DateOfBirthDatePicker")).SelectedDate;

        System.Collections.Specialized.ListDictionary dic = new System.Collections.Specialized.ListDictionary();
        dic.Add("Name", patientName);
        dic.Add("Gender", patientGender);
        dic.Add("Address", patientAddress);
        dic.Add("DateOfBirth", patientDateOfBirth);


        if (AddPatientDataSource.Insert(dic) == 0)
        {
            //fail
            ResultAlert.SetResultAlert("An error occured!",
                TemplateControls_ResultAlert.AlertTypeError);
        }
        else
        {
            // success
            ResultAlert.SetResultAlert("Patient inserted successfully!",
                TemplateControls_ResultAlert.AlertTypeSuccess);
            ClearForm();
        }
    }

    protected void ClearForm()
    {
        ((TextBox)AddPatientFormView.FindControl("NameTextBox")).Text = "";
        ((DropDownList)AddPatientFormView.FindControl("GenderDropdownList")).SelectedIndex = 0;
        ((TextBox)AddPatientFormView.FindControl("AddressTextbox")).Text = "";
        ((TemplateControls_DatePicker)AddPatientFormView.FindControl("DateOfBirthDatePicker")).SelectedDate = DateTime.Now.Ticks;
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void AddPatientFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        // redirect to view patient detail if successful
        if (e.Exception == null)
        {
            Session[RedirectSuccessConstants.RedirectSuccessAddPatient] = "yes";
            Response.Redirect("/UserAccess/Patients/ViewPatientDetails.aspx?ID=" + InsertedPatient.ID);
        }
        else
        {
            // display the result alert
            e.ExceptionHandled = ResultAlert.SetResultAlertReturn("Patient inserted successfully!", e.Exception);
        }
        
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/UserAccess/Patients/ViewAllPatients.aspx");
    }

    protected void AddPatientFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        
    }

    private Patient InsertedPatient;

    protected void AddPatientDataSource_Inserted(object sender, LinqDataSourceStatusEventArgs e)
    {
        // store the inserted patient
        InsertedPatient = (Patient)e.Result;
    }

    protected void AddPatientDataSource_Inserting(object sender, LinqDataSourceInsertEventArgs e)
    {
        // get the date picker control from the form view
        var datePicker = (TemplateControls_DatePicker)AddPatientFormView.FindControl("DateOfBirthDatePicker");

        // set the date of birth of the new patient
        ((Patient)e.NewObject).DateOfBirth = datePicker.SelectedDate;
    }
}