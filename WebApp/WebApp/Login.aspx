<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" Text="Please Log In"></asp:Label><asp:Label runat="server" Text=" Trial"></asp:Label>
        </div>
        <div>
            <asp:Label runat="server" Text="Mobile Number"></asp:Label>&nbsp;</div>
        <div>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>&nbsp;</div>
        <div class="">
            <asp:Label runat="server" Text="Password"></asp:Label>&nbsp;</div>
        <div class="">
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>&nbsp;</div>
        <div class="">
            <asp:Button ID="signIn" runat="server" Text="Login" OnClick="login" ></asp:Button>&nbsp;</div>
        <div class="">&nbsp;</div>
    </form>
</body>
</html>
