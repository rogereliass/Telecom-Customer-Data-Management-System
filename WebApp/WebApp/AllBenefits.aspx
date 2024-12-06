<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllBenefits.aspx.cs" Inherits="WebApp.AllBenefits" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Benefits</title>
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
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 90vh;
        }
        h1 {
            margin-bottom: 20px;
            color: #004080;
            font-size: 2.5em;
        }
        .btn {
            padding: 10px 20px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            text-align: center;
            margin-top: 20px;
            width: 100%;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn:hover {
            background-color: #0066cc;
            transform: scale(1.05);
        }
        .btn:active {
            background-color: #003366;
            transform: scale(0.95);
        }
        .grid-container {
            flex: 1;
            overflow-y: auto;
            overflow-x: auto;
            height: 500px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: auto;
        }
        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            font-size: 14px;
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
    <form id="form10" runat="server">
        <div class="container">
            <h1>Get All Available Benefits</h1>
            
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
        </div>
    </form>
</body>
</html>
