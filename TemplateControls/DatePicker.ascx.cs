using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TemplateControls_DatePicker : System.Web.UI.UserControl
{
    /// <summary>
    /// whether this date is required or not, used for validation
    /// default value is true
    /// </summary>
    public bool IsRequired { get; set; }

    public long InitialDate { get; set; }
    public long SelectedDate
    {
        get
        {
            DateTime result;

            // try parse the date first
            if (DateTime.TryParseExact(DateOfBirthTextBox.Text, DateOfBirthCalendarExtender.Format, null, System.Globalization.DateTimeStyles.None, out result))
            {
                // if successfully, return it in ticks
                DateTime t = DateTime.ParseExact(DateOfBirthTextBox.Text, DateOfBirthCalendarExtender.Format, null);
                return t.Ticks;
            }
            else
            {
                // throw new exception
                throw new Exception("Bad Date format! Please try again");
            }
        }
        set
        {
            DateOfBirthTextBox.Text = DateTime.FromBinary(value).ToString("dd/MMM/yyyy");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // set selected date if initial date is null

        // required field validation
        if (IsRequired)
        {
            DateOfBirthTextBoxValidator.Enabled = true;
        }
        else
        {
            DateOfBirthTextBoxValidator.Enabled = false;
        }
    }
}