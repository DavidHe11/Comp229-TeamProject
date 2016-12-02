<%@ Page Title="GamePage" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="GamePage.aspx.cs" Inherits="Comp229_TeamProject.Pages.GamePage" %>
<%--Modified by David He--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="divBody heightGamePages">
    <div class="gameImageFrame">
        <asp:Image runat="server" ID="gameImage" />
    </div>
    <asp:Button CssClass="btn float" runat="server" ID="addGameToCollectionBtn" Text="+" />
    <div class="gameInformation">
    <asp:Label runat="server" ID="gameNameLbl"></asp:Label><br /><br />

    Description:<asp:Label runat="server" ID="descLbl"></asp:Label>
        <br />
        <br />
    Number Of Players Playing: <asp:Label runat="server" ID="numberOfPlayersLbl"></asp:Label>
        <br />
        <br />
    Rating: 
        <asp:Label runat="server" ID="ratingLbl"></asp:Label>
        </div>
    </div>
    </asp:Content>
