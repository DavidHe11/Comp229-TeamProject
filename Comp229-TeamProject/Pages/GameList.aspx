<%@ Page Title="Game List" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="GameList.aspx.cs" Inherits="Comp229_TeamProject.Pages.GameList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
        <h1>Game List</h1>
        <p>
            <asp:TextBox ID="searchbox" runat="server" Width="250px"></asp:TextBox>
            <asp:Button ID="srchbtn" runat="server" OnClick="srchbtn_Click" Text="Search" />
        </p>
  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString %>" SelectCommand="SELECT [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [GameName]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                <asp:BoundField DataField="NumberOfUsers" HeaderText="NumberOfUsers" SortExpression="NumberOfUsers" />
                <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" />
            </Columns>
        </asp:GridView>
      
    </asp:Content>
