using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TemplateControls_ResultAlert : System.Web.UI.UserControl
{
    public const string ResultMessageUpdateSuccessfully = "Update successfully.";
    public const string ResultMessageUpdateFail = "An error occur! Update fail";
    public const string ResultMessageDeleteSuccessfully = "Delete successfully.";
    public const string ResultMessageDeleteFail = "An error occur! Delete fail";

    public const string AlertTypeSuccess = "success";
    public const string AlertTypeError = "error";

    protected void Page_Load(object sender, EventArgs e)
    {
        ClearResultAlert();
    }

    /// <summary>
    /// Alert the result to the user
    /// </summary>
    /// <param name="message">Message to display, can get from this class's const strings or can be a custom message</param>
    /// <param name="alertType">Can get from static strings of this class</param>
    public void SetResultAlert(string message, string alertType)
    {
        ResultLabel.Text = message;
        if (alertType == AlertTypeSuccess)
        {
            ResultDiv.Style["display"] = "block";
            ResultDiv.Attributes["class"] = "alert alert-success";
        }
        else
        {
            ResultDiv.Style["display"] = "block";
            ResultDiv.Attributes["class"] = "alert alert-error";
        }
    }

    public void ClearResultAlert()
    {
        ResultLabel.Text = "";
        ResultDiv.Style["display"] = "none";
    }
}