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
            bool checkAnonymous = (HttpContext.Current.User != null) && (HttpContext.Current.User.Identity.IsAuthenticated);


            if (checkAnonymous)
            {

            }


            /*Loads the page with the specific game information*/
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
            string placeholder = null;
            SqlCommand addgame = new SqlCommand("INSERT INTO dbo.GameLine (GameID,MemberID) VALUES(@gamename, @User); ", conn);
            SqlCommand removegame = new SqlCommand("DELETE FROM dbo.GameLine WHERE MemberID = @user AND GameID = @gamename; ", conn);
            SqlCommand gameadduser = new SqlCommand("UPDATE Games SET NumberofUsers = NumberofUsers + 1 WHERE GameID = @GameID ", conn);
            SqlCommand gameremoveuser = new SqlCommand("UPDATE Games SET NumberofUsers = NumberofUsers - 1 WHERE GameID = @GameID ", conn);

            //  if (User is logged in)
            //      { 
            //  if (User does not have it)
            //      { 

            try
            {

                addgame.Parameters.AddWithValue("@gamename", placeholder);
                addgame.Parameters.AddWithValue("@user", placeholder);
                gameadduser.Parameters.AddWithValue("GameID", placeholder);
                conn.Open();
                addgame.ExecuteNonQuery();
                gameadduser.ExecuteNonQuery();
            }

            finally
            {

                conn.Close();


            }
            /*  if (User does not have it)
                  { 
                      try
            {

                removegame.Parameters.AddWithValue("@gamename", placeholder);
                removegame.Parameters.AddWithValue("@user", placeholder);
                gameremoveuser.Parameters.AddWithValue("GameID", placeholder);
                conn.Open();
                gameremoveuser.ExecuteNonQuery();
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