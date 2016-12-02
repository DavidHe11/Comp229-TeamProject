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
                SqlCommand addUser = new SqlCommand("INSERT INTO Members(DateCreated, Username, Email, Password) VALUES (@Date, @username, @email, @pwd)", connection);

                addUser.Parameters.AddWithValue("@Date", DateTime.Now);

                addUser.Parameters.Add("@username", SqlDbType.NVarChar);
                addUser.Parameters["@username"].Value = regUsernameTB.Text;

                addUser.Parameters.Add("@email", SqlDbType.NVarChar);
                addUser.Parameters["@email"].Value = EmailTB.Text;

                addUser.Parameters.Add("@pwd", SqlDbType.NVarChar);
                addUser.Parameters["@pwd"].Value = regPasswordTB.Text;

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
            SqlCommand checkUser = new SqlCommand("Select Username FROM Members WHERE Username = @username");
            SqlCommand checkPassword = new SqlCommand("Select Password FROM Members WHERE Username = @username");

            checkUser.Parameters.Add("@username", SqlDbType.NVarChar);
            checkUser.Parameters["@name"].Value = loginUsernameTB.Text;

            checkPassword.Parameters.Add("@username", SqlDbType.NVarChar);
            checkPassword.Parameters["@name"].Value = loginUsernameTB.Text;

            try
            {
                connection.Open();
                string username = checkUser.ExecuteScalar().ToString();
                
                if (username != null && String.Equals(username, loginUsernameTB.Text))
                {
                    string password = checkPassword.ExecuteScalar().ToString();

                    if (password != null && String.Equals(password, loginPasswordTB.Text))
                    {
                        FormsAuthentication.RedirectFromLoginPage(username, false);
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