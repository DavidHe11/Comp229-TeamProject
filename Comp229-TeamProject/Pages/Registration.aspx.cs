using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_TeamProject.Pages
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=Robert-PC\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {

        }
        protected void Login_Click(object sender, EventArgs e)
        {

        }

        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            //LOGIN

        }

        protected void Unnamed5_Click(object sender, EventArgs e)
        {
            //REGISTER
            string placeholder = null;
           
            

            SqlCommand register = new SqlCommand("INSERT INTO GameProfile.[dbo].Members(Lname,FName,DateCreated,Username,Email, Password)VALUES('@Lname', '@Fname', GETDATE(), '@Username', '@Email', '@Password'); ", conn);
          

           //if (username does not exist, and email does not exist) {
            try
            {

                register.Parameters.AddWithValue("@Lname", placeholder);
                register.Parameters.AddWithValue("@Fname", placeholder);
                register.Parameters.AddWithValue("@Username", placeholder);
                register.Parameters.AddWithValue("@Password", placeholder);
                conn.Open();
                register.ExecuteNonQuery();
            }

            finally
            {

                conn.Close();


            }
            //}
        }
    }
}