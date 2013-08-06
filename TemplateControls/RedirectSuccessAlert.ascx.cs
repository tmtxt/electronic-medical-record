using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


/// <summary>
/// This class is used for displaying the alert when user being redirected from another page
/// Usage: put this control into where you want the alert to be display. In the Page_Load() function
/// of that page call the SetAlert() method
/// </summary>
public partial class TemplateControls_RedirectAlert : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// Set the redirect alert with the input message based on the session name
    /// object with name sessionName is null, hide the alert, otherwise, show it.
    /// </summary>
    /// <param name="message"></param>
    /// <param name="sessionName"></param>
    public void SetAlert(string message, string sessionName)
    {
        if (Session[sessionName] != null)
        {
            ShowAlert(message);
            Session.Remove(sessionName);
        }
        else
        {
            HideAlert();
        }
    }

    /// <summary>
    /// Set the redirect alert
    /// Loop through all the input dictionary to find if any session name exist, display the corresponding message
    /// </summary>
    /// <param name="sessionMessage">Key is the Session Name, Value is the message</param>
    public void SetAlert(Dictionary<string, string> sessionMessage)
    {
        bool hideAlert = true;

        foreach (var item in sessionMessage)
        {
            if (Session[item.Key] != null)
            {
                ShowAlert(item.Value);
                Session.Remove(item.Key);
                hideAlert = false;
            }
        }

        if (hideAlert)
        {
            HideAlert();
        }
    }

    private void ShowAlert(string message)
    {
        // set the style for the div to show the alert
        RedirectFromDetailsDiv.Style["display"] = "block";

        // set the message to display
        RedirectLabel.Text = message;
    }

    private void HideAlert()
    {
        // hide the alert
        RedirectFromDetailsDiv.Style["display"] = "none";
    }
}