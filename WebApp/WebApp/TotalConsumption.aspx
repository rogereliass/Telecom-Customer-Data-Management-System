<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TotalConsumption.aspx.cs" Inherits="WebApp.TotalConsumption" %>

<!DOCTYPE html>
<html>
<head>
    <title>Total Consumption</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            min-height: 100vh; 
            background: linear-gradient(to bottom right, #004080, #e6f2ff);
            color: #333;
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
            font-size: 2.2em;
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
    <form id="form6" runat="server">
    <div class="container">
        <h1>Get Your Consumption</h1>
        
        <label for="mobileInput">Enter a Plan Name:</label>
        <asp:TextBox ID="PlanN" runat="server" CssClass="input-text" />
        
        <label for="dateInput">Select a Start Date:</label>
        <asp:TextBox ID="StartDateInput" runat="server" CssClass="input-text" TextMode="Date" />

        <label for="dateInput">Select an End Date:</label>
        <asp:TextBox ID="EndDateInput" runat="server" CssClass="input-text" TextMode="Date" />

        <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn" OnClick="SearchButton_Click" />

        <div class="grid-container">
        <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
        </div>

        <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
    </div>
    </form>
</body>
</html>
