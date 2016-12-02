<%@ Page Title="Game List" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="GameList.aspx.cs" Inherits="Comp229_TeamProject.Pages.GameList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--editted by rob --%>
        <h1>Game List</h1>
    <div class ="divBody small">
        <p>
            <asp:TextBox ID="searchbox" runat="server" Width="250px"></asp:TextBox>
            <asp:Button ID="srchbtn" runat="server" OnClick="srchbtn_Click" Text="Search" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="gamelistsql" Width="400px" AllowPaging="True">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="GameName" DataNavigateUrlFormatString="GamePage.aspx?GameName={0}" DataTextField="GameName" HeaderText="Game Name" NavigateUrl="~/Pages/GamePage.aspx" />
                        <asp:BoundField DataField="NumberOfUsers" HeaderText="NumberOfUsers" SortExpression="NumberOfUsers" />
                        <asp:BoundField DataField="DatePublished" HeaderText="DatePublished" SortExpression="DatePublished" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="gamelistsql" runat="server"
                     ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" 
                    SelectCommand="SELECT [GameName], [NumberOfUsers], [DatePublished] FROM [Games] ORDER BY [GameName]">

                </asp:SqlDataSource>
        </p>
  </div>
    
        <div ID="editbtndiv" runat="server" class ="divBody" visible="true">
            <asp:Button ID="showdivbtn" runat="server" Text="Add a Game" OnClick="showdivbtn_Click" />
        </div>
        <div ID="editdiv" runat="server" class ="divBody" visible="false">
        <p>Add Game</p>
        <p>Game Name:<asp:TextBox ID="namebx" runat="server"></asp:TextBox>
        </p>
        <p>Game Description:<asp:TextBox ID="descbx" runat="server" Width="288px" Height="93px" TextMode="MultiLine"></asp:TextBox>
        </p>
        <p>Game Published:<asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
        </p>
        <p>
            <asp:Button ID="addbtn" runat="server" OnClick="addbtn_Click" Text="Add Game" />
        </p>
            </div>
    
    </asp:Content>
