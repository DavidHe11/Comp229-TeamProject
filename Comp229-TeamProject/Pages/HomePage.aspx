<%@ Page Title="Home Page" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Comp229_TeamProject.Pages.HomePage" %>
<%--editted by rob --%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Gardyloo!</h1>

   
        <div class ="divBody small">
    <p>&nbsp;</p>
            <h1>Welcome</h1>
        <p> Welcome to Gardyloo! A special place where you can keep track of the games you have played for easy reference.</p>
            <p> 
                <asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Search Games" />
            </p>
    
        <div class="row small">
            <div class="col-md-4">
            <h4>Top 10 Games</h4>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="top10games" >
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="GameName" DataNavigateUrlFormatString="GamePage.aspx?GameName={0}" DataTextField="GameName" HeaderText="GameName" NavigateUrl="~/Pages/GamePage.aspx" />
                        <asp:BoundField DataField="NumberOfUsers" HeaderText="NumberOfUsers" SortExpression="NumberOfUsers" />
                        <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>   
                <asp:SqlDataSource ID="top10games" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" SelectCommand="SELECT TOP 10 [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [GameName] "></asp:SqlDataSource>
        </div>
         <div class="col-md-4">
            <h4>Recently Added Games</h4>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="RecentGames" >
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="GameName" DataNavigateUrlFormatString="GamePage.aspx?GameName={0}" DataTextField="GameName" HeaderText="GameName" />
                        <asp:BoundField DataField="NumberOfUsers" HeaderText="NumberOfUsers" SortExpression="NumberOfUsers" />
                        <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="RecentGames" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString %>" SelectCommand="SELECT TOP 10 [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [DatePublished]"></asp:SqlDataSource>
        </div>
            </div></div>
       





    </asp:Content>
