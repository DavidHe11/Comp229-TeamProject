using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_TeamProject.Pages
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            /*Creates a new user*/
            if (Page.IsValid)

            {
                SqlConnection connection = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");
                SqlCommand addUser = new SqlCommand("INSERT INTO [dbo].[Members([LName],[FName],[DateCreated],[Username],[Email],[Password],[Admin])VALUES('@lastName', '@firstName', '@Date', '@username', '@email', '@pwd', '@admin')", connection);

                addUser.Parameters.Add("@lastName", SqlDbType.NVarChar);
                addUser.Parameters["@lastName"].Value = lastNameTB.Text;

                addUser.Parameters.Add("@firstName", SqlDbType.NVarChar);
                addUser.Parameters["@firstName"].Value = firstNameTB.Text;

                addUser.Parameters.AddWithValue("@Date", DateTime.Now.ToString("yyyy-MM-dd"));

                addUser.Parameters.Add("@username", SqlDbType.NVarChar);
                addUser.Parameters["@username"].Value = regUsernameTB.Text;

                addUser.Parameters.Add("@email", SqlDbType.NVarChar);
                addUser.Parameters["@email"].Value = EmailTB.Text;

                addUser.Parameters.Add("@pwd", SqlDbType.NVarChar);
                addUser.Parameters["@pwd"].Value = regPasswordTB.Text;

                addUser.Parameters.Add("@admin", SqlDbType.NChar);
                addUser.Parameters["@admin"].Value = "n";

                try
                {
                    connection.Open();
                    addUser.BeginExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    WarningLbl.Text = exception.Message.ToString();
                }
                finally
                {
                    connection.Close();
                }

           }
        }
        protected void Login_Click(object sender, EventArgs e)
        {
            /*Check user credentical and login*/
            SqlConnection connection = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");
            SqlCommand checkUser = new SqlCommand("Select Username FROM GameProfile.[dbo].Members WHERE Username = @username", connection);
            SqlCommand checkPassword = new SqlCommand("Select Password FROM GameProfile.[dbo].Members WHERE Username = @username", connection);

            checkUser.Parameters.Add("@username", SqlDbType.NVarChar);
            checkUser.Parameters["@username"].Value = loginUsernameTB.Text;

            checkPassword.Parameters.Add("@username", SqlDbType.NVarChar);
            checkPassword.Parameters["@username"].Value = loginUsernameTB.Text;

            try
            {
                connection.Open();
                string username = checkUser.ExecuteScalar().ToString();
                
                if (username != null && String.Equals(username, loginUsernameTB.Text))
                {
                    string password = checkPassword.ExecuteScalar().ToString();

                    if (password != null && String.Equals(password, loginPasswordTB.Text))
                    {
                        FormsAuthentication.SetAuthCookie(username, true);
                        Response.Redirect("~/Pages/Homepage.aspx");
                    }
                }
                else
                {
                    WarningLblLogin.Text = "No username was found";
                }

            }
            catch (Exception exception)
            {
                WarningLblLogin.Text = exception.Message.ToString();
            }
            finally
            {
                connection.Close();
            }


        }
    }
}