<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WebApp.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-bottom: 20px;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        .btn {
            padding: 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            display: block;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form5" runat="server">
    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="grid">
            <asp:Button ID="Button1" runat="server" Text="Customer profiles" CssClass="btn" PostBackUrl="CustomerProfileDetails.aspx" />
            <asp:Button ID="Button2" runat="server" Text="Physical store vouchers" CssClass="btn" PostBackUrl="AllPhysicalStores.aspx" />
            <asp:Button ID="Button3" runat="server" Text=" Resolved Tickets" CssClass="btn" PostBackUrl="AllResolvedTickets.aspx" />
            <asp:Button ID="Button4" runat="server" Text="Customers subscribed plans" CssClass="btn" PostBackUrl="AllCustomersSubscribedPlan.aspx" />
            <asp:Button ID="Button5" runat="server" Text="Plan's current customers " CssClass="btn" PostBackUrl="AllCustomerInputPlan.aspx" />
            <asp:Button ID="Button6" runat="server" Text="Total usage" CssClass="btn" PostBackUrl="TotalUsage.aspx" />
            <asp:Button ID="Button7" runat="server" Text="Remove all benefits offered" CssClass="btn" PostBackUrl="RemoveAllBenifitsOffered.aspx" />
            <asp:Button ID="Button8" runat="server" Text="All SMS offers" CssClass="btn" PostBackUrl="AllSMSOffers.aspx" />
            <asp:Button ID="Button9" runat="server" Text="All wallets" CssClass="btn" PostBackUrl="Allwallets.aspx" />
            <asp:Button ID="Button10" runat="server" Text="All e-shops " CssClass="btn" PostBackUrl="AllE-Shops.aspx" />
            <asp:Button ID="Button11" runat="server" Text="All payment transactions" CssClass="btn" PostBackUrl="AllPaymentTransactions.aspx" />
            <asp:Button ID="Button12" runat="server" Text="Total Cashback per wallet" CssClass="btn" PostBackUrl="TotalCashbackPerWallet.aspx" />
            <asp:Button ID="Button13" runat="server" Text="Page 13" CssClass="btn" PostBackUrl="Page13.aspx" />
            <asp:Button ID="Button14" runat="server" Text="Cashback amount" CssClass="btn" PostBackUrl="CashbackAmount.aspx" />
            <asp:Button ID="Button15" runat="server" Text="Page 15" CssClass="btn" PostBackUrl="Page15.aspx" />
            <asp:Button ID="Button16" runat="server" Text="Page 16" CssClass="btn" PostBackUrl="Page16.aspx" />
            <asp:Button ID="Button17" runat="server" Text="Page 17" CssClass="btn" PostBackUrl="Page17.aspx" />
        </div>
    </div>
    </form>
</body>
</html>
