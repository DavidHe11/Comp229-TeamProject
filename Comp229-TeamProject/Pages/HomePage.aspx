<%@ Page Title="Home Page" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Comp229_TeamProject.Pages.HomePage" %>
<%--Edited by Rob --%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Gardyloo!</h1>

   
        <div >
    <h1>Welcome</h1>
        <p> this is the description of the page</p>
    </div>
        <div class="row">
            <div class="col-md-4">
            <h4>Top 10 Games</h4>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="top10games" Width="400px">
                    <Columns>
                        <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                        <asp:BoundField DataField="NumberOfUsers" HeaderText="NumberOfUsers" SortExpression="NumberOfUsers" />
                        <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" />
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
                        <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="RecentGames" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString %>" SelectCommand="SELECT TOP 10 [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [DatePublished]"></asp:SqlDataSource>
        </div>
            </div>
       





    </asp:Content>
