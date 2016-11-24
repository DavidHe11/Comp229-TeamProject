<%@ Page Title="UserList" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Comp229_TeamProject.Pages.UserList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User List</h1>
    <p>
        <asp:TextBox ID="searchbox" runat="server" Width="250px"></asp:TextBox>
        <asp:Button ID="srchbtn" runat="server" OnClick="srchbtn_Click" Text="Search" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="userlistsql" Width="400px" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="userlistsql" runat="server"
                     ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" 
                    SelectCommand="SELECT [Username] FROM [Members]"></asp:SqlDataSource>
    </p>
    </asp:Content>
