<%@ Page Title="UserList" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Comp229_TeamProject.Pages.UserList" %>
<%--editted by rob --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User List</h1>
    <div class ="divBody small">
    <p>
        <asp:TextBox ID="searchbox" runat="server" Width="250px"></asp:TextBox>
        <asp:Button ID="srchbtn" runat="server" OnClick="srchbtn_Click" Text="Search" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="userlistsql" Width="320px" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="userlistsql" runat="server"
                     ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" 
                    SelectCommand="SELECT [Username] FROM [Members]"></asp:SqlDataSource>
    </p>
        </div>
    </asp:Content>
