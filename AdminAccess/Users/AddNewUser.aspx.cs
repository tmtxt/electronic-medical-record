using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAccess_AddNewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

        }
        catch (MembershipCreateUserException ex)
        {
        }
    }

    protected void ClearForm()
    {
        UsernameTextbox.Text = "";
        PasswordTexbox.Text = "";
        RetypePasswordTextbox.Text = "";
        EmailTextbox.Text = "";
    }

    protected void AddUserButton_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
        try
        {
            // create user
            MembershipUser user = Membership.CreateUser(UsernameTextbox.Text, PasswordTexbox.Text, EmailTextbox.Text);

            // add user to role
            Roles.AddUserToRole(user.UserName, RoleDropdownList.SelectedValue);

            // display the result
            ResultLabel.Text = "User created successfully.";
            ResultDiv.Attributes["class"] = "alert alert-success";
            ClearForm();
        }
        catch (MembershipCreateUserException ex)
        {
            ResultLabel.Text = GetErrorMessage(ex.StatusCode);
            ResultDiv.Attributes["class"] = "alert alert-error";
        }
    }

    // Copy from Microsoft's document
    // http://msdn.microsoft.com/en-us/library/system.web.security.membershipcreateuserexception.statuscode.aspx
    public string GetErrorMessage(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "Username already exists. Please enter a different user name.";

            case MembershipCreateStatus.DuplicateEmail:
                return "A username for that e-mail address already exists. Please enter a different e-mail address.";

            case MembershipCreateStatus.InvalidPassword:
                return "The password provided is invalid.<br/>Password must be at least 7 characters long and contain at least 1 non-alphanumeric character";

            case MembershipCreateStatus.InvalidEmail:
                return "The e-mail address provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidAnswer:
                return "The password retrieval answer provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidQuestion:
                return "The password retrieval question provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidUserName:
                return "The user name provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.ProviderError:
                return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            case MembershipCreateStatus.UserRejected:
                return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            default:
                return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
        }
    }

}