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
            <asp:DataList ID="DataList1" runat="server" DataSourceID="gamesowned">
                <ItemTemplate>
                    GameID:
                    <asp:Label ID="GameIDLabel" runat="server" Text='<%# Eval("GameID") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="gamesowned" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" SelectCommand="SELECT [GameID] FROM [GameLine] WHERE ([MemberID] = @MemberID)">
                <SelectParameters>
                    <asp:FormParameter DefaultValue="0" FormField="memberid" Name="MemberID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

    </div>
    </asp:Content>
