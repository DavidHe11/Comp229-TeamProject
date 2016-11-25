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
            string username = Request.QueryString["UserName"];
            int memberid = 104;
            SqlConnection conn = new SqlConnection(@"Data Source=Robert-PC\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");
            
            SqlCommand getemail = new SqlCommand("SELECT Email FROM dbo.Members WHERE UserName= @user", conn);
            SqlCommand getid = new SqlCommand("SELECT MemberID FROM dbo.Members WHERE UserName= @user", conn);

            profileName.Text = username;
            try
            {

                getemail.Parameters.AddWithValue("@user", username);
                getid.Parameters.AddWithValue("@user", username);
                conn.Open();
                EmailID.Text = Convert.ToString(getemail.ExecuteScalar());
                memberid = Convert.ToInt32(getid.ExecuteScalar());
            }

            finally
            {

                conn.Close();
                

            }




        }

    }
}