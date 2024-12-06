<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TotalCashbackPerWallet.aspx.cs" Inherits="WebApp.TotalCashbackPerWallet" %>

<!DOCTYPE html>
<html>
<head>
    <title>Total Cashback Per Wallet</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff);
        }
        .container {
            text-align: center;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 85%;
            max-width: 1600px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 85vh;
            margin: 0 auto;
        }
        h1 {
            font-size: 2.5em;
            color: #004080;
            margin-bottom: 20px;
        }
        .grid-container {
            flex: 1;
            overflow-y: auto;
            overflow-x: auto;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
            max-width:1000px;
        }
        .gridview {
            width: 100%;
            
            max-width: 1000px;
            border-collapse: collapse;
            table-layout: auto;
        }
        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        .gridview th {
            background-color: #004080;
            color: white;
        }
        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .gridview tr:hover {
            background-color: #ddd;
        }
        .gridview td {
            font-size: 14px;
        }
        .btn {
            padding: 15px 30px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1.2em;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
            text-transform: uppercase;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0066cc;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <form id="form32" runat="server">
        <div class="container">
            <h1>Get Total Cashback Per Wallet ID</h1>
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>
            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
