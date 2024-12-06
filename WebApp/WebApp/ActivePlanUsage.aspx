<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivePlanUsage.aspx.cs" Inherits="WebApp.ActivePlanUsage" %>

<!DOCTYPE html>
<html>
<head>
    <title>Active Plan Consumption</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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
            width: 90%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 80vh;
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #004080;
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
        }
        .gridview {
            width: 100%;
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
        @media (max-width: 768px) {
            h1 {
                font-size: 2em;
            }
            .btn {
                padding: 12px 24px;
                font-size: 1em;
            }
            .container {
                padding: 25px;
            }
        }
        @media (max-width: 480px) {
            .container {
                width: 100%;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form8" runat="server">
    <div class="container">
        <h1>Your Monthly Plan Usage</h1>

        <div class="grid-container">
        <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
        </div>

        <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
    </div>
    </form>
</body>
</html>
