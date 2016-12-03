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
            /*Work around for not being able to get authentication to work. will send user to registration page if not authenticated. */
            bool isAuthenticated = (HttpContext.Current.User != null) && HttpContext.Current.User.Identity.IsAuthenticated;

            if (!isAuthenticated)
            {
                Response.Redirect("~/Pages/Registration.aspx");
            }

            /*When page Loads, create page dynamically with game name.*/
            string gamename = Request.QueryString["GameName"];
            gameNameLbl.Text = gamename;


            SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");

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
            string Gamename = Request.QueryString["GameName"];

            int GameID = 0;
            int MemberID = 0;
            string username = null;
            Boolean itshere = false;
            username = HttpContext.Current.User.Identity.Name;
            SqlCommand addgame = new SqlCommand("INSERT INTO dbo.GameLine (GameID,GameName,MemberID) VALUES(@gameid,@gamename, @User); ", conn);

            SqlCommand gameadduser = new SqlCommand("UPDATE Games SET NumberofUsers = NumberofUsers + 1 WHERE GameID = @GameID ", conn);
            SqlCommand gameremoveuser = new SqlCommand("UPDATE Games SET NumberofUsers = NumberofUsers - 1 WHERE GameID = @GameID ", conn);

            SqlCommand getmemberid = new SqlCommand("SELECT MemberID FROM Members WHERE Username = @username");
            SqlCommand getgameid = new SqlCommand("SELECT MemberID FROM Games WHERE GameName = @Gamename");

            SqlCommand isthere = new SqlCommand("SELECT * FROM GameLine WHERE MemberID = @member AND GameName = @gamename)");
            SqlCommand removegame = new SqlCommand("DELETE FROM dbo.GameLine WHERE MemberID = @user AND GameName = @gamename; ", conn);

            try
            {
                getmemberid.Parameters.AddWithValue("@username", username);
                getgameid.Parameters.AddWithValue("@GameName", Gamename);
                conn.Open();
                GameID = Convert.ToInt32(getgameid.ExecuteScalar().ToString());
                MemberID = Convert.ToInt32(getmemberid.ExecuteScalar().ToString());
                isthere.Parameters.AddWithValue("@member", MemberID);
                isthere.Parameters.AddWithValue("@gamename", Gamename);
                if ((int)isthere.ExecuteScalar() == 0)
                {
                    itshere = false;
                }
                else
                {
                    itshere = true;
                }
            
            }
            finally
            {
                conn.Close();
            }

            if (itshere == false)
            {
                try
                {
                    //i know this works-rob
                    // add the game to their list and increase the game's number of playing
                    addgame.Parameters.AddWithValue("@GameID", GameID);
                    addgame.Parameters.AddWithValue("@gamename", Gamename);
                    addgame.Parameters.AddWithValue("@User", MemberID);

                    gameadduser.Parameters.AddWithValue("GameID", GameID);
                    conn.Open();
                    addgame.ExecuteNonQuery();
                    gameadduser.ExecuteNonQuery();
                }

                finally
                {
                    conn.Close();
                }
            }
            else
            {
                //i know this works-rob
                //remove the game from their list and decrease the game's number of playing
                try
                {
                    removegame.Parameters.AddWithValue("@gamename", Gamename);
                    removegame.Parameters.AddWithValue("@user", MemberID);
                    gameremoveuser.Parameters.AddWithValue("GameID", GameID);
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
    }
}
    

            
        
    

    
