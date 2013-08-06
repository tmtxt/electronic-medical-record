using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TemplateControls_RangeDatePicker : System.Web.UI.UserControl
{
    /// <summary>
    /// Get the Start date in long int
    /// </summary>
    public long StartDate
    {
        get
        {
            DateTime result;

            if (DateTime.TryParseExact(StartDateTextBox.Text, StartDateCalendarExtender.Format, null,
                System.Globalization.DateTimeStyles.None, out result))
            {
                // if successfully, return it in ticks
                DateTime t = DateTime.ParseExact(StartDateTextBox.Text, StartDateCalendarExtender.Format, null);
                return t.Ticks;
            }
            else
            {
                // return the minimum value allow
                return long.MinValue;
            }
        }
    }

    /// <summary>
    /// Get the End date in long int
    /// </summary>
    public long EndDate
    {
        get
        {
            DateTime result;

            if (DateTime.TryParseExact(EndDateTextBox.Text, EndDateCalendarExtender.Format, null,
                System.Globalization.DateTimeStyles.None, out result))
            {
                // if successfully, return it in ticks
                DateTime t = DateTime.ParseExact(EndDateTextBox.Text, EndDateCalendarExtender.Format, null);
                return t.Ticks;
            }
            else
            {
                // return the minimum value allow
                return long.MaxValue;
            }
        }
    }

    public void ClearForm()
    {
        StartDateTextBox.Text = "";
        EndDateTextBox.Text = "";
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}