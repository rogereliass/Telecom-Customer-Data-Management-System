<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RechargeBalance.aspx.cs" Inherits="WebApp.RechargeBalance" %>

<!DOCTYPE html>
<html>
<head>
    <title>Recharge Balance</title>
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
            overflow: hidden; /* Remove scrollbar */
        }

        .container {
            text-align: center;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 500px;
            display: flex;
            flex-direction: column;
            gap: 8px; /* Reduced gap between elements */
        }

        h1 {
            font-size: 2.2em;
            margin-bottom: 15px;
            color: #004080;
        }

        label {
            font-size: 1.1em;
            text-align: left;
            width: 100%;
            margin-bottom: 5px;
        }

        .input, .dropdown {
            width: 90%;
            padding: 8px;
            margin-bottom: 5px; /* Reduced space between inputs */
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            padding: 12px 25px;
            background-color: #004080;
            color: #ffffff;
            border: none;
            border-radius: 25px;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            margin-top: 15px; /* Reduced space above buttons */
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
    <form id="form28" runat="server">
        <div class="container">
            <h1>Recharge Your Balance</h1>

            <label for="AmountTextBox">Amount:</label>
            <asp:TextBox ID="AmountTextBox" runat="server" CssClass="input" TextMode="Number" />

            <label for="PaymentMethodDropDown">Payment Method:</label>
            <asp:DropDownList ID="PaymentMethodDropDown" runat="server" CssClass="dropdown">
                <asp:ListItem Text="Select a method" Value="" />
                <asp:ListItem Text="Credit" Value="credit" />
                <asp:ListItem Text="Cash" Value="cash" />
            </asp:DropDownList>

            <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="" />

            <asp:Button ID="SearchButton" runat="server" Text="Recharge" CssClass="btn" OnClick="SearchButton_Click" />

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
        </div>
    </form>
</body>
</html>
