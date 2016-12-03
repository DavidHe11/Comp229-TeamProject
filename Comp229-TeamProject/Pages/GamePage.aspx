<%@ Page Title="GamePage" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="GamePage.aspx.cs" Inherits="Comp229_TeamProject.Pages.GamePage" %>
<%--Modified by David He--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="divBody heightGamePages">
    <asp:Button CssClass="btn float" runat="server" ID="addGameToCollectionBtn" Text="+" OnClick="addGameToCollectionBtn_Click"/>
    <div class="gameInformation">
    <h1><asp:Label runat="server" ID="gameNameLbl"></asp:Label> </h1><br /><br />

    Description:<asp:Label runat="server" ID="descLbl"></asp:Label>
        <br />
        <br />
    Number Of Players Playing: <asp:Label runat="server" ID="numberOfPlayersLbl"></asp:Label>
        <br />
        <br />
        </div>
    </div>
    </asp:Content>
