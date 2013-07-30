using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0)
        {
            if (Request.QueryString["ReturnUrl"] != null)
            {
                if (Request.QueryString["ReturnUrl"].Contains("AdminAccess"))
                {
                    AdminAccessAlert.Style["display"] = "block";
                }
                else if (Request.QueryString["ReturnUrl"].Contains("UserAccess"))
                {
                    UserAccessAlert.Style["display"] = "block";
                }
            }
            else
            {
                ResetAlert();
            }
        }
    }

    private void ResetAlert()
    {
        LoginFailAlert.Style["display"] = "none";
        AdminAccessAlert.Style["display"] = "none";
        UserAccessAlert.Style["display"] = "none";
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        ResetAlert();
        if(Membership.ValidateUser(UsernameTextbox.Text, PasswordTextbox.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(UsernameTextbox.Text, RememberPasswordCheckbox.Checked);
        }
        else
        {
            LoginFailAlert.Style["display"] = "block";
        }
    }
}