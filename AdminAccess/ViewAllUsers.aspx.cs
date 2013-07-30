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
        var username = AllUsersGridView.Rows[e.RowIndex].Cells[1].Text;
        Membership.DeleteUser(username);
        lblResult.Text = string.Format("{0} Details deleted Successfully", username);
        lblResult.ForeColor = Color.Green;
        BindGridView();
    }

    protected void AllUsersGridViewRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int index = AllUsersGridView.EditIndex;
        GridViewRow gvrow = AllUsersGridView.Rows[index];
        var username = AllUsersGridView.Rows[e.RowIndex].Cells[1].Text;
        var email = ((TextBox)gvrow.Cells[2].Controls[0]).Text;
        MembershipUser user = Membership.GetUser(username);
        if (user != null)
        {
            user.Email = email;
            Membership.UpdateUser(user);
            lblResult.Text = string.Format("{0} Details updated Successfully", username);
            lblResult.ForeColor = Color.Green;
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