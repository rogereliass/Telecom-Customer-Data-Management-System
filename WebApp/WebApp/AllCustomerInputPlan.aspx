<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllCustomerInputPlan.aspx.cs" Inherits="WebApp.AllCustomerInputPlan" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Accounts Subscribed to Certain Plan</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff);
            overflow-y: auto; /* Allow the entire page to scroll if needed */
        }
        .container {
            text-align: center;
            background: #ffffff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 85%;
            max-width: 1600px;
            display: flex;
            flex-direction: column;
            gap: 15px; /* Reduce space between elements */
            height: auto;
            margin-top: 40px;
        }
        h1 {
            font-size: 2.5em;
            color: #004080;
            margin-bottom: 15px; /* Reduce bottom margin */
        }
        .input-text {
            width: 90%;
            padding: 8px;
            margin: 5px 0; /* Reduce margin between inputs */
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
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
            margin-top: 15px;
            text-transform: uppercase;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0066cc;
            transform: translateY(-3px);
        }
        .btn:active {
            background-color: #003366;
            transform: translateY(3px);
        }
        .grid-container {
            flex: 1;
            overflow-y: auto;
            overflow-x: auto;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
            margin-top: 20px;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            table-layout: auto;
        }
        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 10px;
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
    </style>
</head>
<body>
    <form id="form22" runat="server">
        <div class="container">
            <h1>Get Customer's Details</h1>
            
            <!-- Plan ID Input -->
            <label for="Planid">Enter a Plan ID:</label>
            <asp:TextBox ID="Planid" runat="server" CssClass="input-text" />
            
            <!-- Date Input -->
            <label for="DateInput">Select a Date:</label>
            <asp:TextBox ID="DateInput" runat="server" CssClass="input-text" TextMode="Date" />

            <!-- Search Button -->
            <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn" OnClick="SearchButton_Click" />

            <!-- Grid Container for Results -->
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

            <!-- Return Button -->
            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
