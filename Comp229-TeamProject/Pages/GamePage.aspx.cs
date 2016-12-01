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
    }
}