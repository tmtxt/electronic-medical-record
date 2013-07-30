using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Thread.CurrentPrincipal.Identity.IsAuthenticated)
        {
            if(Thread.CurrentPrincipal.IsInRole("admin"))
            {
                Response.Redirect("/AdminAccess/Default.aspx");
            }
            else
            {
                Response.Redirect("/UserAccess/Default.aspx");
            }
        }
        else
        {
            Response.Redirect("/Login.aspx");   
        }
        
    }
}