using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_TeamProject.Pages
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Work around for not being able to get authentication to work. will send user to registration page if not authenticated. */
            bool isAuthenticated = (HttpContext.Current.User != null) && HttpContext.Current.User.Identity.IsAuthenticated;

            if (!isAuthenticated)
            {
                Response.Redirect("~/Pages/Registration.aspx");
            }
        }

        protected void srchbtn_Click(object sender, EventArgs e)
        {

        }
    }
}