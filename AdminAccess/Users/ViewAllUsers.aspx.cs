using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAccess_ViewAllUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
        
    }

    protected void AllUsersGridViewRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        AllUsersGridView.EditIndex = -1;
        BindGridView();
    }

    protected void AllUsersGridViewRowEditing(object sender, GridViewEditEventArgs e)
    {
        AllUsersGridView.EditIndex = e.NewEditIndex;
        BindGridView();
    }

    protected void AllUsersGridViewRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        var username = AllUsersGridView.Rows[e.RowIndex].Cells[0].Text;
        Membership.DeleteUser(username);
        ResultLabel.Text = string.Format("<strong>{0}</strong> details deleted Successfully", username);
        ResultDiv.Attributes["class"] = "alert alert-success";
        BindGridView();
    }

    protected void AllUsersGridViewRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        // get the value from the gridview
        int index = AllUsersGridView.EditIndex;
        GridViewRow gvrow = AllUsersGridView.Rows[index];
        var username = AllUsersGridView.Rows[e.RowIndex].Cells[0].Text;
        var email = ((TextBox)gvrow.Cells[1].Controls[0]).Text;
        var role = ((DropDownList)gvrow.Cells[2].FindControl("RoleDropdownList")).SelectedValue;

        // get the user to be edit
        MembershipUser user = Membership.GetUser(username);

        if (user != null)
        {
            if (Membership.GetUserNameByEmail(email) != null && Membership.GetUserNameByEmail(email) != user.UserName)
            {
                // email already exist
                ResultLabel.Text = "Email is already exist!";
                ResultDiv.Attributes["class"] = "alert alert-error";
            }
            else
            {
                // email not exist, can update
                user.Email = email;
                Membership.UpdateUser(user);

                // remove user from old role and add user to the new role
                Roles.RemoveUserFromRole(user.UserName, Roles.GetRolesForUser(user.UserName)[0]);
                Roles.AddUserToRole(user.UserName, role);

                // display the result
                ResultLabel.Text = string.Format("<strong>{0}</strong> details updated Successfully", username);
                ResultDiv.Attributes["class"] = "alert alert-success";
            }
            
        }
        AllUsersGridView.EditIndex = -1;
        BindGridView();
    }

    protected void BindGridView()
    {
        AllUsersGridView.DataSource = Membership.GetAllUsers();
        AllUsersGridView.DataBind();
    }
}