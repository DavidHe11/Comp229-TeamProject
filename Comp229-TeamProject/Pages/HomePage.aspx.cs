using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_TeamProject.Pages
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Using this because we did not get forms to work, it sends the person to the registration/login page if they are not logged in
            bool checkLoggedIn = (HttpContext.Current.User != null) && (HttpContext.Current.User.Identity.IsAuthenticated);


            if (!checkLoggedIn)
            {
                Response.Redirect("~/Pages/Registration.aspx");
            }*/
        }
    }
}