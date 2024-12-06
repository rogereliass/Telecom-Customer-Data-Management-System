<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="WebApp.UserDashboard" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .header {
            text-align: center;
        }

        h1 {
            font-size: 2.5em;
            color: #004080;
            margin-bottom: 10px;
        }

        .profile {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #f4f4f4;
            padding: 15px;
            border-radius: 10px;
        }

        .profile img {
            border-radius: 50%;
            width: 60px;
            height: 60px;
            object-fit: cover;
        }

        .profile .details {
            flex-grow: 1;
            margin-left: 15px;
        }

        .profile .details h2 {
            margin: 0;
            font-size: 1.5em;
            color: #333;
        }

        .profile .details p {
            margin: 5px 0 0;
            font-size: 0.9em;
            color: #666;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            place-items: center;
        }

        .btn {
            padding: 15px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
            text-align: center;
        }

        .btn:hover {
            background-color: #0066cc;
            transform: scale(1.05);
        }

        .btn:active {
            background-color: #003366;
            transform: scale(0.95);
        }

        .grid > :last-child:nth-child(3n + 2),
        .grid > :last-child:nth-child(3n + 1) {
            grid-column: 2;
        }

        .stats {
            display: flex;
            justify-content: space-between;
            background: #f4f4f4;
            padding: 15px;
            border-radius: 10px;
        }

        .stat-item {
            text-align: center;
            flex: 1;
        }

        .stat-item h3 {
            margin: 0;
            font-size: 1.2em;
            color: #004080;
        }

        .stat-item p {
            margin: 5px 0 0;
            font-size: 0.9em;
            color: #666;
        }

        footer {
            text-align: center;
            font-size: 0.9em;
            color: #666;
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 480px) {
            .grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form4" runat="server">
        <div class="container">
            <div class="header">
                <h1>User Dashboard</h1>
            </div>

            <div class="profile">
                <img src="https://via.placeholder.com/60" alt="User Avatar" />
                <div class="details">
                    <h2>Welcome, Roger Elias</h2>
                    <p>Joining Date: 1 December 2024 | Active Plan: Basic Plan </p>
                </div>
            </div>

            <div class="stats">
                <div class="stat-item">
                    <h3>$120</h3>
                    <p>Total Cashback Earned</p>
                </div>
                <div class="stat-item">
                    <h3>1</h3>
                    <p>Unresolved Tickets</p>
                </div>
                <div class="stat-item">
                    <h3>10GB</h3>
                    <p>Remaining Data</p>
                </div>
            </div>

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
            </div>

            <footer>
                © Winter 2024 Telecom Team 14 | <a href="mailto:roger.elias669@gmail.com">Contact</a>
            </footer>
        </div>
    </form>
</body>
</html>
