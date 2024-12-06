<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WebApp.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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
    <form id="form5" runat="server">
        <div class="container">
            <div class="header">
                <h1>Admin Dashboard</h1>
            </div>

            <div class="profile">
                <img src="https://via.placeholder.com/60" alt="Admin Avatar" />
                <div class="details">
                    <h2>Welcome, Admin</h2>
                    <p>Admin Role: Super Admin</p>
                </div>
            </div>

            <div class="stats">
                <div class="stat-item">
                    <h3>10</h3>
                    <p>Total Users</p>
                </div>
                <div class="stat-item">
                    <h3>3</h3>
                    <p>Resolved Tickets</p>
                </div>
                <div class="stat-item">
                    <h3>10</h3>
                    <p>Active E-Shops</p>
                </div>
            </div>

            <div class="grid">
                <asp:Button ID="Button1" runat="server" Text="Customer Profiles" CssClass="btn" PostBackUrl="CustomerProfileDetails.aspx" />
                <asp:Button ID="Button2" runat="server" Text="Physical Store Vouchers" CssClass="btn" PostBackUrl="AllPhysicalStores.aspx" />
                <asp:Button ID="Button3" runat="server" Text="Resolved Tickets" CssClass="btn" PostBackUrl="AllResolvedTickets.aspx" />
                <asp:Button ID="Button4" runat="server" Text="Customers Subscribed Plans" CssClass="btn" PostBackUrl="AllCustomersSubscribedPlan.aspx" />
                <asp:Button ID="Button5" runat="server" Text="Plan's Current Customers" CssClass="btn" PostBackUrl="AllCustomerInputPlan.aspx" />
                <asp:Button ID="Button6" runat="server" Text="Total Usage" CssClass="btn" PostBackUrl="TotalUsage.aspx" />
                <asp:Button ID="Button7" runat="server" Text="Remove All Benefits Offered" CssClass="btn" PostBackUrl="RemoveAllBenifitsOffered.aspx" />
                <asp:Button ID="Button8" runat="server" Text="All SMS Offers" CssClass="btn" PostBackUrl="AllSMSOffers.aspx" />
                <asp:Button ID="Button9" runat="server" Text="All Wallets" CssClass="btn" PostBackUrl="Allwallets.aspx" />
                <asp:Button ID="Button10" runat="server" Text="All E-Shops" CssClass="btn" PostBackUrl="AllE-Shops.aspx" />
                <asp:Button ID="Button11" runat="server" Text="All Payment Transactions" CssClass="btn" PostBackUrl="AllPaymentTransactions.aspx" />
                <asp:Button ID="Button12" runat="server" Text="Total Cashback per Wallet" CssClass="btn" PostBackUrl="TotalCashbackPerWallet.aspx" />
                <asp:Button ID="Button13" runat="server" Text="Accepted Transactions Last Year" CssClass="btn" PostBackUrl="AcceptedTransactionsLastYear.aspx" />
                <asp:Button ID="Button14" runat="server" Text="Cashback Amount" CssClass="btn" PostBackUrl="CashbackAmount.aspx" />
                <asp:Button ID="Button15" runat="server" Text="Average Transaction Amount" CssClass="btn" PostBackUrl="AvgTransactionAmout.aspx" />
                <asp:Button ID="Button16" runat="server" Text="Mobile Number Has Wallet" CssClass="btn" PostBackUrl="MobileNumberHasWallet.aspx" />
                <asp:Button ID="Button17" runat="server" Text="Update Earned Points" CssClass="btn" PostBackUrl="UpdateEarnedPoints.aspx" />
            </div>

            <footer>
                <p>© W2024 Telecom Team 14 | <a href="mailto:roger.elias669@gmail.com">Contact</a></p>
            </footer>
        </div>
    </form>
</body>
</html>
