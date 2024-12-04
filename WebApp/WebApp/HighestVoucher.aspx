<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighestVoucher.aspx.cs" Inherits="WebApp.HighestVoucher" %>

<!DOCTYPE html>
<html>
<head>
    <title>Highest Value Voucher </title>
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
        .gridview td {
            font-size: 14px;
        }
        .result-label {
        font-size: 18px;
        font-weight: bold;
        color: #007bff;
        margin-top: 20px;
    }
    </style>
</head>
<body>
    <form id="form12" runat="server">
    <div class="container">
        <h1>This is Your Highest Valued Voucher</h1>
      
        <div>
        <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="" />
        </div>

        <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />


        <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
    </div>
    </form>
</body>
</html>
