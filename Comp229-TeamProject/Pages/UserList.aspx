<%@ Page Title="UserList" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Comp229_TeamProject.Pages.UserList" %>
<%--editted by rob --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User List</h1>
    <div class ="divBody small">
    <p>
        <asp:TextBox ID="searchbox" runat="server" Width="250px"></asp:TextBox>
        <asp:Button ID="srchbtn" runat="server" OnClick="srchbtn_Click" Text="Search" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="userlistsql" Width="265px" AllowPaging="True">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="Username" DataNavigateUrlFormatString="Profile.aspx?Username={0}" DataTextField="UserName" HeaderText="UserName" NavigateUrl="~/Pages/Profile.aspx" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="userlistsql" runat="server"
                     ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" 
                    SelectCommand="SELECT [Username] FROM [Members]"></asp:SqlDataSource>
    </p>
        </div>
    </asp:Content>
