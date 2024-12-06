<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RedeemVoucher.aspx.cs" Inherits="WebApp.RedeemVoucher" %>

<!DOCTYPE html>
<html>
<head>
    <title>Redeem Voucher</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff);
            color: #333;
        }

        .container {
            text-align: center;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        h1 {
            font-size: 2.2em;
            margin-bottom: 15px;
            color: #004080;
        }

        label {
            font-size: 1.1em;
            text-align: left;
            margin-bottom: 5px;
        }

        .input {
            width: 90%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            padding: 12px 25px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            margin-top: 15px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0066cc;
            transform: translateY(-3px);
        }

        .btn:active {
            background-color: #003366;
            transform: translateY(0);
        }

        .result-label {
            font-size: 1.2em;
            margin: 15px 0;
            color: #009933;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 1.8em;
            }

            .btn {
                padding: 10px 20px;
                font-size: 1em;
            }

            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form30" runat="server">
        <div class="container">
            <h1>Earn Your Cashback</h1>

            <label for="VoucherIDTextBox">VoucherID:</label>
            <asp:TextBox ID="VoucherIDTextBox" runat="server" CssClass="input" TextMode="Number" />

            <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="" />

            <asp:Button ID="SearchButton" runat="server" Text="Redeem" CssClass="btn" OnClick="SearchButton_Click" />

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
        </div>
    </form>
</body>
</html>
