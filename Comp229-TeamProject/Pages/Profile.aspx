<%@ Page Title="Profile" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Comp229_TeamProject.Pages.Profile" %>
<%-- Modified by David He--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="divBody">
        <asp:Image runat="server" ID="profileImage"/>
        <asp:Label runat="server" ID="profileName"></asp:Label>
        </div>
        <%-- This nav may be unnessessary--%>
        <nav class="nav-default"></nav>
            
        <div class="divBody halfSize left">
            Email:<asp:Label runat="server" ID="EmailID"></asp:Label>
        </div>
        <div class="divBody halfSize right">
            Games owned:
        <%-- Database is missing platforms and players playing
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="gamelistsql" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="GameName"/>
                    </Columns>
                </asp:GridView>
            --%>
        </div>

    </div>
    </asp:Content>
