using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_TeamProject.Pages
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Work around for not being able to get authentication to work. will send user to registration page if not authenticated. */
            bool isAuthenticated = (HttpContext.Current.User != null) && HttpContext.Current.User.Identity.IsAuthenticated;

            if (!isAuthenticated)
            {
                Response.Redirect("~/Pages/Registration.aspx");
            }





            /*Loads the page with the specific member information*/

            string username = "oops";

            if (((SiteMaster)this.Master).clicked == true )
                {
                username = HttpContext.Current.User.Identity.Name;
                }
            else
                {
               username = Request.QueryString["UserName"];
                }
            string memberid = null;
            SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");
            
            SqlCommand getemail = new SqlCommand("SELECT Email FROM dbo.Members WHERE UserName= @user", conn);
            SqlCommand getid = new SqlCommand("SELECT MemberID FROM dbo.Members WHERE UserName= @user", conn);

            profileName.Text = username;
            try
            {

                getemail.Parameters.AddWithValue("@user", username);
                getid.Parameters.AddWithValue("@user", username);
                conn.Open();
                EmailID.Text = Convert.ToString(getemail.ExecuteScalar());
                memberid = Convert.ToString(getid.ExecuteScalar());
                gamesowned.SelectParameters["MemberID"].DefaultValue = memberid;
            }

            finally
            {

                conn.Close();
                

            }




        }

        protected void editbtn_Click(object sender, EventArgs e)
        {
           
        }

        protected void submitbtn_Click(object sender, EventArgs e)
        {
            //update user
            string user = Request.QueryString["UserName"];
            string fname = Fnamebx.Text;
            string lname = Lnamebx.Text;
            string email = emailbx.Text;
            SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");

            SqlCommand updateuser = new SqlCommand("UPDATE Members SET Fname = @fname, Lname = @fname,Email = @email WHERE Username = @user", conn);
            
            try
            {


                updateuser.Parameters.AddWithValue("@fname", fname);
                updateuser.Parameters.AddWithValue("@lname", lname);
                updateuser.Parameters.AddWithValue("@email", email);
                updateuser.Parameters.AddWithValue("@user", user);

                conn.Open();
                updateuser.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }

            finally
            {

                conn.Close();


            }
        }
    }
}