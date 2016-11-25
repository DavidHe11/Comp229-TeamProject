<%@ Page Title="Game List" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="GameList.aspx.cs" Inherits="Comp229_TeamProject.Pages.GameList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
        <h1>Game List</h1>
        <p>
            <asp:TextBox ID="searchbox" runat="server" Width="250px"></asp:TextBox>
            <asp:Button ID="srchbtn" runat="server" OnClick="srchbtn_Click" Text="Search" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="gamelistsql" Width="400px" AllowPaging="True">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="GameName" DataNavigateUrlFormatString="GamePage.aspx?GameName={0}" DataTextField="GameName" HeaderText="Game Name" NavigateUrl="~/Pages/GamePage.aspx" />
                        <asp:BoundField DataField="NumberOfUsers" HeaderText="NumberOfUsers" SortExpression="NumberOfUsers" />
                        <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="gamelistsql" runat="server"
                     ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" 
                    SelectCommand="SELECT [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [GameName]">

                </asp:SqlDataSource>
        </p>
  
    </asp:Content>
