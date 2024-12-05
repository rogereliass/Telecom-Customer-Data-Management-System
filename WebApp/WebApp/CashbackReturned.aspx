<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashbackReturned.aspx.cs" Inherits="WebApp.CashbackReturned" %>

<!DOCTYPE html>
<html>
<head>
    <title>Cashback Renewal</title>
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
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        h1 {
            font-size: 1.5em;
            line-height: 1.2em;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            text-align: left;
            font-size: 1em;
        }
        .input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn + .btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form24" runat="server">
        <div class="container">
            <h1>Earn Your Cashback</h1>

            <label for="PaymentIDTextBox">PaymentID:</label>
            <asp:TextBox ID="PaymentIDTextBox" runat="server" CssClass="input" TextMode="Number" />

            <label for="BenefitIDTextBox">BenefitID:</label>
            <asp:TextBox ID="BenefitTextBox" runat="server" CssClass="input" TextMode="Number" />

            <div>
            <asp:Button ID="SearchButton" runat="server" Text="Earn" CssClass="btn" OnClick="SearchButton_Click" />
            </div>
            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
            
            <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="" />
        </div>
    </form>
</body>
</html>