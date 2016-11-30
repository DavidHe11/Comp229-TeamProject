using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Comp229_TeamProject.Pages
{
    public partial class GamePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string gamename = Request.QueryString["GameName"];
            gameNameLbl.Text = gamename;

          
            SqlConnection conn = new SqlConnection(@"Data Source=Robert-PC\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");

            SqlCommand getdesc = new SqlCommand("SELECT GameDesc FROM dbo.Games WHERE GameName= @game", conn);
            SqlCommand getplayers = new SqlCommand("SELECT NumberOfUsers FROM dbo.Games WHERE GameName= @game", conn);
            SqlCommand getrating = new SqlCommand("SELECT Rating FROM dbo.Games WHERE GameName= @game", conn);


            try
            {

                getdesc.Parameters.AddWithValue("@game", gamename);
                getplayers.Parameters.AddWithValue("@game", gamename);
                getrating.Parameters.AddWithValue("@game", gamename);

                conn.Open();
                descLbl.Text = Convert.ToString(getdesc.ExecuteScalar());
                numberOfPlayersLbl.Text = Convert.ToString(getplayers.ExecuteScalar());
                ratingLbl.Text= Convert.ToString(getrating.ExecuteScalar());
                if(string.IsNullOrEmpty(ratingLbl.Text))
                {
                    ratingLbl.Text = ("0");
                }
            }

            finally
            {

                conn.Close();
            }
        }

        //Add game to a users list
        protected void addGameToCollectionBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=Robert-PC\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");
            string username = Request.QueryString["Game"];
            SqlCommand addgame = new SqlCommand("INSERT INTO dbo.GameLine (GameID,MemberID) VALUES(@gamename, @User); ", conn);
            SqlCommand removegame = new SqlCommand("DELETE FROM dbo.GameLine WHERE MemberID = @user AND GameID = @gamename; ", conn);
            //  if (User is logged in)
            //      { 
            //  if (User does not have it)
            //      { 

            try
            {

                addgame.Parameters.AddWithValue("@gamename", username);
                addgame.Parameters.AddWithValue("@user", username);
                
                conn.Open();
                addgame.ExecuteNonQuery();
            }

            finally
            {

                conn.Close();


            }
            /*  if (User does not have it)
                  { 
                      try
            {

                removegame.Parameters.AddWithValue("@gamename", username);
                removegame.Parameters.AddWithValue("@user", username);
                
                conn.Open();
                removegame.ExecuteNonQuery();
            }

            finally
            {

                conn.Close();


            }

             }
             }
             */
        }
    }
}