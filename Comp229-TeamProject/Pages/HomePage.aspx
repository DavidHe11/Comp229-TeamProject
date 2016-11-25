﻿<%@ Page Title="Home Page" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Comp229_TeamProject.Pages.HomePage" %>
<%--editted by rob --%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Gardyloo!</h1>

   
        <div class ="divBody">
    <p>&nbsp;</p>
            <h1>Welcome</h1>
        <p> Welcome to Gardyloo! A special place where you can keep track of the games you have played for easy reference.</p>
            <p> 
                <asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Button" />
            </p>
    </div>
        <div class="row">
            <div class="col-md-4">
            <h4>Top 10 Games</h4>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="top10games" Width="400px">
                    <Columns>
                        <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                        <asp:BoundField DataField="NumberOfUsers" HeaderText="NumberOfUsers" SortExpression="NumberOfUsers" />
                        <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>   
                <asp:SqlDataSource ID="top10games" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" SelectCommand="SELECT TOP 10 [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [GameName] "></asp:SqlDataSource>
        </div>
         <div class="col-md-4">
            <h4>Recently Added Games</h4>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="RecentGames" Width="400px">
                    <Columns>
                        <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                        <asp:BoundField DataField="NumberOfUsers" HeaderText="NumberOfUsers" SortExpression="NumberOfUsers" />
                        <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="RecentGames" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString %>" SelectCommand="SELECT TOP 10 [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [DatePublished]"></asp:SqlDataSource>
        </div>
            </div>
       





    </asp:Content>
