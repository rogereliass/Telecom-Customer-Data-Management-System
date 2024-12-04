<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopSuccessfulPayments.aspx.cs" Inherits="WebApp.TopSuccessfulPayments" %>

<!DOCTYPE html>
<html>
<head>
    <title>Top Successful Payments</title>
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
    </style>
</head>
<body>
   <form id="form14" runat="server">
    <div class="container">
        <h1>Top 10 Successful Payments</h1>
        <div class="table-container">
            <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" AutoGenerateColumns="True"></asp:GridView>
        </div>
        <div style="text-align: center; margin-top: 20px;">
            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
        </div>
    </div>
</form>


</body>
</html>

