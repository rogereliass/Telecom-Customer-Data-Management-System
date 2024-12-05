<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="WebApp.UserDashboard" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
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
    <form id="form4" runat="server">
    <div class="container">
        <h1>User Dashboard</h1>
        <div class="grid">
            <asp:Button ID="Button1" runat="server" Text="Total Consumption" CssClass="btn" PostBackUrl="TotalConsumption.aspx" />
            <asp:Button ID="Button2" runat="server" Text="Unsubscribed Plans" CssClass="btn" PostBackUrl="UnsubscribedPlans.aspx" />
            <asp:Button ID="Button3" runat="server" Text="Monthly Plan Usage" CssClass="btn" PostBackUrl="ActivePlanUsage.aspx" />
            <asp:Button ID="Button4" runat="server" Text="Wallet Cashback" CssClass="btn" PostBackUrl="WalletCashback.aspx" />
            <asp:Button ID="Button5" runat="server" Text="All Benefits" CssClass="btn" PostBackUrl="AllBenefits.aspx" />
            <asp:Button ID="Button6" runat="server" Text="Unresolved Tickets" CssClass="btn" PostBackUrl="UnresolvedTickets.aspx" />
            <asp:Button ID="Button7" runat="server" Text="Highest Value Voucher" CssClass="btn" PostBackUrl="HighestVoucher.aspx" />
            <asp:Button ID="Button8" runat="server" Text="Remaining Plan Amount" CssClass="btn" PostBackUrl="RemainingPlanAmount.aspx" />
            <asp:Button ID="Button9" runat="server" Text="Extra Plan Amount" CssClass="btn" PostBackUrl="ExtraPlanAmount.aspx" />
            <asp:Button ID="Button10" runat="server" Text="Top 10 Successful Payments" CssClass="btn" PostBackUrl="TopSuccessfulPayments.aspx" />
            <asp:Button ID="Button11" runat="server" Text="All Shops" CssClass="btn" PostBackUrl="AllShopsDetails.aspx" />
            <asp:Button ID="Button12" runat="server" Text="Past 5 Months Plans" CssClass="btn" PostBackUrl="ALlServicePlans5Months.aspx" />
            <asp:Button ID="Button13" runat="server" Text="Subscription Renewal" CssClass="btn" PostBackUrl="SubscriptionRenewal.aspx" />
            <asp:Button ID="Button14" runat="server" Text="Cashback Amount" CssClass="btn" PostBackUrl="CashbackReturned.aspx" />
            <asp:Button ID="Button15" runat="server" Text="Recharge Balance" CssClass="btn" PostBackUrl="RechargeBalance.aspx" />
            <asp:Button ID="Button16" runat="server" Text="Redeem Voucher" CssClass="btn" PostBackUrl="RedeemVoucher.aspx" />
            <asp:Button ID="Button16" runat="server" Text="Redeem Voucher" CssClass="btn" PostBackUrl="RedeemVoucher.aspx" />
        </div>
    </div>
    </form>
</body>
</html>