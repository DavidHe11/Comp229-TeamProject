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

            <asp:DataList ID="DataList1" runat="server" DataSourceID="gamesowned">
                <ItemTemplate>
       
                    <asp:Label ID="GameNameLabel" runat="server" Text='<%# Eval("GameName") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="gamesowned" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString2 %>" SelectCommand="SELECT Games.GameName FROM Games INNER JOIN GameLine ON Games.GameID = GameLine.GameID INNER JOIN Members ON GameLine.MemberID = Members.MemberID
WHERE (GameLine.MemberID = @memberid)">
                <SelectParameters>
                    <asp:FormParameter FormField="memberid" Name="memberid" DefaultValue="10" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

    </div>
    </asp:Content>
