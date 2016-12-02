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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="gamesowned" Width="400px" AllowPaging="True">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="GameName" DataNavigateUrlFormatString="GamePage.aspx?GameName={0}" DataTextField="GameName" HeaderText="Games Owned:" NavigateUrl="~/Pages/GamePage.aspx" />
                    </Columns>
                </asp:GridView>
                &nbsp;<asp:SqlDataSource ID="gamesowned" runat="server" ConnectionString="<%$ ConnectionStrings:GameProfileConnectionString %>" SelectCommand="SELECT [GameName] FROM [GameLine] WHERE ([MemberID] = @MemberID)">
                <SelectParameters>
                    <asp:Parameter Name="MemberID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div >
            <p> <asp:Button ID="editbtn" runat="server" Text="Edit Profile" OnClick="editbtn_Click" /></p>
            <div ID="editdiv" runat="server" class ="divBody" visible="false">
                <p>First Name:<asp:TextBox ID="Fnamebx" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="fnamereq" runat="server" Display="Dynamic" ControlToValidate="fnamebx" ErrorMessage="First name required"></asp:RequiredFieldValidator>
                </p>
                <p>Last Name:<asp:TextBox ID="Lnamebx" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="lnamereq" runat="server" Display="Dynamic" ControlToValidate="lnamebx" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>
                </p>
               <p>Email:<asp:TextBox ID="emailbx" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="emailreq" runat="server" Display="Dynamic" ControlToValidate="emailbx" ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ControlToValidate="emailbx" ErrorMessage="Please enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </p>
                <p> <asp:Button ID="submitbtn" runat="server" Text="Submit" OnClick="submitbtn_Click" /></p>
            </div>
        </div>


    </div>
    </asp:Content>
