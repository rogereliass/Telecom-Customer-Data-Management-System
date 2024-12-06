<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllPhysicalStores.aspx.cs" Inherits="WebApp.AllPhysicalStores" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Physical Stores Vouchers</title>
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
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 95%; /* Increased width for more space */
            max-width: 1400px; /* Adjusted for wider layout */
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: auto; /* Adjust height dynamically */
        }

        h1 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
        }

        .btn {
            padding: 12px 24px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .grid-container {
            flex: 1;
            overflow-y: auto; /* Vertical scroll for large data */
            border: 1px solid #ddd;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            table-layout: fixed; /* Keeps column widths consistent */
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            word-wrap: break-word; /* Prevents overflow */
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
    </style>
</head>
<body>
    <form id="form18" runat="server">
        <div class="container">
            <h1>Get All Physical Stores Vouchers</h1>
            
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
