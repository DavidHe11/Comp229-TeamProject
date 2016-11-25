<%@ Page Title="GamePage" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="GamePage.aspx.cs" Inherits="Comp229_TeamProject.Pages.GamePage" %>
<%--Modified by David He--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="divBody">
    <div class="gameImageFrame">
        
    </div>
    <asp:Button CssClass="btn float" runat="server" ID="addGameToCollectionBtn" Text="+" />
    <asp:Label runat="server" ID="gameName"></asp:Label>
    <asp:Label runat="server" ID="numberOfPlayers"></asp:Label>
    </div>
    </asp:Content>
