﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_TeamProject.Pages
{
    public partial class GameList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Work around for not being able to get authentication to work. will send user to registration page if not authenticated. */
            bool isAuthenticated = (HttpContext.Current.User != null) && HttpContext.Current.User.Identity.IsAuthenticated;

            if (!isAuthenticated)
            {
                Response.Redirect("~/Pages/Registration.aspx");
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void srchbtn_Click(object sender, EventArgs e)
        {
            /* This method searches for a term that a user inputs into a textbox.*/
            gamelistsql.SelectCommand = "SELECT [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [GameName] WHERE GameName LIKE @search";

            /*
            SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");
            SqlCommand searchgame = new SqlCommand("SELECT GameName, NumberofUsers, DatePublished FROM Games WHERE GameName LIKE @search)", conn);
            try
            {
                string search = searchbox.Text;

                searchgame.Parameters.AddWithValue("@search", search);


                conn.Open();
                SqlDataAdapter srchresults = new SqlDataAdapter(searchgame);

                DataTable dt = new DataTable();



                //GameList.DataSource1 = srchresults.Fill(dt);


            }

            finally
            {

                conn.Close();
                Response.Redirect(Request.RawUrl);
            }
        */
        }

        protected void addbtn_Click(object sender, EventArgs e)
        {
            //add a game anyone can add
            String Name = null;
            String Description = null;
            String Date = null;
            SqlConnection conn = new SqlConnection(@"Data Source=Robert-PC\SQLEXPRESS;Initial Catalog=GameProfile;Integrated Security=True");
            SqlCommand addgame = new SqlCommand("INSERT INTO Games(GameName, GameDesc, DatePublished) VALUES(@name, @desc, @date)", conn);
        //    if (String.IsNullOrEmpty(namebx.Text))
        //    {
               
         //   }
          //  else
         //   {
               // if(String.IsNullOrEmpty(descbx.Text))
               // {
                    Name = namebx.Text;
                    Description = descbx.Text;
                    Date = Convert.ToString(Calendar1.SelectedDate);
                    try
                    {

                        addgame.Parameters.AddWithValue("@name", Name);
                        addgame.Parameters.AddWithValue("@desc", Description);
                        addgame.Parameters.AddWithValue("@date", Date);
                        conn.Open();
                        addgame.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }

                    finally
                    {

                        conn.Close();


                    }
            //    }
           // }

        }

        protected void showdivbtn_Click(object sender, EventArgs e)
        {
            //turn on div to let any user add a game
            editdiv.Visible = true;
            editbtndiv.Visible = false;
        }
    }
}