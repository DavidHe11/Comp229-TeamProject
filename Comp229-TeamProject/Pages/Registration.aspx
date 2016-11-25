<%@ Page Title="Registration/Login" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Comp229_TeamProject.Pages.Registration" %>

<%--Replacement for "SignIn" and "Login" page. Just put both next to each other.--%>
<%--Edited by David He --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-6 divBody heightRegistration" id="registerDiv">
        <h2>Register for an account</h2>
        <table class="tableFillout">
        <tr><td>Username:</td><td> <asp:TextBox runat="server" ID="regUsernameTB"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="regUsernameTB" Display="Dynamic" ErrorMessage="Username is Required."></asp:RequiredFieldValidator></td></tr>
        <tr><td>Email:</td><td> <asp:TextBox runat="server" ID="EmailTB"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailTB" Display="Dynamic" ErrorMessage="Email is Required."></asp:RequiredFieldValidator></td></tr>
        <tr><td>Password:</td><td> <asp:TextBox runat="server" ID="regPasswordTB" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="regPasswordTB" Display="Dynamic" ErrorMessage="Password is Required"></asp:RequiredFieldValidator></td></tr>
        <tr><td>Confirm Password:</td><td><asp:TextBox runat="server" ID="confirmPasswordTB" TextMode="Password"></asp:TextBox></td></tr>
            <asp:CompareValidator runat="server" ControlToValidate="confirmPasswordTB" ControlToCompare="regPasswordTB" Display="Dynamic" ErrorMessage="Passwords do not match"></asp:CompareValidator>
            </table>
        <br />
        <asp:Button CssClass="btn" runat="server" Text="Create Account"/><%--Onclick="Register_Click"--%>
        
    </div>
    <div class="col-md-6 divBody heightRegistration" id="loginDiv">
        <h2>Login</h2>
        <table class="tableFillout">
        <tr><td>Username:</td><td> <asp:TextBox runat="server" ID="loginUsernameTB"></asp:TextBox></td></tr>
        <tr><td>Password:</td><td> <asp:TextBox runat="server" ID="loginPasswordTB" TextMode="Password"></asp:TextBox></td></tr>
            </table>
        <br />
        <asp:Button CssClass="btn" runat="server" Text="Login"/><%--Onclick="Login_Click"--%>
    </div>
    </asp:Content>
