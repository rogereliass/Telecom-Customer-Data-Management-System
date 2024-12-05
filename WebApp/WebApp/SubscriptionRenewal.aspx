<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubscriptionRenewal.aspx.cs" Inherits="WebApp.SubscriptionRenewal" %>

<!DOCTYPE html>
<html>
<head>
    <title>Subscrcription Renewal </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
        }
        h1 {
            margin-bottom: 20px;
        }
         .btn {
             padding: 10px 20px;
             background-color: #007bff;
             color: white;
             border: none;
             border-radius: 5px;
             font-size: 1em;
             cursor: pointer;
             text-align: center;
             margin-top: 20px;
         }
         .btn:hover {
             background-color: #0056b3;
         }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .gridview th {
            background-color: #007bff;
            color: white;
        }
        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .gridview tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Select Payment Method</h1>

        <!-- Dropdown for Payment Methods -->
        <label for="PaymentMethodDropDown">Payment Method:</label>
        <asp:DropDownList ID="PaymentMethodDropDown" runat="server" CssClass="input">
            <asp:ListItem Text="Select a method" Value="" />
            <asp:ListItem Text="Credit" Value="credit" />
            <asp:ListItem Text="Cash" Value="cash" />
        </asp:DropDownList>

        <!-- TextBox for Amount -->
        <label for="AmountTextBox">Amount:</label>
        <asp:TextBox ID="AmountTextBox" runat="server" CssClass="input" TextMode="Number" />

        <!-- TextBox for Plan ID -->
        <label for="PlanIDTextBox">Plan ID:</label>
        <asp:TextBox ID="PlanIDTextBox" runat="server" CssClass="input" TextMode="Number" />

        <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn" OnClick="SearchButton_Click" />
        <div>
        <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="" />
        </div>
        <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
    </div>
</body>

</html>
