<%@ Page Title="Game List" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="GameList.aspx.cs" Inherits="Comp229_TeamProject.Pages.GameList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
        <h1>Game List</h1>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="487px">
        <ItemTemplate>
            <hr />
            GameName:
            <a href='<%# Eval("GameName","GamePage.aspx?uid={0}") %>'><%# Eval("GameName") %></a>
            <%-- <asp:Label ID="GameNameLabel" runat="server" href="Gamepage.aspx?{0}={1}",,1 Text='<%# Eval("GameName") %>' />--%>
            <br />
            NumberOfUsers:
            <asp:Label ID="NumberOfUsersLabel" runat="server" Text='<%# Eval("NumberOfUsers") %>' />
          <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString %>" SelectCommand="SELECT [GameName], [NumberOfUsers] FROM [Games] ORDER BY [GameName]"></asp:SqlDataSource>
    
    </asp:Content>
