<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllCustomersSubscribedPlan.aspx.cs" Inherits="WebApp.AllCustomersSubscribedPlan" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Accounts and Their Subscribed Plans</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff); /* Gradient for consistency */
            color: #333;
        }

        .container {
            text-align: center;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 95%;
            max-width: 1400px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: auto;
            margin: 0 auto;
        }

        h1 {
            font-size: 2.2em;
            margin-bottom: 15px;
            color: #004080; /* Deep blue header */
        }

        .grid-container {
            flex: 1;
            overflow-y: auto; /* For scrollable content */
            overflow-x: auto; /* For wide tables */
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            table-layout: auto; /* Dynamic column width */
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            word-wrap: break-word; /* Prevents overflow */
        }

        .gridview th {
            background-color: #004080; /* Consistent deep blue */
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
            font-size: 14px;
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
            background-color: #0066cc; /* Lighter blue on hover */
            transform: translateY(-3px);
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
    <form id="form21" runat="server">
        <div class="container">
            <h1>Customer Accounts and Their Subscribed Plans</h1>
            
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
