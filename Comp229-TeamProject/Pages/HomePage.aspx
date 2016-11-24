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
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    Name:
                    <asp:Label ID="GameNameLabel" runat="server" Text='<%# Eval("GameName") %>' />
                    <br />
                    Number Of Users:
                    <asp:Label ID="NumberOfUsersLabel" runat="server" Text='<%# Eval("NumberOfUsers") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString %>" SelectCommand="SELECT [GameName], [NumberOfUsers] FROM [Games] ORDER BY [NumberOfUsers]"></asp:SqlDataSource>
        </div>
         <div class="col-md-4">
            <h4>Recently Added Games</h4>
             <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                 <ItemTemplate>
                     GameName:
                     <asp:Label ID="GameNameLabel" runat="server" Text='<%# Eval("GameName") %>' />
                     <br />
                     DatePublished:
                     <asp:Label ID="DatePublishedLabel" runat="server" Text='<%# Eval("DatePublished") %>' />
                     <br />
<br />
                 </ItemTemplate>
             </asp:DataList>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString %>" SelectCommand="SELECT [GameName], [DatePublished] FROM [Games] ORDER BY [DatePublished]"></asp:SqlDataSource>
        </div>
            </div>
       





    </asp:Content>
