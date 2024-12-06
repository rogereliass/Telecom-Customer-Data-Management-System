<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllWallets.aspx.cs" Inherits="WebApp.AllWallets" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Wallets</title>
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
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 85%; /* Width suitable for 1900px screens */
            max-width: 1800px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 85vh; /* Proportional height */
            margin: 0 auto; /* Horizontally centers the container */
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 15px;
            color: #004080;
        }

        .grid-container {
            flex: 1;
            overflow-y: auto; /* Enable vertical scrolling */
            overflow-x: auto; /* Enable horizontal scrolling */
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
            max-height: 65vh; /* Prevents overflowing vertically */
        }

        .gridview {
            width: 100%;
            min-width: 1200px; /* Ensure readability on large screens */
            max-width: 1700px;
            border-collapse: collapse;
            table-layout: auto;
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            word-wrap: break-word; /* Prevents text overflow */
        }

        .gridview th {
            background-color: #004080;
            color: white;
            font-size: 1em;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #ddd;
        }

        .gridview td {
            font-size: 16px; /* Larger font for better readability */
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
            text-transform: uppercase;
            margin-top: 20px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0066cc;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <form id="form27" runat="server">
        <div class="container">
            <h1>All Wallets Details</h1>
            
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
