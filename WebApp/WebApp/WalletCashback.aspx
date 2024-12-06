<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WalletCashback.aspx.cs" Inherits="WebApp.WalletCashback" %>

<!DOCTYPE html>
<html>
<head>
    <title>Total Consumption</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Align to the top */
            height: 100vh;
            margin: 0;
            background-color: #e9f2f9;
            overflow-y: auto; /* Allow scrolling of the entire page */
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: auto; 
            max-height: 1000vh; 
            overflow-y: auto; 
        }
        h1 {
            font-size: 2.5em;
            color: #004080;
            margin-bottom: 20px;
        }
        label {
            font-size: 1.2em;
            color: #333;
            margin-bottom: 10px;
        }
        .input-text {
            width: 90%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1.1em;
            margin-bottom: 20px;
        }
        .btn {
            padding: 15px 30px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            margin-top: 20px;
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
        .grid-container {
            flex: 1;
            overflow-y: auto;
            overflow-x: auto;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
            height: 500px; /* Adjust the height of the grid */
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            table-layout: auto;
            margin-top: 20px;
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
        @media (max-width: 768px) {
            h1 {
                font-size: 2em;
            }
            .btn {
                padding: 12px 24px;
                font-size: 1em;
            }
            .input-text {
                width: 80%;
                padding: 10px;
                font-size: 1em;
            }
            .container {
                padding: 30px;
            }
        }
        @media (max-width: 480px) {
            .container {
                width: 100%;
                padding: 20px;
            }
            h1 {
                font-size: 1.8em;
            }
            .btn {
                width: 100%;
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <form id="form9" runat="server">
    <div class="container">
        <h1>Get Wallet Cashback</h1>
        
        <label for="mobileInput">Enter National ID:</label>
        <asp:TextBox ID="NationalID" runat="server" CssClass="input-text" />

        <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn" OnClick="SearchButton_Click" />

        <div class="grid-container">
            <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
        </div>

        <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
    </div>
    </form>
</body>
</html>
