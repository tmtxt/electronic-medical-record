using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccess_Users_EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ThemeDropDownList.SelectedValue = Profile.Theme;
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        Profile.Theme = ThemeDropDownList.SelectedValue;
    }
}