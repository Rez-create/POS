<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="POSInventorySystem.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Login</h2>

    <div class="login-form">

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <br /><br />

        <asp:Label runat="server" Text="Username"></asp:Label>
        <br />
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

        <br /><br />

        <asp:Label runat="server" Text="Password"></asp:Label>
        <br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

        <br /><br />

        <asp:Button ID="btnLogin" runat="server" Text="Login"
            OnClick="btnLogin_Click" />

    </div>

</asp:Content>